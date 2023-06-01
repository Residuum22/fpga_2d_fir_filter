`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 10:05:06 AM
// Design Name: 
// Module Name: axi_data2coeff
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


module axi_data2coeff(
    input rx_clk,
    input microblaze_clk,
    input rst,
    
    //Regiszter ?r?si interf?sz.
    input  [7:0]           wr_addr,
    input                  wr_en, 
    input  [31:0]          wr_data,
    input  [3:0]           wr_strb,

    output signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04,
    output signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14,
    output signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24,
    output signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34,
    output signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44
    );
    
reg signed [15:0] coeff [24:0];
integer i;
initial
begin
    for(i=0;i<25;i=i+1)
        coeff[i] <= 0;
end

reg [31:0] wr_data_dly;
reg wr_en_dly;
always @(posedge microblaze_clk)
begin
    wr_data_dly <= wr_data;
    wr_en_dly <= wr_en;
end

// Converting byte adressing into word adressing 32 bit;
reg [4:0] coeff_addr;
reg [4:0] cntr;
always @(posedge microblaze_clk)
begin
    if(rst)
    begin
        coeff_addr <= 0;
        cntr <= 0;
    end
    else
    begin
        coeff_addr <= wr_addr >> 2;
        if (coeff_addr == 25)
        begin
            coeff_addr <= 0;
            cntr <= 0;
        end  
    end
end

always @(posedge microblaze_clk)
begin
    if (wr_en | wr_en_dly)
        coeff[coeff_addr] <= wr_data_dly[15:0];

end


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
