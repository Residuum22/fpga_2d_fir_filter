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

`define MAX_COLS 1600+4
`define MAX_ROWS 900+4
// Row and col counter
reg [10:0] cols; // max 1600
reg [9:0] rows; // max 900

// Creating BRAM for the first 4 rows
// Need to store four rows to start the convolution because the 
// process can be started real time.
// Maximum image width is 1600 pixel and because of the 5x5 filter the image need to be 
// padded with 2-2 zero pixel so the array length is 2+1600+2 = 1604

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

(* mark_debug="true" *) reg [7:0] rows_bram[4*1604:0];
(* mark_debug="true" *) reg [1:0] row_cntr;
//************************************************************************************
// Padding logic START
//************************************************************************************
// Blanking logic after the vertical sync logic
reg [10:0] cols_fz; // max 1600
reg padding_en;
reg wr_cntr;
wire bram_wr;

assign bram_wr = dv_i;

always @(posedge clk)
begin
    if (bram_wr)
    begin
        case(row_cntr)
            2'b00: rows_bram[0*`MAX_COLS + cols] <= y_i;
            2'b01: rows_bram[1*`MAX_COLS + cols] <= y_i;
            2'b10: rows_bram[2*`MAX_COLS + cols] <= y_i; 
            2'b11: rows_bram[3*`MAX_COLS + cols] <= y_i;
        endcase
        cols <= cols + 1;
    end
    else
    begin
        if (vs_edge_i)
        begin
            // Enable padding and set cols to 0
            padding_en <= 1;
            // The padded part is 0 after configuring the fpga and we should never write in this region 
            // so this should not fill with 0s
            cols_fz <= 2;
            rows <= 0;
            wr_cntr <= 0;
            row_cntr <= 2'b11;
        end
        
        // Start padding to set row to 0 before new frame arrives
        if (padding_en)
        begin
            if (wr_cntr)
                rows_bram[0*`MAX_COLS + cols_fz] <= 0;
            else
                rows_bram[1*`MAX_COLS + cols_fz] <= 0;
            wr_cntr <= ~wr_cntr;
        end
        
        // If max width is qual es max width -1 max width pixel is cleared so
        // disable the padding.
        // And the storing will start at the 3rd row.
        // -2 same thing as at the beginning.
        // TODO: Change this if the timming is not good at lower resolution
        if (cols == 2 * `MAX_COLS - 1 - 2)
        begin
            padding_en <= 0;
        end
    end
    
    if (~dv_i & hs_edge_i)
    begin
        cols <= 2;
        row_cntr <= row_cntr + 1;
    end
end
//************************************************************************************
// Padding logic END
//************************************************************************************

//************************************************************************************
// Convulution and write out START
//************************************************************************************
(* mark_debug="true" *) reg [7:0] y_o_reg;
// TODO: Convolution here
reg dv_o_reg, hs_o_reg, vs_o_reg;
reg [1:0] row_mod_o;

always @(posedge clk)
begin
    y_o_reg <= rows_bram[3 * `MAX_COLS + cols + 3];
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
