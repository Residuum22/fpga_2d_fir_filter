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


module fir_filter(
    input       clk,
    (* mark_debug="true" *) input [7:0] y_i,
    input       dv_i,
    input       hs_i,
    input       vs_i,
    
    (* mark_debug="true" *) output [7:0]     r_o,
    output [7:0]     b_o,
    output [7:0]     g_o,
    (* mark_debug="true" *) output           dv_o,
    (* mark_debug="true" *) output           hs_o,
    (* mark_debug="true" *) output           vs_o
    );

reg [7:0] fir_values[32:0];

// TODO change this to normal 
integer i;
always @(posedge vs_i)
begin
for (i=0; i<25; i=i+1)
    fir_values[i] <= -1;
fir_values[13] <= 1; 
end

// Row and col counter
reg [10:0] cols; // max 1600
reg [9:0] rows; // max 900

// Creating BRAM for the first 4 rows
// Need to store four rows to start the convolution because the 
// process can be started real time.
reg [7:0] row_1[1599:0], row_2[1599:0], row_3[1599:0], row_4[1599:0];
reg [1:0] row_mod;

// Storing information into BRAMs
always @(posedge clk)
    if (vs_i)
    begin
        rows <= 0;  
    end
    else if (hs_i)
    begin
        cols <= 0;
        row_mod <= row_mod + 1;
    end
    else
    begin
        case(row_mod)
            2'b00: row_1[cols] <= y_i;
            2'b01: row_2[cols] <= y_i;
            2'b10: row_3[cols] <= y_i;
            2'b11: row_4[cols] <= y_i;
        endcase
    end
begin

end

// Convolution
always @(posedge clk)
begin

end

reg [7:0] y_o_reg;
reg dv_o_reg, hs_o_reg, vs_o_reg;
always @(posedge clk)
begin
    if (vs_i)
    begin
        rows <= 0;  
    end
    else if (hs_i)
    begin
        cols <= 0;
        row_mod <= row_mod + 1;
    end
    else
    begin
        case(row_mod)
            2'b00: y_o_reg <= row_1[cols];
            2'b01: y_o_reg <= row_2[cols];
            2'b10: y_o_reg <= row_3[cols];
            2'b11: y_o_reg <= row_4[cols];
        endcase
    end
    dv_o_reg <= dv_i;
    hs_o_reg <= hs_i;
    vs_o_reg <= vs_i;
end

assign r_o = y_o_reg;
assign g_o = y_o_reg;
assign b_o = y_o_reg;

assign dv_o = dv_o_reg;
assign hs_o = hs_o_reg;
assign vs_o = vs_o_reg;


endmodule
