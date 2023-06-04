`timescale 1ns / 1ps

module histogram2axi(
    input rx_clk,
    input microblaze_clk,
    input rst,
    
    input [7:0] y_i,
    input dv_i,
    input vs_i,
    
    input cpu_trigger,
    output cpu_signal_done,
    
    input  wire [31:0]          s_axi_araddr,
    input  wire                 s_axi_arvalid,
    output wire                 s_axi_arready,
    
    output wire [31:0]          s_axi_rdata,
    output wire [1:0]           s_axi_rresp,
    output wire                 s_axi_rvalid,
    input  wire                 s_axi_rready        
    );
    
wire [31:0]          rd_addr;
wire                 rd_en;        
wire [31:0]          rd_data;

axi4_lite_if
#(
    .ADDR_BITS(10)
)
axi4_lite_if
(
    .clk(microblaze_clk),
    .rst(rst),          

    .s_axi_araddr(s_axi_araddr),
    .s_axi_arvalid(s_axi_arvalid),
    .s_axi_arready(s_axi_arready),
    
    .s_axi_rdata(s_axi_rdata),
    .s_axi_rresp(s_axi_rresp),
    .s_axi_rvalid(s_axi_rvalid),
    .s_axi_rready(s_axi_rready),
    
    .rd_addr(rd_addr),
    .rd_en(rd_en), 
    .rd_data(rd_data)
);

histogram_calculator hisitogram_calc(
    .clk(rx_clk),
    .microblaze_clk(microblaze_clk),
    
    .rst(rst),
    
    .in_pixel(y_i),
    .in_valid(dv_i),
    .calc_flag(cpu_trigger),
    .end_of_frame(vs_i),
    
    .external_addr_rd(s_axi_araddr[9:2]),
    .external_data_rd(rd_data),
    .external_rd_en(1),
    .out_valid(cpu_signal_done)
);
endmodule
