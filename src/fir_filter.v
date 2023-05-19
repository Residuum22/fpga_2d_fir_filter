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
    input           clk,
    input           rst,
    input [7:0]     y_i,
    input           dv_i,
    input           hs_i,
    input           vs_i,
    
    output [7:0]    r_o,
    output [7:0]    b_o,
    output [7:0]    g_o,
    output          dv_o,
    output          hs_o,
    output          vs_o,
    
    output reg [10:0] x_index,
    output reg [9:0] y_index,
    
    output hs_i_edge,
    
    input [31:0] filter_coeff_data,
    wire filter_coeff_addr
    );

wire [7:0] p0, p1, p2, p3, p4;
wire [7:0] y_o;

wire dv_y, vs_y, hs_y;

storage pixel_buffer(
    .clk(clk),
    .rst(rst),
    .y_i(y_i),
    .dv_i(dv_i),
    .hs_i(hs_i),
    .vs_i(vs_i),
    
    .dv_o(dv_y),
    .hs_o(hs_y),
    .vs_o(vs_y),
    
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .p4(p4)
);

cascade_systolic_fir systolic_fir(
    .clk(clk),
    .rst(rst),
    .in_valid(1),

    .pixel0(p0),
    .pixel1(p1),
    .pixel2(p2),
    .pixel3(p3),
    .pixel4(p4),
    
    .vs_i(vs_y),
    .filter_coeff_data(filter_coeff_data),
    .filter_coeff_addr(filter_coeff_addr),

    .out_pixel(y_o)
);

assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

assign dv_o = dv_y;
assign vs_o = vs_y;
assign hs_o = hs_y;

endmodule
