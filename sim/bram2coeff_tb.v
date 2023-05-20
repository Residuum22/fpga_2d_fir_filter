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

reg [7:0] coeff [24:0];
reg vs_i;

reg [31:0] hwdata_tb, haddr_tb;
reg hwrite;
wire hready;

bram2coeff uut(
    .clk(clk),
    .rst(rst),
    .vs_i(vs_i),
    .haddr(haddr_tb),
    .hwdata(hwdata_tb),
    .hready(hready),
    .hwrite(hwrite),
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
initial
begin
    rst <= 1;
    hwrite <= 0;
    haddr_tb <= 0;
    hwdata_tb <= 0;
    vs_i <= 0;
    #50
    rst <= 0;
    hwrite <= 0;
    haddr_tb <= 0;
    
    for(i=0;i<25;i=i+1)
    begin
        haddr_tb <= i;
        hwrite <= 1;
        #10
        hwdata_tb <= i+10;
    end
    #10
    hwrite <= 0;
    
    #50
    vs_i <= 1;
    
    #20
    vs_i <= 0;

end



endmodule
