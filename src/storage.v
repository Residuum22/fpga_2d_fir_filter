`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.05.2023 09:29:21
// Design Name: 
// Module Name: storage
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
module storage(
    input       clk,
    input       rst,
    input [7:0] y_i,
    input       dv_i,
    input       hs_i,
    input       vs_i,
    
    output           dv_o,
    output           hs_o,
    output           vs_o,
    
    output reg [10:0] x_index,
    output reg [10:0] y_index,
    
    output reg [7:0] pix_mux,
    
    output [7:0] p0, p1, p2, p3, p4
    );

reg [7:0] y_o;
reg     [14:0]  bram_addr_wr;
reg     [10:0]  bram_addr_rd;
wire    [7:0]   bram_data_rd[3:0];
reg    [7:0]   bram_data_wr; 

genvar bram_i;
generate 
    for(bram_i=0;bram_i<4;bram_i=bram_i+1)
    begin
    dp_bram
    #(
        .DEPTH(2000)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(bram_addr_wr[11+bram_i]),
    
        .addr_a(bram_addr_wr[10:0]),
        .addr_b(bram_addr_rd),
        
        .din_a(bram_data_wr),
        .dout_b(bram_data_rd[bram_i])
    );
    end
endgenerate

// Edge detection logic for the hs_i signal
wire vs_i_edge;
wire hs_i_edge;
reg hs_i_dly, vs_i_dly;
always @(posedge clk)
begin
    hs_i_dly <= hs_i;
    vs_i_dly <= vs_i;
end

assign hs_i_edge = hs_i & ~hs_i_dly;
assign vs_i_edge = vs_i & ~vs_i_dly;

// Mux for select signal from the y_i or 0 for padding.
always @(posedge clk)
begin
    case (dv_i)
    1'b0: pix_mux <= 0;
    2'b1: pix_mux <= y_i;
    endcase
end

// Row shift register in the kernel
integer i;
reg [7:0] row_buffer[3:0];

always @(posedge clk)
begin
    if (rst)
    begin
        x_index <= 0;
        y_index <= 0;
        bram_addr_wr[10:0] <= 0;
        bram_addr_rd <= 0;
    end
    else
    begin
        bram_addr_wr[14:11] <= 4'b0001 << (y_index % 4);
        bram_addr_wr[10:0] <= x_index;
        bram_addr_rd <= x_index;
        bram_data_wr <= pix_mux;
        
        if (hs_i_edge)
        begin
            y_index <= y_index + 1;
            x_index <= 0;
        end
        else
        begin
            x_index <= x_index + 1;
        end
        if (vs_i_edge)
        begin
            y_index <= 0;
        end
    end
end

reg [7:0] pix_mux_2clk[1:0];
always @(posedge clk)
begin
    for(i=0;i<2;i=i+1)
    begin
        pix_mux_2clk[i] <= (i==0) ? pix_mux : pix_mux_2clk[i-1];
    end
end

    
reg [7:0] p0_reg, p1_reg, p2_reg, p3_reg, p4_reg;
always @(posedge clk)
begin
    case (y_index % 4)
    3'd0:
    begin
        p0_reg <= bram_data_rd[0];
        p1_reg <= bram_data_rd[1];
        p2_reg <= bram_data_rd[2];
        p3_reg <= bram_data_rd[3];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd1:
    begin
        p0_reg <= bram_data_rd[1];
        p1_reg <= bram_data_rd[2];
        p2_reg <= bram_data_rd[3];
        p3_reg <= bram_data_rd[0];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd2:
    begin
        p0_reg <= bram_data_rd[2];
        p1_reg <= bram_data_rd[3];
        p2_reg <= bram_data_rd[0];
        p3_reg <= bram_data_rd[1];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd3:
    begin
        p0_reg <= bram_data_rd[3];
        p1_reg <= bram_data_rd[0];
        p2_reg <= bram_data_rd[1];
        p3_reg <= bram_data_rd[2];
        p4_reg <= pix_mux_2clk[1];
    end
    default:
    begin
        p0_reg <= 0;
        p1_reg <= 0;
        p2_reg <= 0;
        p3_reg <= 0;
        p4_reg <= 0;
    end
    endcase
end

assign p0 = p0_reg;
assign p1 = p1_reg;
assign p2 = p2_reg;
assign p3 = p3_reg;
assign p4 = p4_reg;

reg dv_o_reg, hs_o_reg, vs_o_reg;
// Assigning the controls, but I need to delay them with one CLK
always @(posedge clk)
begin
    dv_o_reg <= dv_i;
    hs_o_reg <= hs_i;
    vs_o_reg <= vs_i;
end

assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

assign hs_o = hs_o_reg;
assign vs_o = vs_o_reg;
//************************************************************************************
// Convulution and write out END
//************************************************************************************

endmodule

