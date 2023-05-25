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


module axi2coeff(
    input clk,
    input microblaze_clk,
    input rst,
    
    input  wire [31:0]           s_axi_awaddr,
    input  wire                 s_axi_awvalid,
    output wire                 s_axi_awready,
    
    //AXI4-Lite ?r?si adat csatorna.
    input  wire [31:0]          s_axi_wdata,
    input  wire [3:0]           s_axi_wstrb,
    input  wire                 s_axi_wvalid,
    output wire                 s_axi_wready,
    
    //AXI4-Lite ?r?si v?lasz csatorna.
    output wire [1:0]           s_axi_bresp,
    output wire                 s_axi_bvalid,
    input  wire                 s_axi_bready,
    
    output signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04,
    output signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14,
    output signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24,
    output signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34,
    output signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44
    );

//Regiszter ?r?si interf?sz.
wire  [7:0]           wr_addr;        //?r?si c?m
wire                  wr_en;          //?r?s enged?lyez? jel
wire  [31:0]          wr_data;        //?r?si adat
wire  [3:0]           wr_strb;        //B?jt enged?lyez? jelek

axi4_lite_if
#(
    .ADDR_BITS(8)
)
axi4_lite_if
(
    .clk(microblaze_clk),            //Rendszer?rajel
    .rst(rst),            //Akt?v magas szinkron reset
    //AXI4-Lite ?r?si c?m csatorna.
    .s_axi_awaddr(s_axi_awaddr[7:0]),
    .s_axi_awvalid(s_axi_awvalid),
    .s_axi_awready(s_axi_awready),
    
    //AXI4-Lite ?r?si adat csatorna.
    .s_axi_wdata(s_axi_wdata),
    .s_axi_wstrb(s_axi_wstrb),
    .s_axi_wvalid(s_axi_wvalid),
    .s_axi_wready(s_axi_wready),
    
    //AXI4-Lite ?r?si v?lasz csatorna.
    .s_axi_bresp(s_axi_bresp),
    .s_axi_bvalid(s_axi_bvalid),
    .s_axi_bready(s_axi_bready),
    
    //Regiszter ?r?si interf?sz.
    .wr_addr(wr_addr),        //?r?si c?m
    .wr_en(wr_en),          //?r?s enged?lyez? jel
    .wr_data(wr_data),        //?r?si adat
    .wr_strb(wr_strb)        //B?jt enged?lyez? jelek
);

axi_data2coeff axi_data2coeff(
    .microblaze_clk(microblaze_clk),
    .rst(rst),
    
    .wr_addr(wr_addr),        //?r?si c?m
    .wr_en(wr_en),          //?r?s enged?lyez? jel
    .wr_data(wr_data),        //?r?si adat
    .wr_strb(wr_strb),       //B?jt enged?lyez? jelek
    
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

endmodule
