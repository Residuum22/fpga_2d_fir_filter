`timescale 1ns / 1ps

// (* mark_debug="true" *) 
module fir_filter(
    input           clk, // RX_CLK from the HDMI pheripheral
    input           microblaze_clk, // CLK which is the equivalent with the 
    
    input           rst,
    input [7:0]     y_i,
    input           dv_i,
    input           hs_i,
    input           vs_i,
    
    output [7:0]    r_o,
    output [7:0]    b_o,
    output [7:0]    g_o,
    output          dv_o,
    output          hs_o,
    output          vs_o,
    
    output hs_i_edge,
    
    //AXI4-Lite write address channel from the microbalze
    input  wire [31:0]           filter_axi_awaddr,
    input  wire                 filter_axi_awvalid,
    output wire                 filter_axi_awready,
    
    //AXI4-Lite write data channel form the microblaze
    input  wire [31:0]          filter_axi_wdata,
    input  wire [3:0]           filter_axi_wstrb,
    input  wire                 filter_axi_wvalid,
    output wire                 filter_axi_wready,
    
    //AXI4-Lite ?r?si v?lasz csatorna.
    output wire [1:0]           filter_axi_bresp,
    output wire                 filter_axi_bvalid,
    input  wire                 filter_axi_bready
    );

wire  signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04;
wire  signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14;
wire  signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24;
wire  signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34;
wire  signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44;

axi2coeff axi2coeff(
    .clk(clk),
    .microblaze_clk(microblaze_clk),
    
    //AXI4-Lite ?r?si c?m csatorna.
    .s_axi_awaddr(filter_axi_awaddr[7:0]),
    .s_axi_awvalid(filter_axi_awvalid),
    .s_axi_awready(filter_axi_awready),
    
    //AXI4-Lite ?r?si adat csatorna.
    .s_axi_wdata(filter_axi_wdata),
    .s_axi_wstrb(filter_axi_wstrb),
    .s_axi_wvalid(filter_axi_wvalid),
    .s_axi_wready(filter_axi_wready),
    
    //AXI4-Lite ?r?si v?lasz csatorna.
    .s_axi_bresp(filter_axi_bresp),
    .s_axi_bvalid(filter_axi_bvalid),
    .s_axi_bready(filter_axi_bready),
    
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


wire [7:0] p0, p1, p2, p3, p4;
wire [7:0] y_o;

wire dv_y, vs_y, hs_y;

storage pixel_buffer(
    .clk(clk),
    .rst(rst),
    .y_i(y_i),
    .dv_i(dv_i),
    .hs_i(hs_i),
    .vs_i(vs_i),
    
    .dv_o(dv_y),
    .hs_o(hs_y),
    .vs_o(vs_y),
    
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .p4(p4)
);

cascade_systolic_fir systolic_fir(
    .clk(clk),
    .rst(rst),
    .in_valid(1),

    .pixel0(p0),
    .pixel1(p1),
    .pixel2(p2),
    .pixel3(p3),
    .pixel4(p4),
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

    .out_pixel(y_o)
);

assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

assign dv_o = dv_y;
assign vs_o = vs_y;
assign hs_o = hs_y;

endmodule
