`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2023 01:02:37 PM
// Design Name: 
// Module Name: bram2coeff_tb
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


module bram2coeff_tb;

reg clk;
reg rst;

wire signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04;
wire  signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14;
wire  signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24;
wire  signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34;
wire  signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44;

reg [7:0] wr_addr;
reg wr_en;
reg [31:0] wr_data;
reg [3:0] wr_strb;

axi_data2coeff uut(
    .microblaze_clk(clk),
    .rst(rst),
   
    .wr_addr(wr_addr),        //?r?si c?m
    .wr_en(wr_en),          //?r?s enged?lyez? jel
    .wr_data(wr_data),        //?r?si adat
    .wr_strb(wr_strb),
    
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

always 
begin
    clk = 1'b1; #5; 
    clk = 1'b0; #5;
end

integer i;

reg [4:0] cntr;

initial
begin
    rst <= 1;
    wr_addr <= 0;
    
    wr_en <= 0;
    wr_data <= 0;
    wr_strb <= 4'b1111;
    
    cntr <= 0;

    #50
    rst <= 0;
    
    for(i=0;i<25;i=i+1)
    begin
        #10
        wr_addr <= (i * 4);
        wr_data <= i+10;
        wr_en <= 1;
    end
    #10
    wr_en <= 0;
end



endmodule
