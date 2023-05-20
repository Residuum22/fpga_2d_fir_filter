`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2023 12:49:11 PM
// Design Name: 
// Module Name: bram2coeff
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


module bram2coeff(
    input clk,
    input rst,
    input vs_i,
    
    input [31:0] haddr,
    input [31:0] hwdata,
    output hready,
    input hwrite,
    
    output signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04,
    output signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14,
    output signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24,
    output signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34,
    output signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44
    );

reg vs_i_dly;
wire vs_i_edge;

always @(posedge clk)
begin
    vs_i_dly <= vs_i;
end

assign vs_i_edge = vs_i & ~vs_i_dly;

reg [5:0] addr;
reg en = 0;
wire [15:0] filter_coeff_data;

reg [31:0] haddr_dly;
always @(posedge clk)
begin
    haddr_dly <= haddr;
end

dp_bram
    #(
        .DEPTH(25),
        .WIDTH(16)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(hwrite),
    
        .addr_a(haddr_dly[10:0]),
        .addr_b({5'b00000, addr}),
        
        .din_a(hwdata[15:0]),
        .dout_b(filter_coeff_data)
    );


reg signed [15:0] coeff [24:0];
integer i;
initial
begin
    for(i=0;i<25;i=i+1)
        coeff[i] <= 0;
end


always @(posedge clk)
begin
    if (vs_i_edge)
    begin
        addr <= 0;
        en <= 1;
    end
    
    if (en)
    begin
        coeff[addr-1] <= filter_coeff_data[15:0];
        addr <= addr + 1;
    end
    
    if (addr == 25)
    begin
        en <= 0;
        addr <= 0; 
    end   
end

assign hready = 1'b1;

assign coeff00 = coeff[0];
assign coeff01 = coeff[1];
assign coeff02 = coeff[2];
assign coeff03 = coeff[3];
assign coeff04 = coeff[4];

assign coeff10 = coeff[5];
assign coeff11 = coeff[6];
assign coeff12 = coeff[7];
assign coeff13 = coeff[8];
assign coeff14 = coeff[9];

assign coeff20 = coeff[10];
assign coeff21 = coeff[11];
assign coeff22 = coeff[12];
assign coeff23 = coeff[13];
assign coeff24 = coeff[14];

assign coeff30 = coeff[15];
assign coeff31 = coeff[16];
assign coeff32 = coeff[17];
assign coeff33 = coeff[18];
assign coeff34 = coeff[19];

assign coeff40 = coeff[20];
assign coeff41 = coeff[21];
assign coeff42 = coeff[22];
assign coeff43 = coeff[23];
assign coeff44 = coeff[24];

endmodule
