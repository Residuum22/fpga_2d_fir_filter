`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/13/2023 11:14:19 AM
// Design Name: 
// Module Name: tb_filter_window
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


module tb_filter_window();
    
    reg clk = 1;
    reg rst = 1;
    reg valid = 0;
    
    always #5 clk <= ~clk;
    
    reg [7:0] pixel00 = 0, pixel01 = 1, pixel02 = 2, pixel03 = 3, pixel04 = 4;
    reg [7:0] pixel10 = 5, pixel11 = 6, pixel12 = 7, pixel13 = 8, pixel14 = 9;
    reg [7:0] pixel20 = 9, pixel21 = 8, pixel22 = 7, pixel23 = 6, pixel24 = 5;
    reg [7:0] pixel30 = 4, pixel31 = 3, pixel32 = 2, pixel33 = 1, pixel34 = 0;
    reg [7:0] pixel40 = 0, pixel41 = 1, pixel42 = 2, pixel43 = 3, pixel44 = 4;
    
    reg [15:0] coeff00 = 17'hFF00, coeff01 = 17'hFF00, coeff02 = 17'hFF00, coeff03 = 17'hFF00, coeff04 = 17'hFF00;
    reg [15:0] coeff10 = 17'hFF00, coeff11 = 17'hFF00, coeff12 = 17'hFF00, coeff13 = 17'hFF00, coeff14 = 17'hFF00;
    reg [15:0] coeff20 = 17'hFF00, coeff21 = 17'hFF00, coeff22 = 17'h1800, coeff23 = 17'hFF00, coeff24 = 17'hFF00;
    reg [15:0] coeff30 = 17'hFF00, coeff31 = 17'hFF00, coeff32 = 17'hFF00, coeff33 = 17'hFF00, coeff34 = 17'hFF00;
    reg [15:0] coeff40 = 17'hFF00, coeff41 = 17'hFF00, coeff42 = 17'hFF00, coeff43 = 17'hFF00, coeff44 = 17'hFF00;
    
    reg [7:0] pixel0, pixel1, pixel2, pixel3, pixel4;
    
    reg [7:0] res = 75;
    
    wire [7:0] out_pixel;
    wire out_valid;
    
    reg dv_i = 0;
    reg hs_i = 0;
    reg vs_i = 0;
    wire dv_o;
    wire hs_o;
    wire vs_o;
    
    cascade_systolic_fir filt(
        .clk(clk),
        .rst(rst),
        .in_valid(valid),
        .dv_i(dv_i), 
        .hs_i(hs_i), 
        .vs_i(vs_i),
        .dv_o(dv_o), 
        .hs_o(hs_o), 
        .vs_o(vs_o),
		.pixel0(pixel0),
		.pixel1(pixel1),
		.pixel2(pixel2),
		.pixel3(pixel3),
		.pixel4(pixel4),
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
		.out_valid(out_valid),
		.out_pixel(out_pixel)
    );
    
    initial 
    begin
    #20 
    rst = 0;
    #10
    valid = 1;
    dv_i = 1; 
    hs_i = 1; 
    vs_i = 1;
    pixel0 = pixel00;
    pixel1 = pixel10;
    pixel2 = pixel20;
    pixel3 = pixel30;
    pixel4 = pixel40;
    #10
    pixel0 = pixel01;
    pixel1 = pixel11;
    pixel2 = pixel21;
    pixel3 = pixel31;
    pixel4 = pixel41;
    #10
    pixel0 = pixel02;
    pixel1 = pixel12;
    pixel2 = pixel22;
    pixel3 = pixel32;
    pixel4 = pixel42;
    #10
    valid = 0;
    dv_i = 0; 
    hs_i = 0; 
    vs_i = 0;
    pixel0 = pixel03;
    pixel1 = pixel13;
    pixel2 = pixel23;
    pixel3 = pixel33;
    pixel4 = pixel43;
    #10
    pixel0 = pixel04;
    pixel1 = pixel14;
    pixel2 = pixel24;
    pixel3 = pixel34;
    pixel4 = pixel44;
    #10
    pixel0 = pixel04;
    pixel1 = pixel14;
    pixel2 = pixel24;
    pixel3 = pixel34;
    pixel4 = pixel44;
    #10
    pixel0 = pixel03;
    pixel1 = pixel13;
    pixel2 = pixel23;
    pixel3 = pixel33;
    pixel4 = pixel43;
    #60
    res = 8'h2e;
    #10
    res = 8'h13;
    
    end
    //always #10 pixel22 = (pixel22 + 1) % 3;
    
endmodule
