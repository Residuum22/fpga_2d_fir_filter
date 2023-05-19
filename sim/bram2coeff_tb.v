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
wire [31:0] rd_data;
reg [31:0] wr_data;
wire [5:0] bram_addr_rd;
reg [5:0] bram_addr_wr;
reg wr_en;
reg vs_i;

wire signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04;
wire  signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14;
wire  signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24;
wire  signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34;
wire  signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44;

dp_bram
    #(
        .DEPTH(25),
        .WIDTH(32)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(wr_en),
    
        .addr_a({5'b00000, bram_addr_wr}),
        .addr_b({5'b00000, bram_addr_rd}),
        
        .din_a(wr_data),
        .dout_b(rd_data)
    );

reg [7:0] coeff [24:0];
wire en;

bram2coeff uut(
    .clk(clk),
    .rst(rst),
    .filter_coeff_data(rd_data),
    .filter_coeff_addr(bram_addr_rd),
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
    .coeff44(coeff44),
    .en_d(en)
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
    wr_en <= 0;
    #50
    rst <= 0;
    vs_i <= 0;
    bram_addr_wr <= 0;
    
    for(i=0;i<25;i=i+1)
    begin
        #10
        bram_addr_wr <= i;
        wr_en <= 1;
        wr_data <= i;
    end
    #10
    wr_en <= 0;
    vs_i <= 1;
    
    #20
    vs_i <= 0;
    
    #300
    vs_i <= 1;
    
    #20
    vs_i <= 0;
    
end



endmodule
