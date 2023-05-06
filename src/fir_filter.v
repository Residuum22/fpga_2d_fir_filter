`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.05.2023 18:36:50
// Design Name: 
// Module Name: fir_filter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fir_filter(
    input       clk,
    input       rst,
    (* mark_debug="true" *) input [7:0] y_i,
    input       dv_i,
    input       hs_i,
    input       vs_i,
    
    (* mark_debug="true" *) output [7:0]     r_o,
    output [7:0]     b_o,
    output [7:0]     g_o,
    (* mark_debug="true" *) output           dv_o,
    (* mark_debug="true" *) output           hs_o,
    (* mark_debug="true" *) output           vs_o
    );
     
localparam MAX_COLS = 1600;
localparam MAX_ROWS = 900;

reg [10:0] cols; // max 1600
reg [9:0] rows; // max 900

//************************************************************************************
// Edge detection for VS and HS logic START
//************************************************************************************
reg vs_dly, hs_dly, dv_dly;
(* mark_debug="true" *) wire vs_edge_i, hs_edge_i, dv_edge_i;
always @(posedge clk)
begin
    vs_dly <= vs_i;
    hs_dly <= hs_i; 
    dv_dly <= dv_i;
end

assign vs_edge_i = ~vs_dly & vs_i;
assign hs_edge_i = ~hs_dly & hs_i;
assign dv_edge_i = ~dv_dly & dv_i;
//************************************************************************************
// Edge detection for VS and HS logic END
//************************************************************************************


//************************************************************************************
// BRAM logic START
//************************************************************************************
// With one port of the BRAM the data will be written into the RAM
// With the second port of the BRAM the data will be read from the RAM

// TODO check sythesis result because the with this configuration one 36Kb BRAM is used with
// two 18Kb configuration. 2k x 9bit = 18000 bit RAM. 

// BRAM 1 instance
reg bram1_wr;
reg [10:0] bram1_addr_wr, bram1_addr_rd;
reg [7:0] bram1_data_wr, bram1_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS)
)
dp_bram1 (
    .clk(clk),

    .we_a(bram1_wr),
    .we_b(0),

    .addr_a(bram1_addr_wr),
    .addr_b(bram1_addr_rd),

    .din_a(bram1_data_wr),
    .din_b(bram1_data_wr),

    .dout_a(bram1_data_rd),
    .dout_b(bram1_data_rd),
);

// BRAM 2 instance
reg bram2_wr;
reg [10:0] bram2_addr_wr, bram_2_addr_rd;
reg [7:0] bram2_data_wr, bram2_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS)
)
dp_bram2 (
    .clk(clk),

    .we_a(bram2_wr),
    .we_b(0),

    .addr_a(bram2_addr_wr),
    .addr_b(bram2_addr_rd),

    .din_a(bram2_data_wr),
    .din_b(bram2_data_wr),

    .dout_a(bram2_data_rd),
    .dout_b(bram2_data_rd),
);

//************************************************************************************
// BRAM logic END
//************************************************************************************


//************************************************************************************
// Row storing START
//************************************************************************************
reg bram_row_modulo;

// Write need to happen after 1 CLK because I don't want to write and read
// at the same time. If I would do that I need to check more about the BRAM 
reg [3:0] shift_signals;
wire y_i_p1, dv_i_p1, hs_i_p1, vs_i_p1;
// Assign controls with one CLK delay.
always @ (posedge clk)
    shift_signals <= {y_i, dv_i, hs_i, vs_i};

assign y_i_p1  = shift_signals[3];
assign dv_i_p1 = shift_signals[2];
assign hs_i_p1 = shift_signals[1];
assign vs_i_p1 = shift_signals[0];

// Writing row into the BRAM
always @(posedge clk)
begin
    if (rst | vs_i_p1)
    begin
        bram_row_modulo <= 0;
    end
    else
    begin
        // Saving in the ram.
        if (bram_row_modulo == 0)
        begin
            if (dv_i_p1)
            begin
                bram2_wr <= 0;
                bram1_wr <= 1;
                bram1_data_wr <= y_i_p1;
                bram1_addr_wr <= cols;
            end
        end
        else
        begin
            if (dv_i_p1)
            begin
                bram1_wr <= 0;
                bram2_wr <= 1;
                bram2_data_wr <= y_i_p1;
                bram2_addr_wr <= cols;
            end
        end

        if (hs_i_p1)
        begin
            bram_row_modulo <= bram_row_modulo + 1;
        end
    end
end

//************************************************************************************
// Row storing END
//************************************************************************************

//************************************************************************************
// Convulution and write out START
//************************************************************************************

// For the convolution I need for dsp blocks.

reg [7:0] row1_data[2:0], row2_data[2:0], row3_data[2:0];
reg [10:0] dsp_start_flag_reg;
wire dsp_start_enable;

assign dsp_start_enable = dsp_start_flag_reg >= 2 ? 1 : 0; 

always @(posedge clk)
begin
    if (rst)
    begin
        dsp_start_flag_reg <= 0;
    end
    else
    // First two row is only getting the image
    if (rows >= 2 & dv_i)
    begin
        // Collecting the frame m-1
        bram1_addr_rd <= cols;
        // Check this because it should be  shift register.
        for (integer i = 0; i < 3; i = i + 1)
            row1_data[i] <= i==0 ? bram1_data_rd : row1_data[i-1];

        // Collectin the frame m element
        bram2_addr <= cols;
        for (integer i = 0; i < 3; i = i + 1)
            row2_data[i] <= i==0 ? bram2_data_rd : row2_data[i-1];

        //Collecting the frame m+1 element
        dsp3_input <= y_i;
        for (integer i = 0; i < 3; i = i + 1)
            row3_data[i] <= i==0 ? y_i : row3_data[i-1];

        dsp_start_flag_reg <= dsp_start_flag_reg + 1;
    end
end

// Calculation with dsps
reg kernel [2:0][2:0];
reg unsigned [31:0] sum_row1, sum_row2, sum_row3, sum_y;
(* mark_debug="true" *) reg [7:0] y_o_reg;

always @(posedge clk)
begin
    if (rst)
    begin
        kernel[0][0] <= -1;
        kernel[0][1] <= -1;
        kernel[0][2] <= -1;

        kernel[1][0] <= -1;
        kernel[1][1] <= 1;
        kernel[1][2] <= -1;

        kernel[2][0] <= -1;
        kernel[2][1] <= -1;
        kernel[2][2] <= -1;
    end

    if (dv_i)
    begin
        if (cols >= 2 & cols <= (MAX_COLS - 2) & rows >= 2 & rows <= (MAX_ROWS - 2)) 
        begin
            sum_row1 <= row1_data[0] * kernel[0][0] + row1_data[1] * kernel[0][1] + row1_data[2] * kernel[0][2];
            sum_row2 <= row2_data[0] * kernel[1][0] + row2_data[1] * kernel[1][1] + row2_data[2] * kernel[1][2];
            sum_row3 <= row3_data[0] * kernel[2][0] + row3_data[1] * kernel[2][1] + row3_data[2] * kernel[2][2];
            sum_y <= sum_row1 + sum_row2 + sum_row3;
            y_o_reg <= sum_y > 255 ? 255 : sum_y[7:0];
        end
    end
end


reg dv_o_reg, hs_o_reg, vs_o_reg;

// Assigning the controls, but I need to delay them with one CLK
always @(posedge clk)
begin
    dv_o_reg <= dv_i;
    hs_o_reg <= hs_i;
    vs_o_reg <= vs_i;
end

assign r_o = y_o_reg;
assign g_o = y_o_reg;
assign b_o = y_o_reg;

assign dv_o = dv_o_reg;
assign hs_o = hs_o_reg;
assign vs_o = vs_o_reg;
//************************************************************************************
// Convulution and write out END
//************************************************************************************

endmodule
