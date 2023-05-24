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
    input           microblaze_clk,
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
    
    input [31:0] filter_addr,
    input filter_addr_valid, 
    output filter_addr_ready,

    input [31:0] filter_data,
    input filter_data_valid, 
    output filter_data_ready
    );

wire  signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04;
wire  signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14;
wire  signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24;
wire  signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34;
wire  signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44;

bram2coeff coefficient_storage(
    .clk(clk),
    .microblaze_clk(microblaze_clk),
    
    .filter_addr(filter_addr),
    .filter_addr_valid(filter_addr_valid), 
    .filter_addr_ready(filter_addr_ready),

    .filter_data(filter_data),
    .filter_data_valid(filter_data_valid), 
    .filter_data_ready(filter_data_ready),
    
    .vs_i(vs_i),
    .coeff00(coeff00), 
    .coeff01(coeff01), 
    .coeff02(coeff02), 
    .coeff03(coeff03), 
    .coeff04(coeff04),
    .coeff10(coeff10), 
    .coeff11(coeff11),
    .coeff12(coeff12),
    .coeff13(coeff13),
    .coeff14(coeff14),
    .coeff20(coeff20),
    .coeff21(coeff21),
    .coeff22(coeff22),
    .coeff23(coeff23), 
    .coeff24(coeff24),
    .coeff30(coeff30), 
    .coeff31(coeff31), 
    .coeff32(coeff32), 
    .coeff33(coeff33), 
    .coeff34(coeff34),
    .coeff40(coeff40),
    .coeff41(coeff41),
    .coeff42(coeff42),
    .coeff43(coeff43),
    .coeff44(coeff44)
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
    .coeff00(coeff00), 
    .coeff01(coeff01), 
    .coeff02(coeff02), 
    .coeff03(coeff03), 
    .coeff04(coeff04),
    .coeff10(coeff10), 
    .coeff11(coeff11),
    .coeff12(coeff12),
    .coeff13(coeff13),
    .coeff14(coeff14),
    .coeff20(coeff20),
    .coeff21(coeff21),
    .coeff22(coeff22),
    .coeff23(coeff23), 
    .coeff24(coeff24),
    .coeff30(coeff30), 
    .coeff31(coeff31), 
    .coeff32(coeff32), 
    .coeff33(coeff33), 
    .coeff34(coeff34),
    .coeff40(coeff40),
    .coeff41(coeff41),
    .coeff42(coeff42),
    .coeff43(coeff43),
    .coeff44(coeff44),

    .out_pixel(y_o)
);

assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

assign dv_o = dv_y;
assign vs_o = vs_y;
assign hs_o = hs_y;

endmodule
