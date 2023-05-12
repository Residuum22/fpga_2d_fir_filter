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
// (* mark_debug="true" *) 
module fir_filter(
    input       clk,
    input       rst,
    input [7:0] y_i,
    input       dv_i,
    input       hs_i,
    input       vs_i,
    
    output [7:0]     r_o,
    output [7:0]     b_o,
    output [7:0]     g_o,
    output           dv_o,
    output           hs_o,
    output           vs_o,
    
    output [7:0] pixel_00, pixel_01, pixel_02, pixel_03, pixel_04,
    output [7:0] pixel_10, pixel_11, pixel_12, pixel_13, pixel_14,
    output [7:0] pixel_20, pixel_21, pixel_22, pixel_23, pixel_24,
    output [7:0] pixel_30, pixel_31, pixel_32, pixel_33, pixel_34,
    output [7:0] pixel_40, pixel_41, pixel_42, pixel_43, pixel_44,
    
    output reg [10:0] x_index,
    output reg [9:0] y_index,
    
    output hs_i_edge
    );
     
localparam FILTER_H = 5;
localparam FILTER_W = 5;
localparam MAX_COLS = 1600+4;
localparam MAX_ROWS = 900+4;

reg [7:0] y_o;
reg     [14:0]  bram_addr_wr[3:0];
reg     [10:0]  bram_addr_rd[3:0];
wire    [7:0]   bram_data_rd[3:0];
reg     [7:0]   bram_data_wr[3:0]; 

genvar bram_i;
generate 
    for(bram_i=0;bram_i<4;bram_i=bram_i+1)
    begin
    dp_bram
    #(
        .DEPTH(MAX_COLS + 4)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(bram_addr_wr[bram_i][11+bram_i]),
    
        .addr_a(bram_addr_wr[bram_i][10:0]),
        .addr_b(bram_addr_rd[bram_i]),
        
        .din_a(bram_data_wr[bram_i]),
        .dout_b(bram_data_rd[bram_i])
    );
    end
endgenerate

// Edge detection logic for the hs_i signal
reg hs_i_dly;
always @(posedge clk)
    hs_i_dly <= hs_i;
begin
assign hs_i_edge = hs_i & ~hs_i_dly;
    
end
// Row shift register in the kernel
integer i;
reg [7:0] row0[4:0], row1[4:0], row2[4:0], row3[4:0], row4[4:0];
always @(posedge clk)
begin
    if (rst | vs_i)
    begin
        for(i=0;i<5;i=i+1)
        begin
            row0[i] <= 0;
            row1[i] <= 0;
            row2[i] <= 0;
            row3[i] <= 0;
            row4[i] <= 0;
        end
        x_index <= 0;
        y_index <= 0;
    end
    if (dv_i)
    begin
        for(i=0;i<5;i=i+1)
        begin
            // Indexing 0-bottom row
            // 4 top row shift register
            row0[i] <= (i==0) ? y_i : row0[i-1];
            
            bram_addr_rd[0] <= x_index;
            row1[i] <= (i==0) ? bram_data_rd[0] : row1[i-1];
            
            bram_addr_rd[1] <= x_index;
            row2[i] <= (i==0) ? bram_data_rd[1] : row2[i-1];
            
            bram_addr_rd[2] <= x_index;
            row3[i] <= (i==0) ? bram_data_rd[2] : row3[i-1];
            
            bram_addr_rd[3] <= x_index;
            row4[i] <= (i==0) ? bram_data_rd[3] : row4[i-1];
        end
        
        bram_addr_wr[0][10:0] <= x_index;
        bram_data_wr[0] <= row1[4];
        bram_addr_wr[0][14:11] <= 4'b0001;
        
        bram_addr_wr[1][10:0] <= x_index;
        bram_data_wr[1] <= row2[4];
        bram_addr_wr[1][14:11] <= 4'b0010;
        
        bram_addr_wr[2][10:0] <= x_index;
        bram_data_wr[2] = row3[4];
        bram_addr_wr[2][14:11] <= 4'b0100;
        
        bram_addr_wr[3][10:0] <= x_index;
        bram_data_wr[3] <= row4[4];
        bram_addr_wr[3][14:11] <= 4'b1000;
        
        x_index <= x_index + 1;
    end
    if (hs_i_edge)
    begin
        y_index <= y_index + 1;
        x_index <= 0;
    end
end

assign pixel_00 = row0[0];
assign pixel_01 = row0[1];
assign pixel_02 = row0[2];
assign pixel_03 = row0[3];
assign pixel_04 = row0[4];

assign pixel_10 = row1[0];
assign pixel_11 = row1[1];
assign pixel_12 = row1[2];
assign pixel_13 = row1[3];
assign pixel_14 = row1[4];

assign pixel_20 = row2[0];
assign pixel_21 = row2[1];
assign pixel_22 = row2[2];
assign pixel_23 = row2[3];
assign pixel_24 = row2[4];

assign pixel_30 = row3[0];
assign pixel_31 = row3[1];
assign pixel_32 = row3[2];
assign pixel_33 = row3[3];
assign pixel_34 = row3[4];

assign pixel_40 = row4[0];
assign pixel_41 = row4[1];
assign pixel_42 = row4[2];
assign pixel_43 = row4[3];
assign pixel_44 = row4[4];

reg dv_o_reg, hs_o_reg, vs_o_reg;
// Assigning the controls, but I need to delay them with one CLK
always @(posedge clk)
begin
    dv_o_reg <= dv_i;
    hs_o_reg <= hs_i;
    vs_o_reg <= vs_i;
end

assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

assign dv_o = dv_o_reg;
assign hs_o = hs_o_reg;
assign vs_o = vs_o_reg;
//************************************************************************************
// Convulution and write out END
//************************************************************************************

endmodule
