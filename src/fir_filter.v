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
// BRAM logic START
//************************************************************************************
// With one port of the BRAM the data will be written into the RAM
// With the second port of the BRAM the data will be read from the RAM

// TODO check sythesis result because the with this configuration one 36Kb BRAM is used with
// two 18Kb configuration. 2k x 9bit = 18000 bit RAM.
 
// 11 bit for address selection
// 4 bit for write enable of BRAM 
(* mark_debug="true" *) reg     [14:0]  bram_addr_wr;
// 10 bit for address selection for the another port
(* mark_debug="true" *) reg     [10:0]  bram_addr_rd[3:0];
// Bram data read and write register
(* mark_debug="true" *) wire    [7:0]   bram_data_rd[3:0];
(* mark_debug="true" *) reg     [7:0]   bram_data_wr; 

genvar bram_i;
generate
    for(bram_i = 0; bram_i < 4; bram_i = bram_i + 1)
    begin
        dp_bram
        #(
            .DEPTH(MAX_COLS + 4)
        )
        (
            .clk(clk),

            .we_a(bram_addr_wr[11+bram_i]),
        
            .addr_a(bram_addr_wr[10:0]),
            .addr_b(bram_addr_rd[bram_i]),
            
            .din_a(bram_data_wr),
            .dout_b(bram_data_rd[bram_i])
        );
    end
endgenerate

//************************************************************************************
// BRAM logic END
//************************************************************************************


//************************************************************************************
// Row storing START
//************************************************************************************
// Assign controls with one CLK delay.
// Writing row into the BRAM
always @(posedge clk)
begin
    if (rst | vs_i)
    begin
        rows <= 0;
    end
    else if (dv_i)
    begin
        // Saving in the ram.
        bram_addr_wr[14:11] <= (4'b0001 << (rows % 4));  
        cols <= cols + 1;
        bram_addr_wr[10:0] <= cols;
        bram_data_wr <= y_i;
        
        if (hs_i)
        begin
            rows <= rows + 1;
            cols <= 0;
        end
    end
end

////************************************************************************************
//// Row storing END
////************************************************************************************

////************************************************************************************
//// Convulution and write out START
////************************************************************************************
//// For the convolution I need for dsp blocks.
reg [7:0] row1_data[4:0], row2_data[4:0], row3_data[4:0], row4_data[4:0], row5_data[4:0];

integer ii;

always @(posedge clk)
begin
    // First two row is only getting the image
    if (rows >= 4 & dv_i)
    begin
        for (ii = 0; ii < 4; ii = ii + 1)
            bram_addr_rd[ii] = cols;
            
        // Collecting the frame m-2
        // Check this because it should be  shift register.
        for (ii = 0; ii < 5; ii = ii + 1)
        begin
            row1_data[ii] = ii==0 ? bram_data_rd[0] : row1_data[ii-1];
            row2_data[ii] = ii==0 ? bram_data_rd[1] : row2_data[ii-1];
            row3_data[ii] = ii==0 ? bram_data_rd[2] : row3_data[ii-1];
            row4_data[ii] = ii==0 ? bram_data_rd[3] : row4_data[ii-1];
            row5_data[ii] = ii==0 ? y_i : row5_data[ii-1];
        end
    end
end

// Calculation with dsps
// Creating a kernel with 25 element
reg signed [7:0] kernel[24:0];
(* mark_debug="true" *) reg [31:0] sum_row1, sum_row2, sum_row3, sum_row4, sum_row5, sum_y;
(* mark_debug="true" *) reg [7:0] y_o_reg;

always @(posedge clk)
begin
    if (rst)
    begin
        for (ii = 0; ii < 25; ii = ii + 1)
        begin
            kernel[ii] = -1.2;
        end
        kernel[13] = 1;
    end

    if (dv_i)
    begin
        // MAX_COLS because MAX_COLS +1 and +2 are 0-s
        if (cols >= 2 & cols <= (MAX_COLS) & rows >= 2 & rows <= (MAX_ROWS)) 
        begin
            sum_row1 <= row1_data[0] * kernel[0] + row1_data[1] * kernel[1] + row1_data[2] * kernel[2] + row1_data[3] * kernel[3] + row1_data[4] * kernel[4];
            sum_row2 <= row2_data[0] * kernel[5] + row2_data[1] * kernel[6] + row2_data[2] * kernel[7] + row2_data[3] * kernel[8] + row2_data[4] * kernel[9];
            sum_row3 <= row3_data[0] * kernel[10] + row3_data[1] * kernel[11] + row3_data[2] * kernel[12] + row3_data[3] * kernel[13] + row3_data[4] * kernel[14];
            sum_row4 <= row4_data[0] * kernel[15] + row4_data[1] * kernel[16] + row4_data[2] * kernel[17] + row4_data[3] * kernel[18] + row4_data[4] * kernel[19];
            sum_row5 <= row5_data[0] * kernel[20] + row5_data[1] * kernel[21] + row5_data[2] * kernel[22] + row5_data[3] * kernel[23] + row5_data[4] * kernel[24];
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
