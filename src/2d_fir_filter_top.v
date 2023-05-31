`timescale 1ns / 1ps

module fir_project_top(
   input  wire       clk100M,
   input  wire       rstbt,
   output wire [7:0] led_r,
   input  wire [7:0] sw,
   inout  wire [3:0] bt,
   
   input  wire       hdmi_rx_d0_p,
   input  wire       hdmi_rx_d0_n,
   input  wire       hdmi_rx_d1_p,
   input  wire       hdmi_rx_d1_n,
   input  wire       hdmi_rx_d2_p,
   input  wire       hdmi_rx_d2_n,
   input  wire       hdmi_rx_clk_p,
   input  wire       hdmi_rx_clk_n,
   input  wire       hdmi_rx_cec,
   output wire       hdmi_rx_hpd,
   input  wire       hdmi_rx_scl,
   inout  wire       hdmi_rx_sda,
   
   output wire       hdmi_tx_d0_p,
   output wire       hdmi_tx_d0_n,
   output wire       hdmi_tx_d1_p,
   output wire       hdmi_tx_d1_n,
   output wire       hdmi_tx_d2_p,
   output wire       hdmi_tx_d2_n,
   output wire       hdmi_tx_clk_p,
   output wire       hdmi_tx_clk_n,
   input  wire       hdmi_tx_cec,
   input  wire       hdmi_tx_hpdn,
   input  wire       hdmi_tx_scl,
   input  wire       hdmi_tx_sda,
   
   output wire      uart_rtl_0_txd,
   input wire      uart_rtl_0_rxd
);

wire [31:0] filter_axi_awaddr;
wire filter_axi_awvalid, filter_axi_awready;

wire [31:0] filter_axi_wdata;
wire filter_axi_wvalid, filter_axi_wready;
wire [3:0] filter_axi_wstrb; 

wire filter_axi_bready, filter_axi_bvalid;
wire [1:0] filter_axi_bresp;


wire histogram_axi_arready, histogram_axi_arvalid;
wire [31:0] histogram_axi_araddr;

wire [31:0] histogram_axi_rdata;
wire histogram_axi_rvalid, histogram_axi_rready;
wire [1:0] histogram_axi_rresp;

// Microbalze block design wrapper to give
// clk reset signal to the microbalze
// wire out the axi lite bus with uart.
fir_microblaze_wrapper microbalze
(
   .clk100M(clk100M),
   .rstbt(rstbt),
   
   // Axi address write channel
   .M03_AXI_0_awaddr(filter_axi_awaddr),
   .M03_AXI_0_awready(filter_axi_awready),
   .M03_AXI_0_awvalid(filter_axi_awvalid),
    
    // Axi data write channel
   .M03_AXI_0_wdata(filter_axi_wdata),
   .M03_AXI_0_wready(filter_axi_wready),
   .M03_AXI_0_wstrb(filter_axi_wstrb),
   .M03_AXI_0_wvalid(filter_axi_wvalid),
   
   // Axi response channel
   .M03_AXI_0_bready(filter_axi_bready),
   .M03_AXI_0_bresp(filter_axi_bresp),
   .M03_AXI_0_bvalid(filter_axi_bvalid),
   
   .M04_AXI_0_araddr(histogram_axi_araddr),
   .M04_AXI_0_arready(histogram_axi_arready),
   .M04_AXI_0_arvalid(histogram_axi_arvalid),
    
   .M04_AXI_0_rdata(histogram_axi_rdata),
   .M04_AXI_0_rready(histogram_axi_rready),
   .M04_AXI_0_rresp(histogram_axi_rresp),
   .M04_AXI_0_rvalid(histogram_axi_rvalid),
    
    // Uart output.
   .uart_rtl_0_rxd(uart_rtl_0_rxd),
   .uart_rtl_0_txd(uart_rtl_0_txd)
);

//******************************************************************************
//* Generating the 200 MHz reference clock for the IDELAYCTRL.                 *
//******************************************************************************
wire clk200M;
wire pll_clkfb;
wire pll_locked;

PLLE2_BASE #(
   .BANDWIDTH("OPTIMIZED"),         // OPTIMIZED, HIGH, LOW
   .CLKFBOUT_MULT(10),              // Multiply value for all CLKOUT, (2-64)
   .CLKFBOUT_PHASE(0.0),            // Phase offset in degrees of CLKFB, (-360.000-360.000).
   .CLKIN1_PERIOD(1000.0 / 100.0),  // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
   .CLKOUT0_DIVIDE(5),              // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
   .CLKOUT1_DIVIDE(1),
   .CLKOUT2_DIVIDE(1),
   .CLKOUT3_DIVIDE(1),
   .CLKOUT4_DIVIDE(1),
   .CLKOUT5_DIVIDE(1),
   .CLKOUT0_DUTY_CYCLE(0.5),        // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
   .CLKOUT1_DUTY_CYCLE(0.5),
   .CLKOUT2_DUTY_CYCLE(0.5),
   .CLKOUT3_DUTY_CYCLE(0.5),
   .CLKOUT4_DUTY_CYCLE(0.5),
   .CLKOUT5_DUTY_CYCLE(0.5),
   .CLKOUT0_PHASE(0.0),             // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
   .CLKOUT1_PHASE(0.0),
   .CLKOUT2_PHASE(0.0),
   .CLKOUT3_PHASE(0.0),
   .CLKOUT4_PHASE(0.0),
   .CLKOUT5_PHASE(0.0),
   .DIVCLK_DIVIDE(1),               // Master division value, (1-56)
   .REF_JITTER1(0.0),               // Reference input jitter in UI, (0.000-0.999).
   .STARTUP_WAIT("FALSE")           // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
) clk_generator1 (
   .CLKOUT0(clk200M),               // 1-bit output: CLKOUT0
   .CLKOUT1(),                      // 1-bit output: CLKOUT1
   .CLKOUT2(),                      // 1-bit output: CLKOUT2
   .CLKOUT3(),                      // 1-bit output: CLKOUT3
   .CLKOUT4(),                      // 1-bit output: CLKOUT4
   .CLKOUT5(),                      // 1-bit output: CLKOUT5
   .CLKFBOUT(pll_clkfb),            // 1-bit output: Feedback clock
   .LOCKED(pll_locked),             // 1-bit output: LOCK
   .CLKIN1(clk100M),                // 1-bit input: Input clock
   .PWRDWN(1'b0),                   // 1-bit input: Power-down
   .RST(rstbt),                     // 1-bit input: Reset
   .CLKFBIN(pll_clkfb)              // 1-bit input: Feedback clock
);

wire rst;
assign rst = ~pll_locked;

wire clk_200M;
BUFG BUFG_200M (
   .O(clk_200M),
   .I(clk200M)
);


wire rx_clk, rx_clk_5x;
wire [7:0] rx_red, rx_green, rx_blue;
wire rx_dv, rx_hs, rx_vs;
wire [5:0] rx_status;
hdmi_rx hdmi_rx_0(
   .clk_200M(clk_200M),
   .rst(rst),
   .hdmi_rx_cec(hdmi_rx_cec),
   .hdmi_rx_hpd(hdmi_rx_hpd),
   .hdmi_rx_scl(hdmi_rx_scl),
   .hdmi_rx_sda(hdmi_rx_sda),
   .hdmi_rx_clk_p(hdmi_rx_clk_p),
   .hdmi_rx_clk_n(hdmi_rx_clk_n),
   .hdmi_rx_d0_p(hdmi_rx_d0_p),
   .hdmi_rx_d0_n(hdmi_rx_d0_n),
   .hdmi_rx_d1_p(hdmi_rx_d1_p),
   .hdmi_rx_d1_n(hdmi_rx_d1_n),
   .hdmi_rx_d2_p(hdmi_rx_d2_p),
   .hdmi_rx_d2_n(hdmi_rx_d2_n),
   .rx_clk(rx_clk),
   .rx_clk_5x(rx_clk_5x),
   .rx_red(rx_red),
   .rx_green(rx_green),
   .rx_blue(rx_blue),
   .rx_dv(rx_dv),
   .rx_hs(rx_hs),
   .rx_vs(rx_vs),
   .rx_status(rx_status)
);

// Gray scaling the image from the color componenet
// Algorithm is written in the module.
wire [7:0] y;
wire [7:0] tx_red, tx_green, tx_blue;
wire y_dv, y_hs, y_vs;

rgb2y rgb2y_0(
    .clk  (rx_clk),

    .kr_i (27865),   // 0.2126
    .kb_i (9463),    // 0.0722

    .dv_i (rx_dv),
    .hs_i (rx_hs),
    .vs_i (rx_vs),
    .r_i  (rx_red),
    .g_i  (rx_green),
    .b_i  (rx_blue),

    .dv_o (y_dv),
    .hs_o (y_hs),
    .vs_o (y_vs),
    .y_o  (y)
);

histogram2axi histogram_top(
    .rx_clk(rx_clk),
    .microblaze_clk(clk100),
    
    .y_i(y),
    .dv_i(y_dv),
    .cpu_trigger(),
    .cpu_signal_done(),
    
    .s_axi_araddr(histogram_axi_araddr[7:0]),
    .s_axi_arvalid(histogram_axi_arvalid),
    .s_axi_arready(histogram_axi_arready),
    
    .s_axi_rdata(histogram_axi_rdata),
    .s_axi_rresp(histogram_axi_rresp),
    .s_axi_rvalid(histogram_axi_rvalid),
    .s_axi_rready(histogram_axi_rready)
);

// Central module the fir filter. 
// This module has submodules 
//  - axi2coeff: Write out to the coefficient input of the fir filter which is form comming from the axi
//  - pixel_storage: Store 5 row of the image in BRAMs
//  - systolic_fir: Convolution module
wire tx_dv, tx_hs, tx_vs;

fir_filter fir_filter_0(
    .clk(rx_clk),
    .microblaze_clk(clk100M),
    .rst(rstbt),
    .y_i(y),
    .dv_i(y_dv),
    .hs_i(y_hs),
    .vs_i(y_vs),
    
    .r_o(tx_red),
    .g_o(tx_green),
    .b_o(tx_blue),
    .dv_o(tx_dv),
    .hs_o(tx_hs),
    .vs_o(tx_vs),
    
    .filter_axi_awaddr(filter_axi_awaddr),
    .filter_axi_awvalid(filter_axi_awvalid), 
    .filter_axi_awready(filter_axi_awready),

    .filter_axi_wdata(filter_axi_wdata),
    .filter_axi_wvalid(filter_axi_wvalid),
    .filter_axi_wready(filter_axi_wready),
    .filter_axi_wstrb(filter_axi_wstrb),

    .filter_axi_bready(filter_axi_bready), 
    .filter_axi_bvalid(filter_axi_bvalid),
    .filter_axi_bresp(filter_axi_bresp)
);

hdmi_tx hdmi_tx_0(
   .tx_clk(rx_clk),
   .tx_clk_5x(rx_clk_5x),
   .rst(rst),
   .tx_red(tx_red),
   .tx_green(tx_green),
   .tx_blue(tx_blue),
   .tx_dv(tx_dv),
   .tx_hs(tx_hs),
   .tx_vs(tx_vs),
   .hdmi_tx_clk_p(hdmi_tx_clk_p),
   .hdmi_tx_clk_n(hdmi_tx_clk_n),
   .hdmi_tx_d0_p(hdmi_tx_d0_p),
   .hdmi_tx_d0_n(hdmi_tx_d0_n),
   .hdmi_tx_d1_p(hdmi_tx_d1_p),
   .hdmi_tx_d1_n(hdmi_tx_d1_n),
   .hdmi_tx_d2_p(hdmi_tx_d2_p),
   .hdmi_tx_d2_n(hdmi_tx_d2_n)
);

assign led_r = {pll_locked, 1'b0, rx_status};

endmodule
