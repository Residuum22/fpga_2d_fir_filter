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
reg [7:0] bram1_data_wr;
wire [7:0] bram1_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS+4)
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
    .dout_b(bram1_data_rd)
);

// BRAM 2 instance
reg bram2_wr;
reg [10:0] bram2_addr_wr, bram2_addr_rd;
reg [7:0] bram2_data_wr; 
wire [7:0] bram2_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS+4)
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
    .dout_b(bram2_data_rd)
);

// BRAM 3 
reg bram3_wr;
reg [10:0] bram3_addr_wr, bram3_addr_rd;
reg [7:0] bram3_data_wr;
wire [7:0] bram3_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS+4)
)
dp_bram3 (
    .clk(clk),

    .we_a(bram3_wr),
    .we_b(0),

    .addr_a(bram3_addr_wr),
    .addr_b(bram3_addr_rd),

    .din_a(bram3_data_wr),
    .din_b(bram3_data_wr),

    .dout_a(bram3_data_rd),
    .dout_b(bram3_data_rd)
);

// BRAM4
reg bram4_wr;
reg [10:0] bram4_addr_wr, bram4_addr_rd;
reg [7:0] bram4_data_wr;
wire [7:0] bram4_data_rd;

dp_bram 
#(
    .DEPTH (MAX_COLS+4)
)
dp_bram4 (
    .clk(clk),

    .we_a(bram4_wr),
    .we_b(0),

    .addr_a(bram4_addr_wr),
    .addr_b(bram4_addr_rd),

    .din_a(bram4_data_wr),
    .din_b(bram4_data_wr),

    .dout_a(bram4_data_rd),
    .dout_b(bram4_data_rd)
);

//************************************************************************************
// BRAM logic END
//************************************************************************************


//************************************************************************************
// Row storing START
//************************************************************************************
// Assign controls with one CLK delay.
// Writing row into the BRAM
reg [10:0] wr_cols;
always @(posedge clk)
begin
    if (rst | vs_i)
    begin
        wr_cols <= 2;
        rows <= 0;
    end
    else if (dv_i)
    begin
        // Saving in the ram.
        case (rows % 4)
        2'd0:
        begin
            bram1_wr <= 1;
            bram2_wr <= 0;
            bram3_wr <= 0;
            bram4_wr <= 0;
            bram1_data_wr <= y_i;
            bram1_addr_wr <= wr_cols;
        end
        2'd1:
        begin
            bram1_wr <= 0;
            bram2_wr <= 1;
            bram3_wr <= 0;
            bram4_wr <= 0;
            bram1_data_wr <= y_i;
            bram1_addr_wr <= wr_cols;
        end
        2'd2:
        begin
            bram1_wr <= 0;
            bram2_wr <= 0;
            bram3_wr <= 1;
            bram4_wr <= 0;
            bram1_data_wr <= y_i;
            bram1_addr_wr <= wr_cols;
        end
        2'd3:
        begin
            bram1_wr <= 0;
            bram2_wr <= 0;
            bram3_wr <= 0;
            bram4_wr <= 1;
            bram1_data_wr <= y_i;
            bram1_addr_wr <= wr_cols;
        end
        endcase
        
        wr_cols <= wr_cols + 1;
        
        if (hs_i)
        begin
            wr_cols <= 2;
            rows <= rows + 1;
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
reg [7:0] row1_data[4:0], row2_data[4:0], row3_data[4:0], row4_data[4:0], row5_data[4:0];
integer i;

always @(posedge clk)
begin
    if (rst)
    begin
        cols <= 2;
    end
    else
    // First two row is only getting the image
    if (rows >= 4 & dv_i)
    begin
        // Collecting the frame m-2
        bram1_addr_rd <= cols;
        // Check this because it should be  shift register.
        for (i = 0; i < 5; i = i + 1)
            row1_data[i] = i==0 ? bram1_data_rd : row1_data[i-1];

        // Collecting the frame m-1
        bram2_addr_rd <= cols;
        for (i = 0; i < 5; i = i + 1)
            row2_data[i] = i==0 ? bram2_data_rd : row2_data[i-1];

        // Collecting the frame m
        for (i = 0; i < 5; i = i + 1)
            row3_data[i] = i==0 ? bram3_data_rd : row3_data[i-1];
            
        // Collecting the frame m+1
        for (i = 0; i < 5; i = i + 1)
            row4_data[i] = i==0 ? bram4_data_rd : row4_data[i-1];
            
        // Collecting the frame m+2
        for (i = 0; i < 5; i = i + 1)
            row5_data[i] = i==0 ? y_i : row5_data[i-1];

        cols <= cols + 1;
    end
end

// Calculation with dsps
reg kernel [4:0][4:0];
reg [31:0] sum_row1, sum_row2, sum_row3, sum_row4, sum_row5, sum_y;
(* mark_debug="true" *) reg [7:0] y_o_reg;

always @(posedge clk)
begin
    if (rst)
    begin
        kernel[0][0] <= -1.2;
        kernel[0][1] <= -1.2;
        kernel[0][2] <= -1.2;
        kernel[0][3] <= -1.2;
        kernel[0][4] <= -1.2;

        kernel[1][0] <= -1.2;
        kernel[1][1] <= -1.2;
        kernel[1][2] <= -1.2;
        kernel[1][3] <= -1.2;
        kernel[1][4] <= -1.2;

        kernel[2][0] <= -1.2;
        kernel[2][1] <= -1.2;
        kernel[2][2] <= 1;
        kernel[2][3] <= -1.2;
        kernel[2][4] <= -1.2;
        
        kernel[3][0] <= -1.2;
        kernel[3][1] <= -1.2;
        kernel[3][2] <= -1.2;
        kernel[3][3] <= -1.2;
        kernel[3][4] <= -1.2;
        
        kernel[4][0] <= -1.2;
        kernel[4][1] <= -1.2;
        kernel[4][2] <= -1.2;
        kernel[4][3] <= -1.2;
        kernel[4][4] <= -1.2;
    end

    if (dv_i)
    begin
        // MAX_COLS because MAX_COLS +1 and +2 are 0-s
        if (cols >= 2 & cols <= (MAX_COLS) & rows >= 2 & rows <= (MAX_ROWS)) 
        begin
            sum_row1 <= row1_data[0] * kernel[0][0] + row1_data[1] * kernel[0][1] + row1_data[2] * kernel[0][2] + row1_data[3] * kernel[0][3] + row1_data[4] * kernel[0][4];
            sum_row2 <= row2_data[0] * kernel[1][0] + row2_data[1] * kernel[1][1] + row2_data[2] * kernel[1][2] + row2_data[3] * kernel[1][3] + row2_data[4] * kernel[1][4];
            sum_row3 <= row3_data[0] * kernel[2][0] + row3_data[1] * kernel[2][1] + row3_data[2] * kernel[2][2] + row3_data[3] * kernel[2][3] + row3_data[4] * kernel[2][4];
            sum_row4 <= row4_data[0] * kernel[3][0] + row4_data[1] * kernel[3][1] + row4_data[2] * kernel[3][2] + row4_data[3] * kernel[3][3] + row4_data[4] * kernel[3][4];
            sum_row5 <= row5_data[0] * kernel[4][0] + row5_data[1] * kernel[4][1] + row5_data[2] * kernel[4][2] + row5_data[3] * kernel[4][3] + row5_data[4] * kernel[4][4];
            sum_y <= sum_row1 + sum_row2 + sum_row3 + sum_row4 + sum_row5;
            
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
