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
    
    //AXI4-Lite write response channel
    output wire [1:0]           filter_axi_bresp,
    output wire                 filter_axi_bvalid,
    input  wire                 filter_axi_bready
    );

// 5x5 kernel coefficients from the axi2coeff to filter with DSPs.
wire  signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04;
wire  signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14;
wire  signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24;
wire  signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34;
wire  signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44;

// This module convert the 32 bit data from axi4-lite into an 5x5 kernel
axi2coeff axi2coeff(
    .clk(clk),
    .microblaze_clk(microblaze_clk),
    
    .s_axi_awaddr(filter_axi_awaddr[7:0]),
    .s_axi_awvalid(filter_axi_awvalid),
    .s_axi_awready(filter_axi_awready),
    
    .s_axi_wdata(filter_axi_wdata),
    .s_axi_wstrb(filter_axi_wstrb),
    .s_axi_wvalid(filter_axi_wvalid),
    .s_axi_wready(filter_axi_wready),
    
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

// This module stores 5 row from the incomming image and gives
// 5 pixels back which is the five pixel of the current col. 
// There is one delay between the sync signals.
storage pixel_buffer(
    .clk(clk), // The unit run with the rx_clk
    .rst(rst), 
    // Image data with the sync signals.
    .y_i(y_i),
    .dv_i(dv_i),
    .hs_i(hs_i),
    .vs_i(vs_i),
    
    // 1 clk delay sync signals for the dsp-s
    .dv_o(dv_y),
    .hs_o(hs_y),
    .vs_o(vs_y),
    
    // Output pixels for the systolic fir filter.
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .p4(p4)
);

// Cascade systolic fir filter.
// 1 systolic fir have 5 dsp blocks because the kernel has 5 cols.
// And there is 5 cascade systolic filter because the filter has 5 rows.
cascade_systolic_fir systolic_fir(
    .clk(clk), // The unit runs from the rx_clk.
    .rst(rst),
    .in_valid(dv_y),
    .dv_i(dv_y),
    .hs_i(hs_y),
    .vs_i(vs_y),
    // Comment: The systolic fir is always running soin this way there is zero-padding on the image.

    // The incoming 5 pixels for the systolic fir.
    .pixel0(p0),
    .pixel1(p1),
    .pixel2(p2),
    .pixel3(p3),
    .pixel4(p4),
    
    // Coefficients from the microblaze
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
    
    // Filtered pixel
    .out_pixel(y_o),
    .out_valid(dv_o),
    .dv_o(dv_o),
    .vs_o(vs_o),
    .hs_o(hs_o)
);

// Because this is a gary scaled image all output has the same value.
assign r_o = y_o;
assign g_o = y_o;
assign b_o = y_o;

endmodule
