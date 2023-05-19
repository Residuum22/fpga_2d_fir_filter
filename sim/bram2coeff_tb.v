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

reg [31:0] rd_data;
reg [31:0] wr_data;
reg [5:0] bram_addr_rd;
reg vs_i;
always 
begin
    clk = 1'b1; #5; 
    clk = 1'b0; #5;
end

dp_bram
    #(
        .DEPTH(25),
        .WIDTH(32)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(1),
    
        .addr_a(1),
        .addr_b(bram_addr_rd),
        
        .din_a(wr_data),
        .dout_b(rd_data)
    );

reg [7:0] coeff [24:0];

bram2coeff uut(
    .clk(clk),
    .filter_coeff_data(rd_data),
    .filter_coeff_addr(bram_addr_rd),
    .vs_i(vs_i)
    
//    output signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04,
//    output signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14,
//    output signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24,
//    output signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34,
//    output signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44,
    
//    output wire en_d
);

endmodule
