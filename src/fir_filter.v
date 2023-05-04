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
    input       rst,
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
     
localparam MAX_COLS = 1600;
localparam MAX_ROWS = 900;

reg [10:0] cols; // max 1600
reg [9:0] rows; // max 900

//************************************************************************************
// Edge detection for VS and HS logic START
//************************************************************************************
reg vs_dly, hs_dly, dv_dly;
(* mark_debug="true" *) wire vs_edge_i, hs_edge_i, dv_edge_i;
always @(posedge clk)
begin
    vs_dly <= vs_i;
    hs_dly <= hs_i; 
    dv_dly <= dv_i;
end

assign vs_edge_i = ~vs_dly & vs_i;
assign hs_edge_i = ~hs_dly & hs_i;
assign dv_edge_i = ~dv_dly & dv_i;
//************************************************************************************
// Edge detection for VS and HS logic END
//************************************************************************************


//************************************************************************************
// Convulution and write out START
//************************************************************************************
// Row and col counter

// BRAM 1 instance
reg ram11_wr;
reg ram12_wr;
reg [10:0] ram11_addr, ram_12_addr;
reg [7:0] ram11_data, ram12_data;

dp_bram 
#(
    .DEPTH (2 * MAX_COLS)
)
dp_bram1 (
    .clk(clk),
    .we_a(ram11_wr),
    .we_n(ram12_wr),
    .addr_a(ram11_addr),
    .addr_b(ram_12_addr),
    .din_a(ram11_data),
    .dout_b(ram12_data)
);

// BRAM 2 instance
reg ram21_wr;
reg ram22_wr;
reg [10:0] ram21_addr, ram_22_addr;
reg [7:0] ram21_data, ram22_data;

dp_bram 
#(
    .DEPTH (2 * MAX_COLS)
)
dp_bram2 (
    .clk(clk),
    .we_a(ram21_wr),
    .we_n(ram22_wr),
    .addr_a(ram21_addr),
    .addr_b(ram_22_addr),
    .din_a(ram21_data),
    .dout_b(ram22_data)
);

reg [1:0] bram_cntr;
always @(posedge clk)
begin
    if (rst)
    begin
        bram_cntr <= 0;
    end
    else
    begin
        // Saving in the ram.
        if (bram_cntr == 0)
        begin
            ram21_wr <= 0;
            ram11_wr <= 1;
            ram11_data <= y_i;
            ram11_addr <= cols;
        end
        else
        begin
            ram12_wr <= 0;
            ram11_wr <= 1;
            ram11_data <= y_i;
            ram11_addr <= cols;
        end
    end
end

reg dsp1_input, dsp2_input, dsp3_input;
reg rows_count = 0;
always @(posedge clk)
begin
    // First two row is only getting the image
    if (rows >= 2 & dv_i)
    begin
        // Collecting the frame m-1
        ram11_addr <= rows * (rows_count  * MAX_COLS) + cols;
        dsp1_input <= ram11_data;
        // Collectin the frame m-1 element
        ram11_addr <= rows * ((rows_count + 1)  * MAX_COLS) + cols;
        dsp2_input <= ram11_data;
        //Collecting the frame m element
        dsp3_input <= y_i;
        
        rows_count <= rows_count + 1;
    end
end

// Calculation with dsps
reg [31:0] sum;
always @(posedge clk)
begin
    
end

(* mark_debug="true" *) reg [7:0] y_o_reg;
// TODO: Convolution here
reg dv_o_reg, hs_o_reg, vs_o_reg;
reg [1:0] row_mod_o;

always @(posedge clk)
begin
    y_o_reg <= y_i;
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
//************************************************************************************
// Convulution and write out END
//************************************************************************************

endmodule
