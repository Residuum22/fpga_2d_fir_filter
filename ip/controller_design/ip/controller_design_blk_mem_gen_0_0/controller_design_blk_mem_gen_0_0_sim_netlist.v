// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Thu May 18 16:18:48 2023
// Host        : MarkPC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/mihal/development/fpga_2d_fir_filter/ip/controller_design/ip/controller_design_blk_mem_gen_0_0/controller_design_blk_mem_gen_0_0_sim_netlist.v
// Design      : controller_design_blk_mem_gen_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbg676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "controller_design_blk_mem_gen_0_0,blk_mem_gen_v8_4_5,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_5,Vivado 2022.2" *) 
(* NotValidForBitStream *)
module controller_design_blk_mem_gen_0_0
   (clka,
    rsta,
    ena,
    wea,
    addra,
    dina,
    douta,
    clkb,
    rstb,
    enb,
    web,
    addrb,
    dinb,
    doutb,
    rsta_busy,
    rstb_busy);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA RST" *) input rsta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [31:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTB, MEM_SIZE 32, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE BRAM_CTRL, READ_WRITE_MODE READ_WRITE, READ_LATENCY 1" *) input clkb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB RST" *) input rstb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB EN" *) input enb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB WE" *) input [3:0]web;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB ADDR" *) input [31:0]addrb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DIN" *) input [31:0]dinb;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTB DOUT" *) output [31:0]doutb;
  output rsta_busy;
  output rstb_busy;

  wire [31:0]addra;
  wire [31:0]addrb;
  wire clka;
  wire [31:0]dina;
  wire [31:0]dinb;
  wire [31:0]douta;
  wire [31:0]doutb;
  wire ena;
  wire enb;
  wire rsta;
  wire rsta_busy;
  wire rstb;
  wire rstb_busy;
  wire [3:0]wea;
  wire [3:0]web;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "32" *) 
  (* C_ADDRB_WIDTH = "32" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
  (* C_COMMON_CLK = "1" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "2" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "1" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "1" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     10.7492 mW" *) 
  (* C_FAMILY = "kintex7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "1" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "1" *) 
  (* C_HAS_RSTB = "1" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "controller_design_blk_mem_gen_0_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "2" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "2048" *) 
  (* C_READ_DEPTH_B = "2048" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "1" *) 
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "2048" *) 
  (* C_WRITE_DEPTH_B = "2048" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  controller_design_blk_mem_gen_0_0_blk_mem_gen_v8_4_5 U0
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addra[12:2],1'b0,1'b0}),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,addrb[12:2],1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb(dinb),
        .douta(douta),
        .doutb(doutb),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(enb),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[31:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(rsta),
        .rsta_busy(rsta_busy),
        .rstb(rstb),
        .rstb_busy(rstb_busy),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[31:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web(web));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2022.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VHPlDkoDlWlBfBMvPBmGYmaek3s9hXXhjF28kllYPnaNm3TSnzzpXHWHc8Ye9/2L2yiQfJ1hTWou
Ia/zeQ8h9/dtr6QB5YkyW4wlb/LbMgXb+DGIXPSllNl0IMsRQIcQDbcQm1bO/nlhb+2pjxiuaQrl
DbvxoDwPs7z3LunRxsg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
lmIhoX8hXuc7tNV1sXY1K2/gXL7Y7Hq73qQF7+x03UWWTRd3uhGmVQtOMVbhIW+66UkWUHiD26zL
fzqGor8bgSNGpSFyS11k4TwLQT4OfAMGO8C9Qmmh4+VENBnpS9TW+wHzCv8oUwht7xYtYRZvOvYK
F3fMppz2sBkUd1lciw98ZE/UmNkhqBuMfIYF43j45DEJ55PBhOZNg91Ls4v3qBHyBAaYPFFoMry3
d5Fw1PZyFQSEOSSpwgyds2aN0g6oIwl7zm0LJrM9VDAOxBUE50hk+oHr4jj8J8UhHQJnlEHm1Idm
rvxKygNKRvfSpa90NYxZJFYgqnrMYg+19+9aZA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
VkyCjO2onoeZWEoYQ/4ue7X5mkHyTYVW9xjdoTsGS4GdP/Q64VaCZL/jr6R8DVDXPMnH7tRMrDpo
jpYBnyzSgOkfgqM+96ioC2fDyAaG4gYgGLmrBR6qK3/mxXwAZZX+GJ9R/eWXkc9h8xN+gsSSX6/M
jIQCgeT6q7PB4dWT6KY=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Iub91V+TnhVlZCSLu6iKmFjix71y6/l83OPTs8uewWvkE7WcqYxEKi9fonXEkzAtWzuKwEUqnOlN
VBsNJqPUdKcd22q523mrdt89mpdosWD+hvZdO7ELhJniY5u9h49FFkubpN2JiUTcIcKEYxVNlds4
wyvaYUqbPVH5v2ooJwDdimS4GVn9HerCOgPwfshvQDNlMTxLcYju4v8BHMc5Rub9Q/ihvpQU74v2
ouZ9XIwA+C6pBLwvaqS8jE7HXOokgqJilaX/W/t+KEgiFry/txRTMU9WMD7tCN7lcfjCydmS3Lq+
3u6Hsr0S8BwNjcaDpZDnBTygUJd4JSqREnk33w==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
U46EWFmKmpZGaWfyL+dokyQtJtaOYsa7HCW/+fdtw9/yHKTWFpmqKBZngBj5rPkNhtTDDCJkqsYj
tUXg1j4tgIBaCQn9B0q/aG+B3gPLrudp9hLL25mVbsfiTzdekiV2hJMmhuMoavKKPJHC6zyW7kZi
80er82OQy8h+Df/fe6TRjH9xEt3/b80tRKUMbxkLfnnkAyyf1KfOhB6/uyI4mwXuQR+DsAbzybKR
YtXpOiW72tGrXTFlzcwbHamWZefqsilVpBw6V5dh33vYKGx50xwWpj76maAkpQrOpB7zufeldJe4
W1UOEN84AZdRTLkVSxamWo/wp8nP9fiGS/ItRw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2021_07", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
qczgIJYpE/SzErzK7eWJBGcDFEzDLm8cKbwJbPXuM6YnJxx44W+E60R3war7K2QGFAkOoCDUtDC7
SghJGF32btaDLzeKm0tQ669sBtQmMIaBrlt7I9QBkNM8zN9GL92qxNC9o3UVWMOYy5BmH8nUPgcE
O6lRubeltlrTuDe7UJQ2nEPHcXjpUJJ8dxktyW+LovBy1OxW8g4GRAsmEJsoOEg0HuDdWcc4IshJ
PvwPJ7LblELAKsdkSt65y9VaklaEm7MlH4ImlgIa74TgRmutLUbWxM1QYhGE5rAzFhGU5i3RJOdx
L3N7GGGvLMW2z9NSHbIFX+/eNII9fNJ9nZbgLA==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ti1NUgDv8YPk90APMwfu/mRr38QYwAxZfv0T6zQ89YS55t2EquEGVqrEafYX6rTydLOw8le1Oucv
f2oERpSSSTih/ScZneSZmuPE/Zh2BU1Ajv0j+/+0uEWXU+5lLPbDJjnapTmJXih1MYPf0SHpZZmE
BKj2IEBI9MPZlh6bxpa5BWJnyPdAvHf+UNaMXU9+pmbtrzUVebql4mFJu45Z3+ehmFY4FBW3zXMF
44C4TlHACLwL3vHVMCVfeKhgdVDbpE+/IFhTStz7mZ9h9RKGanQcs6YDVM1R+2RKA1QT1fX4FiQc
1V+FGmrm1ujxmFGXwpfNKByVlfCY0oWhRJCYYQ==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
HuEXFK0NXt09xU2yxxjng1OLsT+ZEM4EhqBgpr9D2ljw2vDaMBrqEsRQTc2B9soDq3ewDduHJXBd
OGYxkPnoN6LhjULtB2nTgjcH6NxA4puZ1ZNcndDndVBo8rTW5W1OqHq6InAG0CqPpTIkuqz3ECPl
EysI++MCDfH6tIzlekxJFIJ1McJsTq5rFuLzMMcrmkBxgcayDpOcCFuzZzCczxmt/cCCIKmDybwT
OQXmOcLJoYLP4sFu6R9c6xO8i6p++crv2N3eIxZHKbek9xBBZqQM9EYuEtsbkqAs9XZpa16i5njR
BDFxTKcP6r7JgFALJE89AZhBbate5JXWp0v4ECZD18aEL17CipwcWPutNMdG1apzSPP5y59n7rMG
yxBPz1gKHc3Emkl4WcO0hjICxqmO6dMXoY8JvBSf6ry2l0sH9Ihr3Bq5WWmlhPHnoaNr5jl//vNe
KfToWtn97eoVSt1LnmXXnSpdigbHr0UIg8AdkpdkuNRaWdVicDdgSo49

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mokwst2bn6UxD6V9UdIgCIG1QQ/d0FiJqYGOTI2eHPV6YElaLjnJ8DnQmZnGS95o3x93FDOoa58C
RwYsX1fVoVtXkj1LuZq0k7q9vEe4T8xMjpkeYtIHY9k0Xhy1Lq/xRlfzGAf9fvf9e+f4r7aR/Sb/
uCZxxugG5niTwLENY1n3NthYL0jvo8Fmdw4Qg0nTCGWlVCws+09K0g9/lx6I9EcuHHemcHO3fOZG
lMc4NaPNozKwnyDMoWUkwiVxyFEPFaQLNYqzjvR+CqrWfhFLo96JWhL+eaDoNuZoBVYQtNH5ZwBL
BoO27Pw10lgcReGlZBz3BLO7T4ddynCx0+eSnw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PiP7AjOQqqouyQMoBQqgWIDhUSViq94rIvGiIJ/UKMDspM/yXw1caE8AhWHTjYckC4yLpPAz5P6s
1Z6flzDPrzVwg4e59X2cc4IMCHhedna0rDO804njcc6amRDTeLsMLTkWfvomB4xwszm2AgT+PRnB
WHd09ZUDVFjiBXT+Oa9AicgGJHrX3w823yBPuAa704kje/SzgtiDpcTU1eLmLhLW7LpEd9KIHd9s
ER7Uk9Orws0Kq9PMTqMX4hMn5K5mFakOeOURiEbUjdv5RiIJ2g/PlQXSItM8fHsBTQa6fOaJwQTI
vHwK3a8ZBHpfT1YH+n7wNiNUZwD4SFXm1QVx4g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Ul5ZfTHJwMctaNhYRortUZizYMPYRef7uYqPSuMkxsArnxI/cjGh+KRMwzV86hyp/6TXSJIjm5ec
2wX2UONdPN+DOJ84jYC4JbgJQrPnTj7ioD8uLX/WlyPcQzyF5keqFgj5eR5s13FskVWCuAWf5m9w
mhFEKFjVXDAr7gVgAJh/hL8P6Psrnf+LGfiM8JhnDepsHEYykGlpD3fzru2BGgqHWqPqFMcnyVGl
vysaIXiJz/eYKvO8RGcgd3DJAM/wPm9A0m/DWcmSnczOgTjoqkHcBg2H5uJMLvufzmjImi6LYEqq
v04ESDEN31cSUzqUYcayvMFOnI/WNsWbFIa5+Q==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 57888)
`pragma protect data_block
WuS2Rrc7OjEDea2oMBxrOri0lQWb2FKsuF7t2rwkCBdWrYF9JtXbX00OuiHRsE4Bn5JDzoZVjGil
SE1yqKpSxLZRCaNZCb/O3UcsxhZDG22QF1v0kuYgp03mVXxHo02olU4Ud1bzhPJ3rDjSPgeqtXqd
IRf5NAGSDY+2wXvahPH3q+yCg/WCnVJGvAFsnVsiYHlI7tH6R1PykaABov/wABw6P3mvEiOpQNaw
fFzd+IhPa2A2OPig9i1b7s1W+SletX8hfHwR6y4UDhEYByaj+xjDHF/jhN7oEZrGqZOzG7NX9tNS
/IQ5pYpSbRW4ybuoTp0rdWrVh555yxZcJQDcmKotzdllxdboZN6t8vOFZoqbhJXqmLajg+gtj0RY
CymjWWJy9sZJ0+Mzf4CP/7D79XR4TCEBX7kXV16KaLpp2qb+TwHu1VEzyCq1IPYxhQhFgGGwGluX
ScF1rYUeSgqK5XtOiLOCvwWfDOvRMIdQdKHd4fjpoHUahHn1/CMtqnAKV9mwoef5V9EGtXP5ne6Z
/Ih44PgVpWy4fBdY7nzyVmJ0sQbxEFaB8t1J+SvmvzIbO5iwI7Oh0EE++6/IZxyARtMOBpK9HsGN
Xr81riksgwcvzFsQC5xm6Y0sSfWaBSA1KElovzYrF5+aDEs9AK46JRRwZanqrhd3v0HBsN3z1pXV
WOAay2LLSpF6TUbCoK62/6CWTfTnt8P2GhucYL0OJ5BdRkV2ufeu09PWLRSvSeiX58ZTux5xQuVQ
wBYctvO8XtlIktjhBRbBu8YzB0s6lRpjDmHGU1kNbdOYQA/lc0g4q3vBXKhxoqBEgf+/H1oXvFJ+
UNRZjrQHjyZ6cAztP4WgwfIo1n53cA2LHLgn2T02KIjpoAV3DR7qAEh11ASK4MIDj79guAVZenIM
BZsEv0IUHE3aSTI8iLDnZJpliBnc6sEBZyqhJva91BWCTqUN3zHzwRGAXjjq2gwqLeEW2jlwCqcY
qitQnLfpD/IhU9+t8xYKAR+V9Z7qSBh8Fb3o4eAb6OJtpDqnc9IbyTgmFS109e3vjzj0Xe0qVcUg
L68qhCMrRZYb88CZbQPlal1zl2Mo2QOmD37vB0yiyEX1pgL999GdkJkaZkn5YY3FmZR2E9lsxRCL
zUZ03KlPE8EcVa59XRT0Ed3NOhB7SqVG2ZRVaOprOue1+Q6ObP4MNwwZ466eaLPYEWW6121o0UEz
hYDXMLYejjGxosw6WNeG9lhcuo67dk7apMHoTJ87r8yz5Y3h3SvcITrdINdWJG/T3hoBgWkZdsa9
m2pwB3epkH23FDGf+SU9NonrLlYWwt1Y+O3j9gNPUng4b6LFcM8BD0Kerq+8T6a15RBe15SDcsoH
qUa5SAn7qcFy/46itcYsW7AUyMxxSX3sMMXbYifUIeHR8UFI/iNgmnhtWPw0fsmK73RIl+hERx/Y
ovtaXtSVvTD4Qt9qZdxDsvxKAz2jqu/tT4LjmvJdOsbqHpQqPvr/xXaz2TsqiqOD+GOkFywUd9KX
vTOT3CriDfZQEvnLkcOnSyiS9othD3xefKz3PNScYZfkmOB08asizRIxSHD9CFvhFEffBTNTjMHK
DW33X5W6dlyUI2fW1TQt3GgW3d0EYmwIKBbHNKsmtzGPXDxpnp4EWKBXFGrruBV+HapdrGsV7zzM
5sCeBYSrhO2wzlwReqpHlRFpatWEE4fhIOPGnVrSEe1PvmIzydiNWsHNZHkrtfxccy4+AxrYCXN2
nZqO4As47T++T/XGI5G0zRuQxLEcfJLDFKaiCA6hqQ5COatRLdaGbp0w9w9efTp11VO665wtzAAi
3oqfuXJKX/adOUsP8Nf0T+MbUr6uCDkxh+vJXTxEgknjezFoeYEmslj7v0AzlEwDypVYnkCOnS2d
91R0N1jZae4E6F2F0G8vX4D//n3k92uiC2IHRQm/pO76S1KcWQAiyz5STjw53cKhb2okJjUOh9v9
Ir12tPbvLwCd03yhhwU/QS3+UscKxzQW3fo7xSYp65gWG7FpB5FGUMNYIuk4XiXfvrl5GakJrWIU
KHEzWXS0RlNgUxjQ+qYhw6aE+cMvDq9tyFyP7ppTsUEeS7MfdnopOuRi7vXeegqanCnVJpCRol73
eCeol9wAia5AroNvyH9v6C73B8VbWJl0XNK8d3gjywWQVvc8xTl/ZdWt4PPTP7/tNsagyl2dGwTv
QrYtZGEaK1RB50G+iaGj6iIgBm5c4PXn8H2RcKQp4UQKJSGK5qeSPaJ1vSe36yw8nw5/mMoIrDsa
eqsgP3u5pA1bCkId7XWoKweptl30uRMOzcTI5VqFx+0nAFhrBVjbuNKq4iFaN5bbSOIHi6fDC/st
4u2NujoXI6PRdhEBHwe9XVRAYTqrz0tvdyryFt8I++H7nMf0vcRjYD+s6EUIpZsViMFn2p9Pz2Jg
42m6qcw//NfhQffH5z7E/dguFaDemHqS4xTFH+OmmN0NnsWhVdwOQPksuqd9ipLRKBnHgT6Ec8ja
zX0JevcPcfrXu2EhjJMI0QjgSPaLnlRlvE3FMWrT0Oz6SfA8VjhdhlmFARF6eH7SRli0fcS+nu38
0+MbR2Q6MJTfAGln3/GHjjNcEPr+R1W8YiRARRB6g4Bo6gJGIhxewzHpvl5ElhxkNYpkWgRIuxgV
1T4QAIwjIvp+iAOlixLf1SV3erHG9+gazwaRqiDsWEcl2GCX6WrTluSK5KTr7SUUWmPYN0gujKLQ
DuqdxoDIIq3NKI+EDfsZmWTqGrxgriaEvvTI8pLXHp9XmBMQQcR5+SOn7XaAol9RzwZjFSverYHf
nNAVQ5tN4Lh+nPv5Ni/5iT5A8cNVxwC0I3ZX3EcAr8Um2tgD/uZ4jKtn2+CoV+hOlxFagZHN97cW
Cp91reIhbpgLnZeHgyy7u+Sa3VnzKyFLS0S9kapClEeVYsdOE7bII+j1cWPjZdI77uI6s4WFq2cj
BLraUJG4umr92bEpBVecx0DZ9DOh6SiZLhrwILoHumCkE/RMEnS2OcwXRU8wNd9fqVD0e/rdLpH3
zZ2fV1/xsOX4msWJZW9OufWh7ubXqRbeAITq/8Pz3BEqbCm3CxZ1hgk0VlfuEKlrgFMInwaVhvdC
MZVGh+i4LP8mdYSejv0y4OqK6HKqwQNZiWQxwWY9L7pHa6uFZ9ZRwuO2zdGOubndROxeqG/C5trM
Iha1pFtc065gho+o0WUtpoHb5IWKAjwkdVVYBDQkj89TAFALghcySqrUfy/crIh0JGRXmLYJPTNm
2tmItOkQcZx7yQKEUlLTjeUjNpkV/7B0KSu9QoL7GXLQvZMQ31Y0HwNKwA3DomD6p+1iIvhQggcU
XO7DBKyL9KDStpqsKuJ0MnTYhDu9qRUydfM+s4OiXtqNdt8iZNSB14A9cANbGhGS1jrriMzqiVZ0
NMtcc8B+UFgrXbJkY5bKHPPaxEIxoUU6mfn3uToOy4Y4hloShHdnaCDG/Tpr9cN4cUXLCzY94aM8
oLSdPlkFcdto8uhME+R5XVlOQzzb76EsYBXw4zmdVYJtUJ1aFm5KZF+30bCwz07d36wUj3kLBvFx
YxHbtaOKX3iWGJbp2Sx9+XWPuMd1zPoafzDT3w9SyZJqDRkhj4NWqLKaDpRMKQnB4XnsGiz2xAQQ
jov6gRXOmePqdumRhlwd/XQTqziU4w/MAH/65D/7ZtBfnZfDqKKF878fj7lwKlvs5z5qMFN5jbf7
BY/HmxXwL70ax95o0WrS4lSpk/bxIeyjpWyJT8d8SO+jOgMomQrMIjieQxxEBr4wwfguG3LCg9C5
VLnqpoi8KVnxEAfN81cBNAcpvHs0XmnApLWb/GagaCpx8YfRSkwnNttNmkJ1nSu6ZuKf9H8xAEq7
/y6v4AuyTO1so+pmntRrTPasux6pGue/guErM+9pEvWoeZT+UznLZPXN21cN4r31GvvHJdFwcv3i
Hd0M8UaTtPTS2HofGj0Q4layutM+muS8vMvD33JDdQTpJTHAVgblp2IhbK67lcK5mcNybqAPzLZV
W3p2pkN3Tq/7LgNWCLz6Ato+awEkdWu42ZexBYSis82Avl7PiFvVyE5AXSrBF4ugXqI7TNJbQYEC
KHfTAWkVweGhVwP7JXahg4MrKpfAiLcYs10crF6AgE+qsJ45Y5V1jUouvqBl5HnSDLQeHof9Khpp
IHwiT4sF3l3cLgzikV6LjggNQmGRpPF1PLwNFvsTmhO+HRINMyNOlYytklK5NYACGNhUjc/DoYsF
uNJVSokM/tP5G2PYKuoB4VvYBcmpDTzlX5EakEcm5fR9unRfRQz/zUHatvdDdSpLmwEXuyhghmpb
2Uk3srySS182DrlN9x6+quCMx8GCR1fhkTYBtQIr2w/ASX9lgQYZ7qHyKpF928LUFg2xJauVQseL
7Twd5gX6fMEh7idS1v/8pMj7WiUm+8MN8DBf3fZkyk6kAeAX1WnH/89sIUYKrXb4hDNyr8LlvlBR
csy+1aTZnr6AMhJ+QzjX2trP0IkaUPk9NDE5wA5zMiN2aSZf/zkkhwKqIcdoPfOrp57/1yPDHfIg
eeKjDcq9EoEArjmnQBnYGMjIoh2NkvuYwgzunJJlAgtW2zyirsIGZOdbvS5HreltKsuQlKX2GZ32
CPJhKEk9A9I8MIBSYnHrmCoW2aZPN11Fp/UTpdcdcTnveSG7ijpMFZUm03T6dtkrZYwdhCEHSS+T
hwtJsi6fOSSbt/WKZ0OqW3kl2f9i+UXOO+OKaKUr+yZkj5RlkwiGPFeOKCgNO/UPD1eQEhIE8FA2
1980xdoLaHf1HRfwp9L3V9HLnDPQTpvB6c2ORrfpILaXYyugNZMhVsXiQDrWYU5O2K1wAFa+NyH1
ritWdrgs54AmgdQsi/tYH6QKPFvmvcKiv0gK/X7qqJUPvcBKBBnRfywzprUm1pQ/Ge9R4oVkcW9n
hQ9o8Ua3BXSodQDpBZ+xrDcWP7ClBjvSquC2JioH58lUQLVzi1O4KXEdRVUSw3T9Llm7pk4g39gQ
coJyrdCVpU0owfkMzqXjyZy4QQ0ItauVyolYJ3w446h0HhYegpgLLf50Pmnh2MJgX0Sldkas95+E
TdsNt7Bvc4DYt9EfDxTP9MVLmKJNumRMkKoP37WAMDHnNgLxxcpk/LfZD2qUlOwiujh2hdBUy1Z1
QdCYR+tXB7ajvc+rSM76NUi1JAQ5HsdU9soJ7IsWLgCv4gGFEJVextOwb6YwouKvO7uL3ZQeUQy3
3fVWoFbUfXk1qewQVuAVzLPM6p9gIbnrEwldED8A9pOhUjL1KdiKeSLu3rUhUEWbwDdNEy3et74K
QmeyJHWs/9TQ63beUoBdYbT4zKDu0q6OPwxwHMzuJ1RnX6TpZhIzu8s1E4Lncq2Y1dNX/JmfiwGh
5D3Z3LHEs6lI05wnnji71m2L88JyGWuTPjLwdmI1zW1VKzMh2ED01Opc0QtJ9s/S9soR8YynOyL/
MQu7sgtUOWG0HeQbl9EsbyUVVp+YCxFVp2tD6+itOEZ1yjV0uIOYd7wxepbU8d3qYpktdfDWWntE
AMXQZCDRQELmXyPtTFBvHMZ70ekX/W+t2b4lxrpUU5udZoa4aAUORnlatnrDw98tuGH69ymzBxWf
rlIv/iyXFYBhObvVk/zWDJNVPv2DnWO5gVrw69zXOHYkm6dRKyF0dKAcyfTYDxMFUZiEj96sKVqw
xTSrsL1jaCaJIjLqyRbV1cXbLStOkD2mWdfVBh/cvyfx3VQ84nFQHVND1OiAJSTlf0DoNwq47/pE
7VnsYJLVVpEye/Tl2s+v2xOj2zz9eRGkpcLGhG6hyK1VNNFNHkJ2kKVWeoaar94yyhcczUn+UI2u
zmeKIJUH4vHh83GSReB3BhRiq7GEC82lOHGrqr80RY1Hu/2jeu7DfiQveJoH6TSm6h2GYX7suzjN
YQrNxWWqx0qKWIW3SkZmwViZJAekQQqga5LIiOl0K8PZqt2IYHZhRyPPHHKMXfGnkhETTfs5kHii
f+SxRoVE46kC/VBMVGoXUNDQnehtCao0jQrELfgAOMYk78IsKaqjZpftmRop5chfz31zpXj2FIgV
KB6jnY+JQX3+Gk5x3kot7kaW5r1b3lOnsQCgHCLyfPmRYwsQBHVhAMZO1XjnIVTC2JELQECa6B3O
bTAma/vrZ422MAunVz3Dpr/ooXdkVRqy+0TPh8qofMxKhlxO4AsKCHes4KuColgvSsikku37U7BZ
QBOLODUkL4oTnYmJ8r11ATrlXH6MjlSFn556ar56b3kCbfP8aUGeJE+QD1D62F+Z2AgcLxFsDA8E
JAAG4Pj4A8+uh1t2bjbc/B3WvoI/PMIK+HYza3vwQvGmaEVNtTgNidO4n0YgAFE2wDsIyxb6vIKV
fvAeRIfJp7+7WjMXMn3fYU3Y6iHqxCSQo99a0n47jLPUnTJHzMPQoSrY+URTTkf/KJIkB4MSI1Yi
RdGDlPnQhpoNUkkJ9/3B7eQe7mFISDyzUn8FWak3lFBeNVXcdlsQKDnITtQs8oPyrzX1EXT1GHZU
tleGNW57/rhJGs6DE9wQFwMZWV35xoBViTrCREjjWKYQw8Mp6Ox07UVcm0/c20PS4IYxMZEQ08TG
RLaf2WSW/gFld+eaHOSCQfdWC7h50ei2UAQY36+biCthfrgAMXcNoln8CK4spHBUOdHaEA6XqQ26
03AOwrM5V49IknSXi6iKThdx+pZGsNGXOGHspa5KsY2VAxCuvEjqF07wl6+ntClahCYIey0AGPWQ
N178CXmc8fVQZrEVoxdJvuVdiRZgmW6uS16Y4f5k6vDQcOr1f69GThaoR1yWpGI4F8RoUFqGDSbK
CBgg12XwntTHTSy4ifE6Tsip0xrwYIckib0NaC01nf78F2GVjXILiSZnJJ3spmsIVKggwwe0WNfe
AqE+GbrpQC7vH5GvTVaF02sk5Lxq5phDzp3hQQcubgj3LOU/m0uSXW0vHjZ502oYRycxXlUC4N96
AlcmkkTnfGb1DNnZKbJEfTtAMIEDN2zJM9KGlBDeM0hjCuqpdbtwmMCQ1vsfJLiNGHmexRbsJPH1
5QumCBNg+dFkOJ4SSwPX+59vV7p8G4je7hEcsTfYCqbcHCKzdpKHEuzQbcYR+fSaFE9h0/VkBXHd
wKVzFn0uNNnjHPNxy8nRDRja8nMKAqoQXB9oy832C7wqf3j7AWxLyttTImoAwEFDpapCuuZoWJMh
e3zc4jchYDNAP0FC9FN6rozoYL/c9rpPPVCk//CQOGVjNjjwoDw2lK3ogy9JfGRpFX6BTWMqc25M
6RhAJXep4TVGOmS/ZIYiUXARuyJ4yEeEPGpJCzEty0XzJw68iGEC6Whxi2yM/v0RJY8Fz8rxCvon
XSv6OWO+YxqWPn+Qtn/lMlqDUs3vkM+vQaTsUC7Xz3bY3tReArHI6CqHLxUxo4xz6RujqD9dJEBY
34TLSSh2dRqM61BFhZ4/+AaMxIZs64T/UyqwEyuppGTy6Yq2Or/m7j5aSs0QdleUPch1texllYGu
q1ao5qfXi999ImQT3XOy94xEYSawZooU4h190q2VlmB/XoBp7WtQJFteDjMzKe6cw6Us+oRAevvA
lyBzfFyEPtNPVaCQw9+H3tCCWCAD1mKjUF0xokzRedx3vtqf8DbKdEecxhG3RB2i2WlJoKU+NaNg
ldgoUm/Sk8NBJPaZIEH6AsPF5ca2gnYGG+Nud7aiEx7OyGEeEyf9CEH069cQtFfXAh1c3WZAvEjC
YQmRIfnxRWnDnRNHsQCpnhH9O/R7H9KdC5ubDi2lEMy4FgcOY63T0x0Zz1lJrDOVNCMNiQOIWXkh
XrNEdZbjQ+Xvu0flZ4Ex7d8mfrUVdlDxYGrl2R2Ki/xgBUQRsW4J4vSlkfsD3dablJUkuof7QBqG
GxkFa8hcwcl+nIcXRUcEd3bKrVZCjYI7wBZ/nZ1jcq+XmgSGxl2bf1z4T5YQCSzsnGsggz09CtRU
FgvNlFaBXr54CT07pVdWWOIgQ/OsAMyO+bHOdScJdgehKDXYF6dgiRlwNUM9IKDyj6/Of1dt1Ede
C/IyLkx9shF3wmP9GCvLegleb5IjDAH8czm+MqUy9YcOBMve+GxHogVlD2Ks7hFjONRQavvXzM1M
SJF8T1FgK/V1NbEPXcEn3o3Eb6Qp2HgOUDUBv5yYeobCyXgWhkXGdzAcXcAn+v1cae+QQT3QuZhV
tMrrFk4YhoyRaBeKQ+R6K5KKsJQVZZhwdtcvWznRcfKYwIp/Cmo4kAZEqzrmMg1uo6bsr+lFsU1A
/6HOpzkJellQroPWAf9CDjjKqwS4Ee2v/3Rx8ylGbyYXHaYIx5Ituey8qNjLL/Arwzu1I+yqe36y
pK3HzBDaoDTCj9mGVMR/QD8zGSs3UrtC1Mwycn6BgDOzq0hUSMQpYZmAiZEC0/pzVypgV1zV+f5U
FvyGClIRh54OA6z0xS1SzLvr638O4sSS2U6Ow2+UdXMyd3EJK9r8PqaKG26W+Rpp85BLSa+FX48/
dkQgfnnyPm3FY+QtgRmZrlKna6INH5yY+ph3qb0M2U2/7Wdzy1ID2r+PlRuFOHKBCstG+MYPa8dS
wyHD9rsV06UT/+dXCr0TE+EWn2cPCfSfJwoSYpfP4bovmLaihAKKKGhRx6rgeMadQ4TQQt3UHiNb
7/5dBSwXTvYtKDZPT1Gh6bbLrRooXeo5kmYO+j5XkzR2/Tp8rYLoMzebbbtsUHy09bdlqZEf5Kiw
Bj0Iv7jESNpPB3IVgzZn6Elv/hpsdeU53971aL7S+o3jOiDKbBR6epa4XEa0k0k7PzT5CPuxuUxf
WgUUdfFHRRdPEktc+whoPc86KJ9MRKQk/feTxRKXvX2Sd2VJ7W85XP8Du3ZSoDkkRTV5ozNPdwoj
QN3DrBkldQQQMCgTCIYto7SyDqUQVDx1EGID2TyO7e9XC0PdqNucpgKL7zBTf3ZJ0T5z4M7uHPCy
1vsvdJBmKGrVrOl+qarsrVXXbVdug/12DZetwfHeiYmU0vj9wchpOoozd9rpgae+agoxb0k06UOd
CrEglOnGXqio7QJvj/Y6Th0K0kB1pZQ4Uiyzilksp3WW2M/jxdDWnAamcaCac7rFOtft1fvsOhDs
IKXE89BX2fM4AI3mZRv+LTAE9TyIQKn5zBZuSSVRkOAwFYDBGIqmKaCD27tEUmZ+HLRVSPWmRkZ0
srT96TfCxU5nmHBQU3yUTgaTq8m3j0ZYJx7R3IKkgURKntMNSCHrzeTXL6OuIp8wR1Lmei2IIahh
TwVM6yd3bnahVzvR1O4HyYorb7BQDOtcOoQ27bvb4kEXm0NyAjuBoOWfij6aW7+d1DJMGqMGDB88
wkCf83qjlNEwnXE4JjIqvMhCU59/t79nAYB1SYZhrVz7w9l1oceNcjrwXt8Nsvxg3KAG8uio6LyE
7EPcwnLYdRGeCGdDwjsoU+1Rpg+EPBtF3kxCxVVxsF/Y7EQTZ+sKMV6UopPjMoKFxM4kIJ4JuKwS
oOP4J7UlQ5LAkPWpTvXs7kaA1FD4YfjNbSUQd6JXOiVjXKqkjHNKi1AuOqh+qFKDko0671THNg77
hf0xTvda7rdpI7hw/FsAqaS3L0fDY8SKzyx6c8gOxH7oF2lAavRFslAkdt5JY8e27Lhq+uA6SYVy
SKbT/dJ5qBnZAUAKRYkhNu9KdcjUYoozGRE/873FMjYibT62XnayncSzT6kHJKpUf88TEwzTjiHp
M1d//Dh3mCBzk/SkwL4aIxojkF15lCTGJK1nDrdIM1zo6+oG2VXDZT4IzRjdB03TnMHnpUDS+dsR
D34mQxTjEWwwNV6OqQ9Ih5mQozhpNpLp6R5Byen8ZjpLQu7VAWiOFEYCW0SoT0aWHEUHhNWf+pee
nF6lVdz8LS6ZenIJdroyg/M4xAEg/lqNntwke0VbDX3yt4LknhMupVwefd3/Sy8t2XD17pBp9p2o
PknIQWwwR1f96IYCg2wUN979X65t7d0NpINCF0bqdCzjfd4ALlpiCpMzy+Hcw/G/sozx7wafJjX8
7mNDCx3UJ94R0kuB3ZTaGxkHVtV5ZnDvZYUjQX9Xi1Rx70I5K1lNex3i1lkzc5+ltMeHUN/urQlp
WTLrH81oSkD6xqPXcc5Hf/izeCAs0bw/VnlKwGxCC15zAR3lZyHVikRP2s2xzZWsschoXE7LSaRM
3vWCf8Bv0ovJwnyLfAwGR59Q5PKmGuIWWYJ6+Df3PAfGvQrUZV7K9xsN0nmmciiZuXhFrZ8/VZPd
9XROEfS+NWNH6m1Fyr9JWXEZV+eh4aqhpZESXLHo70wfOU/PeLptXsuFo9x8uyApZerkemX1mSIn
UvRhRBIxqsZnVsqsNyND5tQBzhUtmqOSBXHmWYtVanRnIg9dK7G0K9Zgdr9/0GwIWIEN7e8jevU0
FPgH8nW/c3o2c8uUhOWkNkzOoTltB/5iw1hRdVoNFJ5xsQJ1+CsW2eohZVEGS7YkVP/Cp14CoPS/
madtykQfMBPaNGRAZLsnhsiHi0gXAAkJsdbXqW/qKXkITuxAF1xayS/fNPqtC1hzcQO1WU6pdO/T
gxeSQpoLWf5QqwyGj0wLnrIIL9RfpJMjY7xDIts8AAdfc+/MrN7eV7jLRwifLuBMaBJrF9KykA6H
F7nUutabMijjJIX5gHjBYfkMo90pErxr4+vuuTFi5r+KbfS3UmAwDqsW9karm7LxMkIhz2AyfMzJ
E7+Y/8zCPjvzuGwi6eYyHV7mNMUccHDCy+6aM/AEn3K5wg3ZAQIn4/QXvusaJXaq2mMpzAA/EWcE
CdRvRrvD441BRElwG1aa561S4EIrwGNuPlihH503WLnBt0rgNvvj0o0yYabCDNNmVhNcexELIMS2
HHY18IPMOtbRkNUBDjQIMD83FdnO8ebCuH+jm71KDq9T/SmvI4EqCvBeUzKUzDBptF3hgta+t1NJ
FyUMMp/skpdL0eTJ4JPYl4AJgxZ1BJf2jX1w5AJL/+kyEtlh+jBVc8rrLjSMXw0LunY6gYAZiZG4
dgObBye8z7VQ0hRTcOs7eHtgdyifxWdW4fyyVvgut91CxXdMJUKOKqOFa4EhbWMhUeniXweOg8Tl
M5j9hkHqi+3d3L0TLRECBoFNeCc8ovYv+QAW0rm21q8FkcdDFRHwUFHFLC79DIPxeW0zyOU0d71n
oKpEoBzNcH9sAFDgrEeL+HrWQrQVSAf362wkplOrboPhH6FXBZ8cPqx9Z/aS2+1GtrqD77xepqWN
GzZHEaPQEIk4H1AtwzDaTXtKhtPuP1K6XtV34kHoK1yZSMS6awE98hICNtgORAff9RmB2WAOweHr
igjRMfJyTFRvNUiv8t+h6injZp969J2mDrN9BpwjTgtdPrdhHK2K34eIF05QZc8zNUr6p0i76cY3
8izd7u0a4zCWgIePeQPJvo+Zx9mspkfJISOmSN4s2pztKJXXqgS15H1xNzBAKvOYJgzytjUx+1D1
Ii5R9Y67uKdbCVNUVs5U25stzavgf0ydrs00kupr8QZFrRCBmQL9q2L895D9Dm+QpkRV/RSp2LZb
lwJ3NcKZLBgeFqY2YuuNg8sWE5/TZTxaA+/ljohjlQN7y3p/HkWoMUeDwZdkqz7CGJ5CqaC6Md1q
ixxV5NFw1Sr7g1Xu5Liycx4xHqrb9DpwHhOPc2ICg0+P3IKjsBupNwsiH/JaozBYLCI7/3zCp3Nb
zCj3yk6uWKsL5C/3fVbjCN+wWyVgvZp77D5hY45nqPZZqj08JFJ5AoA7Z4GLkrCFEbem++plqD48
SBIbE8OWfcGcvvyKR5KZJHFY40Qoz1xojiLKMMSgeejbLIxf18rwawStyAWu2CTNBi8GWMdJHV5D
oPBGv8asIEm1wYPXeKSlD2GlvJBRPfez7yrIFxdle+NxdIMUz4gYcp69KdHYcnASwV+dE81gT8XI
Sylj4D/5Zd2QYWnLZsRPXlbvBMAK1T0KBkiJdOkubQh7MBV+9stkSZRqrQK0yclbHzVT4ju8YkmS
q0GCFRmwbJi5LJvcjHfMyRULQjpj9TMZPayt7XjuuTvRt6OgpA105HYske7eSuQWN9g/aDYoFTz/
+iG/NZk5dtO+5y4cEPO3deb5vnLAlrZ3KjJCjiEk5imXbj0q3Qo36zPGRJkIOVegbVXz2I5xmwS7
N0boybsJAdjlEviZSgFa2KjzikkjlNqAmmxWfxiDDmjHezRheOXnyigV03SQFMnvVrBD0jLzKYO8
R19/fufKHMf9Vud3bAGbId99covH73vK9m0Q9+SMl5fy7nDoIDHnhulMUwYrGezIuJRbTXKFbLZh
gtIkvt0Lr0pkVDBI5zCyUlS7DsPtlpLxxFtiKTo+eXpRMVxeBMKVl7F2R91R0wlRep2nOvoDy8+S
0Z24//YNF/2VPeUjQjVlK32sJuaFudytjLUJeDQlJJx0ZP/dDuPJ9nlFPJvRMS/NxPRag1eOzuAp
JPBKxV0UqqjV+PhLIDSAUjt6JLQW1NQXI6aB9blrs301ugLRUqCoWsF+7kfTb4E1HZhD12k4pSVk
msNL9pl0Z/0vHlMbpBCyMgYSJbNsexhxtepVRFAYTqTKIE1fUolL2zoZ/86r3WiKAg1MYF6k5aAl
F41VGklw5EC0Fz2ayObFDb4ZPP9wBMFP8szzIBiNXyML/WQnsqXZjOwLvwGOEacMUmbFzne03h9O
DGkW3nH3//XCUrLBlZIfcql4z1yPJqLIoonEmJWRlZVHMixiIF76cs+yFQ7NamoF1Y+JpJhGWwds
q+dgTmD8gBGSONTN42keHAlyMnqJQOrDJZ4NwF3PU6BiYARtNADB/HEOIEbfDKmRQtQtkoRp7uJl
nN0/cP+xUGHW8x8lU3dwpZT7/bTGyLYfrtQKnF7JgXE//PFRCWboEsW7KCiYoOLzkRcpFPmOH7y0
oLk+0wOy41nWrztNjxwXJI+KZgNrd4QOvhic9zuxc9BjOEuBs69UCWpogih3qa0Mn2P8SC7APB2U
hKeJjB3UuVMvUEtN1Yrb0OsTdkz9OAD78Or2e8SqFkpZlh2K4Q6Y65opDTdDm+vIxlEjxAXD/Znc
WOj/4xDYCXpa0H1Ac+8/Weqay7V5DUhGBuVpHgzeNK8noVOKRhIbRf6V0Iq6yK2L+/JGJVllIymZ
AHjEPcQbakHn2+dg4iyRZN97qfdqfpISL8jvdAb1yOyJ9ndAlPzTYqPFwe2eRbwY7cDqebYzDHhZ
XcvOlOOvXTdujCdWMzL9cdfBHTNbXMHzwtKuqEzLzzwSom9vX2PvJl+XDd+qxzpdC6ndHVarwqO5
ZPIjG/lIAcQ4z2z0+OaWHYIsbsFvVeFmM8192F9b/7JD8WBCjLGe/2DJfch7Q7NQyl78nRihadq8
ueFfr/bSYEWjixoGV1wDJ8s71vMKqCH6Rvr9bNuTXVgk7i+3/E5Np2XmpdG7KN0HVQX6gNJYdrfm
SBUxpAVM+FBIe1kXzRgLfrFzjNY9y7t1y+duues4iMVU3LDaY1i8+muUmsbtbjiqfCbrNPJtvbvC
760CBH6KfSE7Xg71gdjW9Fpyybk4gbGSbWNvfPC4DGGQKtqZtXfUkcIfxbBpAjC9dGyNGRcdrSEP
sX1zCRc5CZ/6QYMK06mhiN9A2P6HGVDqdyvouidxGh9e9OKHNThOqaIPpfnHJP0++uttJswvi42e
9ihfHvmtyWcyi1AVlWEvaXijqaUkihIFZZVzIg0gzWUZq5nA7R+LAePQw5MKq66ZcBqsVUsxSGgJ
jjjHa+dTjdckGgYoyVcwxmKLFwZ69/btH8k4Y3jcdTyGvLNTozVbWSNYoUDIhheBprJfTezVWmmM
zMIbmD7T50qXVLRT3EXjkKjVlAIPuTNl3O+vOn1cXyuzapqobdWjp1snzERIorm6tWyZTs6E1wj3
AWCFXfoR1Ni8CCPDmZishEaXDoR5UAAx0u0ByGXkJYcskvJ7mOI7fHKtZftuX1bs++wBsgKM9YJ/
0fqzoiClN2Q00kxDKCf1+rXfQEYGwWnKfTP/byCq2kj8KRgRMymlsBztM4+mg+cp27ebuTCwA6hb
xjfd/ZkR1hhy3kBux3m8A8QEh+aLd0UpOnj7KRU5SgbDh+7Zrn2oF/TLY4BkcwOSo0te940pqWM/
weWOicnwv3DupxNCixrva+6Msi/zh/BrnHMnjfwGLMRt+oQZOKuNLmzq+SIhgL3OhdVIrOl0uaPq
j4FwfMyXuW52sce6e4tOQ/mhg91MrHEe3YzNUIqtWyDyqrenjmpFjeErrSnnworfcwQ6RY35ydGC
MbhrDNs1FknkrEYwYJK2a7twgVj5QzinEPzey6o02dMS8UOV0y9U7vOehCQQLcBOj7ei2XhMqBE8
3em5xClKbLD7+6JUoT5/hpHeQU5F2D+Pgt6VD7Lecww0NQw136IQB0jjHb5Q+rxs0nZAoI+lvbdH
s3L+YF+gpOfb/qVtYq47cdbjdDtvQiJPMFNysIo95fotkbRnCFk0aTgthdCYzoW16dzXM93DhjOx
5i09IPNJwC0FDr1fHC2SuyQrKGBDctnZ+eHH9wMM8Y7KmHV4srzuCqrR3hJdqIgzxNv5r8jl9BZ0
DJ02jmhQRthmX9sibPyyRvDIEXPGNXZUejA+AVCX0HkGahCC3lmm8L+xX7TUSrmm+D/RGcOpsYIt
ae2TGP22AUzQyEJAvYJkvELKD/7IPI3uR41oO//pzU+RFvrVIcjFZFb2oXzhgg3TgbD7TiCJhv1N
Ne230GQLx+7YYfXmYvJaWIKUh/JxIoEgPAAXCgBZ+gsT5tfPfyvIicNx+BhafoUOAnoTjLdNmoiY
37SDSxRxay+4flIG+PlRBS8xR09YrY1lIjaVY7fU+bnUZKn/N5PAZqy/6SQyfH8jYxUUepHrN+y3
R1yHtZwkmqrQtF8VxxM+oVUvVV6vFJP18nvtQWt9Wi/LguvCj4pQ8P5tsiBGQo/6RuZcW78okzVa
RP8dsyyHx8JhVrvSxPjlBe4dM1eFVlDMARp6STumvNSDf3gb1Tg9UDKNhv6PdlCkFJ7oMkgxYmvN
KA66vg3h9kwnATrpoI/arl5ICZRwppBfN6V61LU5SiPykq6V+wpSaUHoy76bK0F0fTTa6HKxkbfn
5ND0QZxDlOa0xYJkmuZzo9W4RhgAmjuVdtt7+v1dmaKRHNFqF2M1UGGTCpVqdT3F45Oe15Pu2A80
qB3AOn2fUY7rCKsIIZjTgEkK+9mFzIdSMPJJq97E+MMLo1cygqg0vnMgT1i91PJITwJTg51+QqVF
uksXTMr5FcR5u+2t5jehVHtoc+qEsRTQmv58rBngmLBdLRK09eLFwNcoHpvcrcbIjLp6+MsLNNQe
wMIUVmUIAUGtuG/eLorvjFFNwvaTyqMd2aWjap4t7TPTL7MS1l+vHuSkNlxhiLLDkOI9UJG8HySj
v1vxD/Ug6DEeh+JmVJUvl7xm4y/daiTu2Tbl2u50Dv9WV9a50NoldTIIGh5kgXdBHp+Sae5Jj0AQ
4XUK9ftC9Fj254HglS2nbZQBfmD4t1IY+gnNkLljazC7yjuYlWpg0/np2x4cJj6Y6bAGXVR79WqH
6L3aOUee/QJHFPCyCVTGEHuFeyf0x4Du4lhqXOIG27yzH+XCDlFx8IyAY5ewlUuqxOAA2YGWOU1o
QYwgP+yTDaFcb/UKFdqlWAWRiqysGniu9hqfWkzRhbVoKn1Te0K0l3p2BvPOAIDZSvFIPUbmF776
4LfW6YGPGcRW/4BSxfMqA1/NRcXDm93XIpdm2HpAD7XjmZpltOMRldN0n4QDWiFKahRCKYXIP6rl
Z/S/Im7Cs8OmN82Dg6w3xgJIawsZT/CzZp0QkvgeD8acpQncUmwgR4GiC0/qcaH6WN7HnQWqRjp3
RJ73f0msthNS7KG3DKoxZYRIzN/wOck3cyNoVkIVF09LyfvrcKPQuT789xyhkmUFeJaFh3WvVoCR
kGxeNx4nG3j0vvzk1wqNyU/TcmSJE45JF2RURUInKrHFWTLlHXoo9gU5U9uYlhVoATomSlQJDtAI
hhpoiNX4j4F587a6KhVivf4NQW4thpSTVVTQCk6qR2aMQiee7a2lUmZ2n6o2jQmMdsPrW7j7UOr8
hb9SdML0iP3Vjbu4h9jfoJEaavGntPh3hdga8k5URSbqj/CDskdiUwg2XGOMUdh671K3qr6DO8n3
Z4J9qQ6hzb4gErMAbbIKEaRWCIrIxBEDDMrUBFBe6Z4qgT+EKqjt2chWHic9k10+w9bZ7ypU6gbY
qaRWC92cO9eABc5TE6L2puOO6PqwcRnzgX+lR2Ocsz9c3w1DVYEs4u1z0ELcirU6I07Um0qEot3m
BnUNalxQD+lOt1wZw/icDaWYCmIAAispKDCyPxiAo8cak84VLKbneCGVAwEUspMB1Lm/uZrGjw7k
td47o8GxCl+gbbnHkinrtIi0ufEtJGuBozFLdDXLViOlJPW/dlggs2zwkuDqNhwVoXEIQt8ts1kq
NZf1IOCmGFhnBo31oSiA+UdusRD6G48S0QbQSmWonfn+PSq1QM2et1e4ndNJOfpsL8UxYTAQeEgY
I3/LgDUnf+JtGfHJ4n2jUVmvGH5jhXcoVYsgWx0dAVKrjsXx3KFc9VXIdtz9LUv0Nn+ZsMS+EFNL
8d/lBBZt6jjbFD719jNC2VbREZJibubPkw58AlYTdwZNkjZxIbqbBhY1rkjXlDlv2uyzg4yxnmmt
iy5hf6C9xL57duM5PSgX/HUKXJaTaWA+EtzGWSftTL3hP+sMYtXMcy7lCEqRr1tw7emL16CSbhE3
APpSEvD5+Ak1bWVIARo4977+wmq6osOlRnJEbxqrBaVz9P7L2PbxSdaLcxRHGy0/8YdCuCXVqz/z
tNTjSh9qgoslqfklVPjhiWqrE09frhmh7Bsr+qvGzYJCBGdPKtYRhKuzhsIB6KMsMFgLns9m8vWP
J5wiVhwiFmiHwAUZ/ZyMpHIbPO8sNUyBo7YsrZFWgw17TarQvQsC22HKkeV8/oDGeqkWEZE1bU9G
ZWNJv+VZLznt9drMEsxayFoBDJUaDmnBUzRx0OvP7W3D2PM3eIzUfRa2CKn27Rn3QVVLgRpeIoCK
Id1gQk8Hdwc9eRaEZdYmXIhbSIl15hMwcHI+4sflVV+idHnGYAJx95EBFOrV6nVR8P29/V1DT08B
PooNO2BeBcuFdcry9wAay3vq9jEFiteR0oC/oxK80CiU5V8FmOLxInXY0I+JUmkCJOLn4Pe/ehOd
yxIHw+84vlip3H/zX6729Fu9Pts/eNXvekh+Ja5KCiJrO7MOuH17HPsbNwd+n5OvWYbZrn/oQA0f
+QYYMYrqnmptWPIIN9zr79XK89/Z3VqUcx0na5F4fZorX59SZBAQJK3dB81U8CdWckatKJhWqfEU
iQQdr6gNxdtAiiP/EHCWvIuZlNNagjcAZe9q1DDVZixILeZmv8dOSwBMKOcDNPMPyvo8pekH3tnS
Cv1dl5kGVoXnKFSq0z6KU7r2KJ9FnkomMnY9eVYswiYHrP2HfkFdpZFDyBJfKds8CHz+ssfQ0tLu
8oJTcp2+cYx7mu8OCscvNhk2DiW5djJ5v0onLdUffCGxiIchmAKsUtP699En9Jhe44tZHLjNW0tx
TBEblzTkCVmbgYSykVZhlPu4wrNgSjZnLJjA2ysBt25ctH1gA1cA1IPPen08NNt1QSKckwmIYFx7
ByKW+L+jho4P79IkJcE/OCnejcsWjI8ipZzaBeRPON1VtDlyu4irhZ76jklQDvzYCBZcCxP5GL8C
7/+DMtHi54ApQ9UwXYcf4UCKEGDiC4EaDLpzwwrLx/l8VnleXwZUIaI4BZ7NPtUgIB0Nh2RDngaQ
pVIjWawp2WiDeiskWOo61JnX4lLGQdGIDl+TuguFu0RFjF9bNJVaYbSyq1EtcBDbo5pvhwPk/VFL
DyXSS8e8XZvT3Dfbw5d6sAfxmtoPm/ARnS3jJja+GslKN0BvXzwSOyMA87B93rmsNQOiQhM48Kdw
pVPMqtMoakVKVHl3KMqJD3IL0hqJoFDOr/ITG5rOiEJDcIh1a5eBhIqVW/oSYCL9TqNtW7Jbs+ZH
tF/zHnZjOBO6eCfN0STNXmXD8lWdjjlIXgtOtIXFYXrplunRgrbb0VyzFzwqeB0Nx3Npa1HOfE6S
bWgP6Jn++f5GVEBWRXuAg0ReNc+mEd6iQoGX45AehiF6SfCSM2IL4EG4g8OqbIELaLIfj4RdHr7u
32DggdhG1K/zNh60GdL+ZYy/tFOwQvbjYkV3w3Uw/q12ULL2WIv5Nr9YPFQ6DyuzR6ciSt+0ZOy2
kenWBOAo7yeCQ7FFAHFrBBVAEWXqvgGzbj53L66n5xTEwd5j07/F9/+do9cXqJrAbKUrcCiUey4F
SKImy1gZMRjfmpJUsVNfn7ZjGAuAK2hD0xbXg/4jUQcPMTWe2+LEAeuaOa/xrSOVCsDXmuPXwWpL
NiUSJX2pVfzFPuuRy6m2G3tc/xnB0RdMkYNoEGu6GnsgoXJcEfgKaeLrqkx2kU/9DxJaj8tEUnNN
BpulgMieSShtR/rIhu4VHo5gTwtIJnSxqYYF9U4d6q3SSQwEtppLz9Xlgg4Hu/Lc5+MBYxS/PBAz
5gncprwl5o03mrPSXu5TJY0tJT8b9BwWw947JUuyDmX61o8+fFw+LQZU8U57xRw1TvMvxF+rcqBu
g4OpFMRMHXkTO2pAGtiJNXZJ3Ya//AtL+02mMOS/TVVJY2mFmS6AafEVAHL33QF9Ru6+J1pRpJ8e
gyjuOmmYkprsIGCnawAsONs6l866d69UO+XLVBIj6+UcOrb6LHGPqbt96+nq1Zj/oHhu4vWSLZs5
7DMLXRl6fZ2P0W4MfWOsQa91i9/OneGbhJHZ+uaimEowfjX/IeODeTtwOsBIrp74drDPvUZylqRf
OsYlVy69awPC1d3mahM8llGDxpQQh+xcknzMDdwItF7OJN+nOzNKoIj3rhSdF9KKzF9poggDYXL9
yekV+o0dCaP5iG9JlHwAxW+kLcdcGQLBQgRSosr7Q8CRUFCBK3prchFSpn+RANE+kJFMqmiUak1v
0goB1bAmclatqgCWnv3zicw2RXnCin6of8vREEDkJDf5qdptbw1w4LzR4j6my3PDDfwtB/CP3Mn2
wCckiDhy0/nWkO/+5QxFQ6pkvoHLQjs5CGSBt++U+b43utZyWBF9cp01mxRDTTiP0YeSrGR7vkEJ
2o1tlYbvUa5r4fFYVoy5i5mm5JXUuESHlAlmF+I5h8qrWe9ChP4ICBs81M9/kDvdxmeRu5kPAKf4
27qeOsCIFg8VnFaQ7400H+IJFreR528F5DziwERElK9HchGHFC5uNgfXq8HNJnFpPYl5JKCSdCT1
GSWxJ1Eio+KD85CalmVMKpmqXEdfTLDrq0WjLTuu8wUSLOGFliZwvj4IX7Y8wTbk2S0ko5hTF7r9
uwrsBu2Md4dwEy07DMRS2kC/kPIUcehmp88iiESE6KrBFT6kUmyh5SP4iV7dQohciAc+Yc3L+hfd
oCphMqtezcrM49gmYO+S+GjSz0D9wP5TlmEYWoo7Pk74NwZs8Ey7bd+ARv7KDVe7gSXpb+SSbc92
lG8vWOF6b4P71UdiUEDUll/vyORUB7fvDcLwAXVt55r7h/vOzq9FuGK/G3TaCNd4Xl0KfjgZm1h/
jFgf2VZNAOmvnqzMfK+qMbFiW0BW1hgfGzpp+vhTLjX4aQQzbJzNf+1KdnA+VRDywWiO/rNXs955
JFtZ0so8+ko7koNnCRAtYPViREuSw+yiNPrO6quV9fWtJEpQxWbs/SbISDNGFLqpfEDSq/eTPNH3
BcAAwtZBEvbOa7WiorNKBwYx+JS1o8b6Vl/DD+F5lleB9g4DsN7DRuEmNQ9mBipYwVM6+kf8T6L3
bhx2FubHdkq35fZRi8ORaiWR6B1myVMHDBC49wyqbxtFmzvnAkmA5KZCmwi8c+K3NYKgwq8Sivg4
NTSKxTHaACSmBX2quN76yDXbG9vsaj79twhbW4HHP7M2EbuM1yfVSE5LN5KH20OtaWFSB94PRi52
b/3EHJmtPVWJb/rhvsLZSXeGzjl3WsOjFCB0503dtA+DAtJ92BhT1B1MaGn4Cdw2FbRbRJEjO/g6
peG7fkmNPemLbX294zRpqbB5VP6sd1fSx4fPDvKuqG6Jc+Zh6bpuOg3rVKhj879QIf3r3xOCdBjK
OxxdLYRgl/9vqnX+mFbWgvBZnAfhsc03NIGGZYoLX821IK/n6qOuyZ804f1jKXFO382ATda3L6NV
BjCT73jZsURVMOvjKn9hvxjggDqCJKh9lCCsWsyzVfXMeOBDR9//GaLCnlCzUb0N4ioFtnf4nAcl
jMg8uvq89WseYGW+4GAIH0CXSm4GWwJR9FxBzYqDxz3MukrS+24UsZToO1vZ25GsCMnfMy94aaT/
8/931J6T039kOVGlqFj5o1PlWKC+9Oqz5Ad/4WjsWwK4LEn3o5VHaTuTtmghB2sGcqUSG3CbugT1
f8FPKvOuXmCTzidzssoyzkXu+8lAmI/yA5xybSUtzG7Y3uGOoJ6PRLNFou8qZRh8vVFVxXTk9Mt9
bCDSMytjTzcaeZhfxOQNf8lBpSGrFpPVjkZ/UgRE6XraKNybNaspvLkckhpAGDObiY5Hk/rfiLX/
GITLouWdFmG1v2S325dUhc1erOaNF0IqnumbV25dWNx2/1LOVwFwtX9GL18qBK7LndjHQSSVqAE8
n8Qso15NJbReFuvio6Xm3JCV3iuL/iUFHDyZOk7ffZOt+Npijm5JaH8/AcIhA7JtMoDKtOmpqkAm
KJgo1b16EvfpcVfwGxM1tLJVO6ucFi47KHHedqBIJ3vdiThT7rf+2XdY9PTSo61SDxJ7N0FFuKYE
Z11uH8a+AS15YC1sejcW0ekVas6ou1qkYS1tc034pL8rNmoREtImAh4c6Vi6z+u8Y+WnA53GOoR4
lXEC1hdL3Um9wpxYGss1jn4jWy4XSKdZs0Y2NyAOJxWiI3FtJi4wg16jj1MDtgfFZn84G9ReFW0f
gL2nVlHJ31YotS+plkc99DA5POp/oN1ow+tpwg8kvngI3QbkGyVSDMfZdgxmg/4Qxow1T0tJZDot
V4AtHB606o8pA0ic7YFBIXqr8x37jVpONDm8ClnOD9/AHTPUqpCx1T8ObU2s8nqruGIpp+Q0vhtu
eqz1nR6KSSvw3/99j2tgBqnHFbe7SzTy3x4bYNKVSXohgUwt/lofdCu2f0zfsIuKymMWUQ/tt47t
a0xNGTbMO5BIYuKpN9elVeXB3cg29EXWQsirTYKgQRvPfjKqrfcXJc/LGq/SXb6qCz2EFKhpC29v
ghziKZZMU/tVMoHZUGP5AB6fFKLy65tbCs97r9Peqk0gem2F8IO7BEv9pIwLXmooLxVGVGi1I88e
B60gBd+892Ly/AcAO1YkP1J2MYcKtWgcbXqlfjalSI5CVJl3bNXGk7ztpdY/lBGH3StJq+fMHZ3f
abwL5hv86cKIpojleqZ5+Jia0BVxRTy1jpv1fmg4MieeW8IUgVk9nrSJ8GxjUAxiE8ddAVGlBVdu
5d6Fnt5WuEfnhaDrplCFODUnQ0g0jgYndc3wLx8lSSjhTnoAe1HynVwT6+DWhKfdean9smtZfpfi
/X+I7ZryoHN2oiV/BNDXFkrXm+MoFXDqBkQuMCda+xI5MT6Xf0WG6TPt/TsuCviat7D1fqDprX2r
++J4a5cDS4lUikQEwe7uAp7TwArmCzHBD3X5TAdNddJwJTEe8pRa0t3aOMoIENmRgXdvrKgSo3qw
5M8JXt7PjYV8pfqMTqoISC1b7L7E6Otp5WuN/Yn/RN94MIKY4K6sXdZ7JoZcn1dh2Qvy+HCdRF03
wZkAqg6H/66SYlTZHZQFEQHZbceBU6dayTI+I6nS96B7if8sJ+lb7Qs3Ac73bL9AeWncq9zmyK6k
06pnFNBpnaqa6VpJxhPo11lV1MBM0/OMQtBB3vQXM4pJeNIPfnnHppZwtuJy89YEVAn093rhK6rt
9+eZBDe6YeeI52cHhBxabwy7pOQA/DbRyu4g/8SAR2trOxtTQZON1g3qmf5XzuM3n6yAga56NvCc
mgXXLNcCeV1Ih54TqIlG8EFZYX7VXzNy2sI261eaQn9LUhAUKA07tD5AIXBeWClg9y8hhzLFw6rc
39IoFdg5fvwA++wRUhvH58viW82CRhhPFYWwCaG3CGq1JMp0aTOeAuGGz+gxdjFblCbngv2spsEa
MTvtuCpLEDik6KEsr+1HcRIap+UbR8mNIpaoPFIn6B7zRwJ4jifbkfULxFN8ctgOZzrgRcXpWUhr
qJAJbjGO1+KtmpLK0KBV7WytFG2RpLkwXx6KDMIiS8bV2TJN6ZYiqYJpdSuz9d+XwiSAHjv9ptHw
G2YTNew5PnDQ4ZO0dv2p5z6gkH78G+Y4m7LvrQjrfcFn90UkGl9yDJlQ4u1pciMh57KdV9PkUlE4
7bgWSbTKRrWgNhmS5KtNM0uZGczSIErPnmiSXkhUft/T2g5P3xwuPnmJQMhYIrusV9xaMp07FQW4
oeLkpQPlX0npEHzkSLeNKtGmrbaGqpknS25lwKDdOWvldqfLSNieoXb8g3eV+sGSzhpaNKYfiZYv
JS4wQO4vqa82fKI9Jwa4m5myAaVBw0acVtTU8MQIqwQoJLGkezaANc5Ac+FCrnHl1k3bsZ96Ml4H
YxlbPUbmqUG9OMkxCsainmekyKCBfODT/Vn1tlyMo9d4LR1vJmOAc41DWY0U5jdV5IDB4NNqHj/k
9N9NBpV5TB4oCThsF7N54hZkpcfXnfF8BwLhvd6U+FYUbFH1oHwIDmlpTpJCw5laRMWT3Fx+Mfwo
kTrGd26xxmutDCyod2R7PkDguvDsMgs7U9l9ZMdAh4YdkRTvwI8NW0tRQ24GDadXq2HXSnjXC6vh
WL3czl2RCPuM1MkLaXGTHcJeup5yR3oqG1rQv+OfnMH5BSvbHL8S15ow4H0VJEYNteSPMuaPLVHv
aRO5t2H3X0f269Us4AxE32kpLbP3r4oG2HROSg077EyESwWltlgRjf1PZ9JxJGPfSGq4BNe0BaRv
JT8bo436GFSUK0KbJOjJt3jcyRERk2zsP2Ml/xrnCUPrgu1ugW0TfswRQNfH1jBWqP9pe0DStyfk
tCbh5YXTM/68jzBTiuVFR68XtaQbdCg+Mz95CUF5w/nvsdoJi9j73Mh8f5JFuMzjut0T5jRM5L0g
wpB7tfo+MyQKoPgvle8J5RV35c2uQUKaPO+IodljwUoWu3sLIvpDLDLllAWggVP8SEsAEwnVSnFS
MiKMG1LmszioJ0KkBjYXMmcUnKbHfbUqF2KeIcf88wyPb2wYuLfNJvJKkwXBk1z2Vs02WCs4Vx13
9eo6dBWtNu9zoKcubtc9+6J5dP29jgAvGx9BPbjdZbWfHL7jErrJwSFCB3oiy6UBoEbhGIOUhXE1
nnv/lX79RyhoRgpSRpp37w/RqB/nAAnFTqgrFFbJXL05+7StxZyqCbhJrv4tT0lch6OZx335CH3M
NDPfaii3af62jbxCcLnGuGXIKu2rrdzeWUsN7GGzK2hC/91C7DGwXYR1vsCrIQxuNh9KpBHzXP0f
30oNHT3xkFifYvKVyJtrVU3Hp5CJak9G00KLUKxF89AiMAi94YMgUFYBPEFnpjYhvnTI9CZAwqgT
0RjqaaJ7dix4k4JZ3KnfH0WNK9CSbj7sNiFllzhQDFfTPYEgNedte8sDSRM1YSUGMW1nyqsAGwMa
SgZR2ir45FhSAo+KBssrsm7gpZc/dUCsJPLrAonrr95VQJOqS/pGmjUPRQk13Xer/TAL5EjsOmJ4
qb9pKmmYdQyjR3PFa7V5AbiN+LewdCnJJtu/IEZkmiTh/tDu8zo+2eVtG43pvDWrQ4IX1fcPdFy7
S798C2L7cIlVNU40QC7HAoed71G0wpGsjwnRUHjjjkwSwNIeeMkV5l7pLfi8UgTpXopUqSovfG57
UNhObjMBx7GCVGC6p/zhwqOs35Xf4isW1/BJHJj7xghI6Ug0mtEXd4j9hRBEva4xgUYpYw7uXDE1
Ni9PDCRyoduQrw9g6+erpvCfJYQEpIJjujog86gXwNTTXgL3ZDJYwrUPvjagUVLPJ3PQjgYc8TYy
cJdakUXHQDBmM+hoHakd7NvXN/Mcrjr51I9xqgHid2j12oM8cbLjtij2ZR31hczFOdbRHycvmAlX
UrRAjwAaT54WrZN48Uo7FS02M1lk2TVswphO4kE6zAxW1f+iuKXtIXBv9uac8HWih7Mwp4L/OefY
+tJt7ZHUkwuXU4HC4cxHzBxf5bLragRovk9fXTij1ITlPtPPTSdGDelq5pFKBUEgRlRloRJk86zU
sWLnZr9SPorqRyc7hOcvHuzTpY5dl3UVgAPyNc8tfYj3Wt35kqfZ24YcTMdv3dt+EEo9tD+MqrAN
qsolkKASTLdcFqSp5Mb98MmOMaP9E5COLsNG1209QU4HyJfnVBQ2HC5NXpVSYjHJhE6CGfDzr6fs
HFNhlLZpHev4z4aAdAATtBE4WQK/ICJf0tvTEcyubxQM37ALpXyTG6TbeaIOiY4nXpjBGYeNRWc1
K8l9oBQGZMJmeTWrCkWKLj6y95FPGgRwrTLcdDWhTPsd8e4vqFAkoU/gW8iI/mMIJlY6Isz1gys9
4ODJJ3dB3zmedahHtnmYsnVCjpEKUIwUFaujWmFQRm78q/xemjB9uK4EMuwdzacKxAI2gviz2YWK
N6iAnA6ejyL+obmmXmU/K6Ag+WliEs22pLgoMnULBxPQ2ASnK+1iLva9AGVIuvVc2SHGFmeUUWiF
fTab6wjhF+13/MEy4a00YH4yfoD4pO3NARz5nwKSvCiaBtqFN6bhkPqoFsN26o7uySHuRe9a9IIB
3j1MBTBKqtz/tXVpGogHuYhb1zZ4mxZeyTIMKqWXclepmuoz+34XDK5TBGtvlWsyzrVIt0kHmn4v
PBbEEbno7hJwGMTO7RjO5WS0O3KFaraTW11mysVPvfTSBZhmUQFh28h0JqI5VXn6j6zUWm6M7Zy5
eei3SEsMu7qpIQIVuC/DqZpNiiuwsokhchUxRDaiMONxmOJ2dVGv0Me3dMfOlIcs+/zRNO9CR20e
3NYF9OrohZgE7YD43fBVW06A4b14M8piKKql9uXqk0uFrEkvokr8Uik4oq6m4kCbZyx2BoQB2GvF
AuPFwDFe1RP7ZOOtJYm3xsTlqJ9cM9Kk03L9rzM/wPeIGBU2LgUgfIDZHTOPSiM3p+yL46aAMl+w
o1Goa4awhlUjOqz3fbiNpUy5uQK0MU7ceyvCtemH9kkQJ0QOFNDy9e0ZzdTRdmKfxtAJalBQTmuV
zK9z81RmaMLHUq/mKBIWuQkQV0BsEJNI5ZSrM/izfEnqQl3KuK4tSOwHm5gcZEA6usCcwYhbZejc
TDGltXxI//leK/R99s9G3uMB4vUYt+KDpFLZJKZj2Noqu07P74TqDtutBzjUq7vhA6n6Xqmjec/b
emNeZP0FHzsHFw8rrGrKhbZbP7ASZVzAKFd+r9k9WEjmYOlT6abs9YYg9YYarlhpGrTOmtvVahsO
lmzBFdlxL5nlNndxDdmfUBZWf8OoLvWVeMosaD2oGFs30u3WjvjNUb9kUz6Y6gQ8/gvNPdmbwqjm
52+GAOW/0QkHEkUZNBNaNY7RM/QEtBjxHIo60fxne8KdXvHHJ3j5S837mS03SS47MNNDvuWTxC9w
p+UDGxmSwDKIqkAJRTI5YjzCywIgkzudiyvObSflopeE9JYqOhXyka4a6qXA2gRh/eCk+5hBz9j9
egy3HP36jQxfq1GyaXdhW7MTVwpRn3klVSzNztC6ckN6XUZlxbojO/phzuvbujPNlAabFMHeHaOW
qUKV33Cr5P/C9HSHBq8cyxcKLR0d82YkGWtYLMeoAAQvoyeqBPJJQudaxIwdzo5ekN6cvwZSuh93
HX2m+RPIgfthXMSirOVl+tJRV6EqzunJ/RndtUmh4hC0Dpl4LXwwilSyaIBeP5Vs7SQh1z14+z4Q
z9Xpa7rhNU6TEjnynW+YnBe6QSBc8u+j/EaDJkZguvaA1pR37VVTE904++ll3xbCiS9NYp9v4RM3
+LIcYfZekiaU4XiJ1HrNad4kxGc2xu+QSynsYKxHZEWOz3CD6M6hKpPEzNs0qMdpEgv9lHFxJOio
hS1pgdpRQdLdP0jkdq0Q60FQB5tPtEDHS2KT4T78HV1QPveLs/HCUbt6bOaa3aXh204GDz4dF6q9
Ca5R1sP2K5B3ETL6hUO1CqK/1c2mtZGzC1HbRC7Ag1Bz6rRoEo2ogGQayAhnxT6+vFeBm1zxrz1n
4wapSCveH+Py2nAQ5MUy90bvNkdFjHGTW5Tp1PlVXLwo0lpTrdjL8ejKdR450ammsj3lua5QV9bQ
yqoDgrtJ52x96RXrCQBjyyH2WD0+CKQrzqLTKx/1K5z7LCD5rtdOyv37zC6ZAxzyYMt7d99T/m0U
nJgfuyv0IxscsMeM4NAedA9+z6QZZNU3bvY3KCZHrZ0DY4DqeMhBuv/h/N/YrD6Gwky0lU+Ta/re
a08VIT/NJ0QV2WtzORtpHPkjiTOsq78wg6DHcKN7fkBI5s3ZyuwW5smfFC9kcBS57hNsuB0HTMZr
nZ6KLorjnwltZupYJ5aFdmJgpuV8k6v5Qh5QD9vjQCLqFjMqHpn3xs2KthJAvqj2XqIEgqp1WhlA
EfSJ6oK8NKkyFphHIwbFh/DuZ0AggKctgUuO1rImhX7XysOGAo9fMSRZUSEBVCeGP+2pRhQKKTc3
NwZqM+RbeZ0fjCt0rZEFKv9C+PdJ8V884jpXAzNfsyiZ0j7la0+2ioFFwDCSXgvUTnuNmLklenow
Pyb13uevwdMFKEgE2+r2Uquo+WzVKGHo6MBnhQiKJ06bJ57ZvkxtQfFXsyxLMawAbyfiIVa4pv0p
ZWz+6nf+Glv/MDKfKuZvEYvs+yQZ1hpwcKvC0haBPMpzHKvRp85c3bCFSCA3gYv5qvTFKUlNmY5l
A++SiQD5pxnavGpXe5GyRqRPuxqvOiACJG3cSBgYXrIDi/4aqOfvaeoLEOn+giuxqBhkF4QpnGsW
KLdmwB38VUCPuheeg678VWM38G91aCSySRe4GHUFkJhypNtgt+NPDecyvIGodocAIqWx1IepQYWg
c1DXCjwRBefdaiX94kPDVvPPYT5dHEglV1ryU1wueRHkLdtovr0uTzoDtuVcovaxuBmMEaUFQhjJ
aRSDAwi2eEv2fhkyeFYPHdmVo1hBXcBPN+gQXrlA+LbmZ9ryctJKcTh9L8vFrs3QATrTduXXlDvf
yjSB4jpeoGruGdQHBxGwWn9vRk/woQSdxx0H3PczpJsbYQPmLFbeOg757/ecYc3Ju0N7OoZTJEt7
oKtz2Q+AhzN9ebibuBiERVp1o860TbYsN8sACH+N9LbmZXjHuSpDMNlNWAouiNzCXmt2HGmXQqnO
lBg2psCUitEm3Zkmf9mZPUp6sLeOYPp17Ij2uoMm1euYuO4Wh9gxhQ5en/A/spzHFtqfqrxFqN7x
bWwXv1i8OEIIMMGk9wvzEdGK0obmWqR9cncw4yaHd/b2uueWJGaiv+ieNkEGK4pDDAnh6hIaksMD
rX3JFswfrBcdR6UEkvl/N1yb1nxCa07PYKi810qA0bUGezXrG8cpnvKa4CBJRZFGkam09wdKjgDs
f2gl1YzM2HGFQI8SjPuTpbO6j7tnEazvclm4KY5t9v+dmFKOV9TEs0r40kwpwsj9Kt54ts2vJrgc
ZZjlZTtZOSoGRJqL7w5mHdnRAHe1A6vQYcSiooQHBqWdo66w8QiKP7VJCuaaqtfoH9KBN9PphFBq
1elnWDhwWPsIh/Oo/1YML2AZf1AsxZEgnXIG1hbJqU/WZIYFz/QotKfIelpSRIlxAl8qZC44g8LK
pMwRFGJrzrpDBwGCZCGeMRD9Qy/dbl10d2WbwgnmA8/iPOkly3KRQgOQ+mcH/aglv/ctVb3uS26e
/MMLRRB81FsMrZRY2QFZx74cJ2IeugjQeyio4sEErAIT8+NvfRfxMNHyZG6GuGWE9gOfi8YLcdGx
YfAfUqECceehPuUMDgOfQsNbVXFo68hahJl9/fuHZVgS0xikPutNZsdcd4+L+6kvcb5Qnr6aNxmp
alEaGqQLTwtPNnwTgkA6EtOp66CxvjrYNOHRGEWdmkuPOqPy0Oi7zDu/ouRBcS/LEidF0/y7t8fm
XRP7B38HXIWYA2lUe2QfxFcnRW+UZ/MpxvmKV7Nv0r1a8BMaxE4n2J4en7XM+szJf9MvkH3AMz0U
vt7LVZSjlCi9Lg1lquoCn5PrejAwaqqPJn/RY8cYn2TpVnQo6eC6rZmAF2fwZ6r35QRjPDCPaFSn
yLsacZD1dt6ECisOeQ/kFWJmEv03fENM2Wh+jqL508sJSs6guO60SrPyUlthW6R9vP7HEk53IC40
PmzFWbLr60xJdQFiMrG0yGiV5u3xibpSV+QRvEC+VOFUYDeDvo7ufSYo8WFKnZ7JtTH/L5mhpOXW
MI6OQFsNb6fUbWECLpC5uTCqPHfSBLmQzQJGwW//8FZI/R7/Hl6usUzku2SiiDjmXkGweGcD3OOf
DhDADII/RooL5J5N2ODQNeSlNM5xdnlurWymt00e7hPVDamctq+Z0Xw7DKmN5Hnu8/1pjmangLMS
pdUREIJmmRwU0lnoyFiaQeg2a3PdhoUiwQEqFHOJ7mL+2K5+L1CzIuVm1FMbDzDUmlZEsUFST9x7
IeYJnFIyRiFTeSb9go0IZlyxA4bjKGRaHfd90ixxy7xX1XF0nZoeUpVrJNz9WyCzuPdS+q3Ow98o
E8MWCuiuX7+fwZ8bKVnaFJjaHe0VIQ4iekPb5lQFTbLMnY5/H/On8+rAwWLn4A6XAlRUqD2dGkyI
QiTEROBg1FdfAGJh/ZyFf46ry1hwmdSdabaohpCcX9iiYV6nN46ZXi9xQKwxZ3Cn1MAncbbno3l7
HQYpF3nP3CVuJoFGY4kONz4QlA8YHWk1oxMK9RCrTtWoJsfpgkzrGY5yLfJENgn7aDwWz76dVm9K
rtTsaeWSW4i6bK7EaPjhIc1ujzotJE4w3LZ5AzgvINftTQyDQe+IyJSc6hGn6WA4MaUdJp2fshbG
wVtQ/E4pJ7mKN/7/KsJVMtjqeOWNwunY8o83PRUPuwBPupvwRwfHW3G4Z1zAj9zSigRdpUCw3EZ+
HwObvWp8pvlZzIx8QmdipGTYpZ8vMVD/RQlj6/PnLfyXXGHiRSDpilFvoPO3dMkBWSN3rr5CCNIb
KJ8/Hb6OaSi5hd8aWYh10iN8im8l5li2jtNE02KE6m3FmekRMcdmQG2DzG1QB3wXQw9kHPxJ4eas
aZXZ0Twja6GbQMRmg+LU0mw7gd9Jf29X3DnKMI88OgQv6VT8vsxbGdi38PeTQh/mT528/tlTCDry
MLgQ/Qbel5mXweIGFYgl3L+U34pE7K7RJqZPeCjFg8eqD9oXnvbYgl1YC4eU5Zk5+MEl3aFMeYSL
QsU+et9pgB575QNGs7ZSWMk3FqbZMqB29Hxx5EEVHtJovVc0lVbkiTwA1h4Q9GbGl1LeuTrI1zt8
GZJoEvnLNdOOkEV2RlW/MN1h2V5jmF/U/++fBtlJxmwGR5rjOchbvzyV/9692cRItyS29MNxG1J2
b4KMfi3YtgkCYg46ajRIl+HG/LIjoodYO+QEsxVXkX7Y12ZrJ4Xdci9XBrU0G7emeu7YhYknP+J7
rqoVIYJdi9elCHuYowUvFHpWymwFtUKoVLjsQ+2Rt9vAGTQ3MkHSmja4O8CpHuYO5rCkKgjS6IWE
vwVqXGIujY1eLysIA0uRk6b+ZAHxme2wnWxuF3SEx7gTmuZf0vBp3ohaBEbHtmZ2vMoc/+xq4Qtq
gedYfLn41p7zXh3PN2i+CTQPRjgXXQu+unfe8we6M49SXF6sDC6wou9NxmMhb0zYOHV1awpPcD2O
JlOLwJRsWDUX9nsVegRexaZrHU3KaTPzDONPdqjJTPr4k5ur6MBtRNKagBkk4nrWcT0pLKw6tegR
3D+oqRcqzmahMpeomI95ScOgHJKI7oyf8gAZgl8XbwUAQ6xsZUu6jepXAUUd0XahkLhFifi15AmB
oEglh/e/wzwe/f9Y8at6dAsqovaxC2BPwe/uP3Yq3cVcJhNLKnkGld1pZsqPEDx3la9znnQXjMsp
gJovssZ2KLvx/Qg/qh3jmIAlUIqq6x9w1jZLXIudquh5KTpvmhRoFa0WsdJZZLF8TjJuGWM4yu70
SXBpC5vF7hOeJdufFlHqXAfQutJeKzTuVszDyxIRY5cA23cDjGtYhY/aoggD4gjgvVyABhEbo8/e
HxJxZftlDbZUFFUr0vzZkMNuk23Y3aC2fsdf29GEgiWlll9Qc6t+hU7axpAyTzCnc2V/6B3vFBZH
Cq7bsABiLQihqwlyqQKGFE2ESOm5Yc3zrtvxSGcjfF1gcb4/LS3YGlqsBe7wyzzwLw0rBcO/KEK+
1jq/5xpMoc9aK159cdZD0Dui9Du9jx7Bw4oqPHyA2efda0B8QH5gv6vdD6WoUaLV7ses/QeqH84p
osMZn2LtKqOAL9pajXte1KdtNn9hQUp+ebkei29B+9TAobRKIbWef0AeAgnqkcmRSZkItjuEOUNF
39iWr42Z00VMZo42Ln3/78+UsJAaEP+tifHt1EpMNRb6dNbfoOCxsKxGncG1MfKnIxrGajKQC8Zj
m3MhfVCG6Dt+JOnaZ9LTfuTzsefSr5QoOJWb4zIkYZTJ8dAxmZq+J+C6chTcbNwdWsybJw6Pklfp
/lPG5QCtasmxcnGe/RjRjY/1NyeapRIlROGN1AjBctjq1ld7K5ykI/osvKl7ilD3eS1q8ddIV8Sd
GZScpx9TLfWBv6axgpsyi++8WqtakRKdSnSJmkMkGMN7TqPJ9Q0GVTh0ECY1kgihnl+QMziAYhws
bbC/VtT9CpzVwtSQoD39yX3kNHTjJ0M2eEREh+/HAkFDpni2maf+JuFdZ12DOVLopLaQ+RjGdz5H
NKVJQs5EB3CgFhaixznK7KrabLzVbhrfF/vc02licD6tjmuqup2CUi8wipgUE4yPl3ugpijvtwec
m3NpTE+/XiSxifAQDhPl5vY/hi1CYmt9JXR74Nq8sgni99TiENoyryAmWAjXPWyrFnGanP3efciB
vwdjjPz1H0xUNikV7V+fmXrzPW3gNx1u9XsPMMCgnwI9BeW/511IxrNwf78yPOMLK/kxdvL2PdYw
wN0AAlM5zz3YNEKTM3Iud/lEOcMpEsdlSwsxbc9ETFF2TJfLIGqUkVliXqgH8XU1945aq1HJ39XJ
M95nx0sdykjvktQue/gWyd9htf93ZRNvyWZiTFlG+4KWXSiTEosQkZkazuWOhydxCtK00/av9Yoz
xYWOdnTx2ncn5Rc/KAO7kwIflEVx18VBf9MGC3aLKeUYk1yEkdoetFlsfxQ6ZQbWZ+bPcWzJEDOX
j56hJwIQTDrxa+maC8shOLCqFFoKWv5VCuqbJIkYd+wkoS/AKaUtj+9c13PbN8GQv+HtsuiwGI8j
FsCU+xaOVyx1lcr/pbc4yQWsYACTXdWwfyo+OqNPSR1+2VFJ+xNbj8Bao1O8HuQf26ZmV4/mE/0A
0EitZJU0mOgad5nQlseuFEpLaNB+1XHsmvEKtS3xByTaDzvBFnuXJA6XwuMj8V+HVkCG6hht/Vf1
b6TuY7KVUSfKrbWH6EdXVrPSTH9NKDpY1k2VvblIaXlsYQsZoZMg9x82jzVkiYvmbkbig2KPn9Iu
t3dvb3qsf9O2ipN078pgCH1cFTiGQFJKlNmdyifKFYyjLD74oQZGCkImWN27QjIN9P28XVMW7QaT
EmDi4y+5NgDK9XnXDj6NRKCoiIZeF++Vr4ZA1lu8GUffF9GMByNJee9GCmI4nPsoaIYMSOlt+1BC
+wijsw3kDYZN3IXJ5pYesHd/HD1sN1W19HqfqI7zz0q+nDUjhUD6vwneDFHNXKMRr35um534QH8W
ZXRZ5tvMMAQVKdJHROXzbpQbY5Ene+rkm/HrjcE6tX3FJMcnqownBZYw1wI18J+Isi8WjQLCQtdQ
9p+ePQb9ew49fjwcZwQSTDu887m6HxCa6UwmHT2CMNgpNo3ueUwCWrLGayX4PbMClZqNZuOuHBNg
JqI3eLY+2SjTNYDYXsWsypKYkrz5UaOegRuN5DS9cIMVQlziVSW0LbMpsBC3/G4UHiV3KXtlHnT2
KljkHwNXNiNcVDFK+TNpj4RysVnOjXsReh6zhrOwBFyDIFhDTns+ur5veYRJ8u+6CW6nGCZDb8nB
WvdfQWpBVIwzKvbPGCmeLStzCgp2Qrp7jLMc8rV1Sg2JmUxia9A4neYs0xO9eRprIUGZB4Zd8OnW
5940by5W1PqsBKtCkAs0H8OoKBTz2NbT0vi8ZellkluUAVPGAMueIM0AI7R1uRyXL+POB6F/7gvK
9imalegFfIL4jo8x92OMpOwmVriTK7vSPPLSXCnWMBGgM4yqwno3uS3D3IbO1Pn+xucSwcedSTb/
9ua9IW1Q249xCnarAToDmkPRKx9QGna8yaGA0s+jvpogRULDsLK2Vl3nL45fXYAPMWVLA+WL/2hj
XRbWLT6KUuX1ALjmo2/m8LDsAHUPzgq8lfidw+jyg14VIY//69V5Sg+weF/RKKQZjRuMqLq0Mn81
Wy21kDfVDRddwev2Hit86bNH69qQOdi8f+JNl+SVVtDjXaCyXGJCqw1jKMb7nRHuBPyRBizO6WLE
q4UorzSZsDaexS34oBI1pyGdq+UIg+liAUJUSogdzfxtKYrRN82rpZkPMmvKymwHeBy+atp+bswd
BkqjYgYB175OD2hFIit9vCsuBp2crUz6dVGPR2CsO93V2rX/FctcXNigpgL0MJDiU+UwbVTpuBPU
o1hHs1pbz2rrMCTDmauMs/h2NI4YbyaBkShrmXloz9l7FsmchGIc7B6SVXf38akbz9Stei8FBH0W
To+iHb50AiKS4LRiLHqCcry6CXvCjs3fD3w1X2T/MuNQSzXf/fOPZa6xAERUtxuGK74EqC+cU7P6
+BTjv9nxtXyPHlVKiG5SHnxPM1+J/pUFcHFlJhJbrjA4I7Tr4kbA8lipqWynEepQzNoiORL3TkRE
EwNtJ8h7P7VsXI+2NNR9ZKj2cyhY1OO0Knq33+hsTBNldYlCVxS+EeG23++ahSfAx1+vJNfX1vz4
2nhaPXVmBzN2BZTdki8xtWPtjlwHZSiBkbnfmrHUvirctrVVlItJTis8GuJzgdCY2ww6Rt95JVsd
HZkX+/TozNwDXlK/aNCpOg0m6n8/Z4W+hRE/AGx3vpg6YqL9FF+BQaJraZkHXzDt5gwm1G0YXVYF
A8nBnY/ypy9f19R4bemXCw03BsSyqxDTQHBqMEdMqEYs8aSmI0TNOH18pYW2K2oLMgqJzIDoCl0i
hJCKv06aQKHZ/1j+DMf3HD235P/e/EcuvlTZXoeYbs/ZCVXbbIMM8QZJDhIGRKX5swMnAV2WgWBC
G3WxpUj1FJwsa3xv4UAgkcDKC1mlNe6XHKNULQBzj3o1UKGM1K5xZvN8hvXDxcxLXXaxH062bgPA
drVmuL0N++QLbQoiw02ROxERxtejPlx1B7f20zXhZwlErb8x1T3LJN30zVSIJW518TV+MctC7nlK
D/+gYkGpOdhUijoeIsGEQTIP5x50KPD+xNd4bl1Ou59CEvCXB3M+cYGW4TQph064XLQ8aCo9rzvk
cbXGh04aNbecv2CS4E75oecOFjciP7XzMEXuTbgcSW1puZMn9czupor/c0zOiVXNGj+8ffAgnH6r
8RWOtM5xbS1P6vjxWJLfzvNK4gsb6rYn9MdOm9XBzXu/lABm41MTiTBkNqSTpOdeUXQy7Cd1xiqz
kFno8ByHC6J5raECPXKQYGOEp0F+8NO1RHTRXyMOOixJgyQACou3O24gTm3yjcZvGIwpRA6FRZ1Q
gPtyaLdQv4sBs7c/P9Zy4jkbHPZuIVdeZYwuEuxtIuGrCAe6WltVpowm4iWcKrhUO2aSLzmqyEeg
51JaTEQ3Ox8D+pBGsUNxF3oR8rsd9oG5oGYk53WD4UB9lBIdrkFOo09kLEju+s/9krGOrjDV3lS+
PmsM0BAJSGSZmYuNulLKrRUYOVgLsrcUBT6ID+O0EPVZd70qAJE1spji398gcyghHv2ytYgmCXoy
HY4ptVoa+02zOG0+v0UuUpsZBmhmm/MZw2INVANzp5QjXivQUd1/Z2C3k09BjTNDqgUOmpwYWJYL
qfdku6kGt1d8Mjuzy/z7JXDyY6gtayO2x+FXu7ESQ6GXUlOFme5dxpy9+WcN7WvjZZBqbXpBsqut
R9i+vBYECGzJvpXN1KXGqzAWaZCEL6N1Iv5AdJmCgGHB09bCcnPpRdS6llKv/3l8QiBTjZwnE7mB
nof5vCgwWOe3urgxoUtVIrSGRFG1lxWS3kVNVvzqq9Dmu8rWxNpLI9qlWJgBTjiTN5R3z3qpk8Kj
I8OXPuvwugc0SV6nJO5FipwvoDvYko01FrBKEqbkQtEOOER94gSXjYDvwwlfmmicDt1gG97czTzB
LTsYk6/tkQYTcsM80JQyhYVtshloK6vShw1j94pQFLjo8PTFTi3jvh4R+MbyhwmwfshUe3/ISNbS
OwGM9dviCASe0BT/VUJyvyoKd0nFWi2dAMu5B4+eGVBlPvVGoijoYOMh+UzltgA4dLDPZELRoftn
AHTnSS6Z8eIQ28XtM/B6OKfiPXzIreOhFL9FZxtRuFcs+qhw2D2I/FpeX32wvKqFvgmCiJUcylQE
J1GFMW3yi/CA8u08hV4UAhMzQeoQQ19KwWMcSCo4faOmzZmDZWIO2Gy4MQqmHiAA04nollkDmhCA
XkMaPL111xyCP+j7IbkWZWMAk/7+Pd01v2cdGH3bkVwgsS156pfKv/C67CCjgfA1MCldcng1qJ7J
kIAS/wqIRlnxeUaTI6ze+33TeTUiQofWHDD5AtP+oGlchXpN5FoIl8zCGtPGtR0UbFeUb8S0+Zy3
mnkxyTq3ceNYMI/U0lg6QwpSxXxyjzuikyA5YaHl2pzXRpGMrlt3Qt1+JWjlk1JFbnlNPYWxgIKg
wR2iKh67m4Ghw0SuwFwSirUjuvfEb98qCj44uGydUbxCli7tNwvSCAH1GaV8WirIXR7afbK0z8VC
ZvVGSc+cfeNByuokbonVMuVxdcjQVoJ3J4Mm0aTz9tU0+LiTEYv4vuYyOBGRCB6kfEkWkwoClh+j
ol5yMoXMw14+exblTG/mIN4+Z/kEVVSnaQGBuIo1Dfg2gfhKHt+YFpID7npErtj8+Mjf9oupbTAP
Clc8SAffSn5fNPdTvudvzO3FMi6DVcx0XPfp12ozD1DEXIdbLfINugBZAlAJ6sJ2uHs9R1yj3s6i
e+jQOrgNIKIxvvl6V4QaZBuVLkYiL8Qz9nUDvo9f0LoVjrFv9UrFVGhDwndQ0fnuKoqwR/9DOa89
q8q93hy0CbdakbDov/uzTpNr0kMohUU0OxFRxA/7N7EfGWb8/UFpFpOAMNTDm0A7Ks1QWmOuov3Q
92Y933gpq+ifNjNo7kUEpXxkjDEd6YJLlyHFHE8LtVWyL5V7Q7JOm/kXYWLDcii14XIW7CmMDLHL
V6yuyzabvNFZxoeL3MZFxVCbDkeroijO/ZlYY2CSmi3b4+y2tuS0jqj39+eE2+M0tX0069dcAjbr
NEFbf3g6QeTBlrBXsKvbDPEvruhbmeHPsLV44gh3YGZaUnscBqwvWMmnYGQo6Acr/7moNooBabdW
HkPN5VKU/lqWN3VHhSg2wQ0Y8gu2AEvBu6m63m8V4jAdNz6GB8pmjlgYQeovE+MU+DnZkTkialER
gyKuP0dMxlKmAHwosYzG9Daxuf3CnZUHGpu/k97ADjHKnPuQxOJs7a8Ev0IO2Y7zQEAHTH8Tcqk/
2LZUBBLq/y4F8TjrB/mUT8UmjnKYnh4LeL4BxPKVx/KxbKRIGFoLEdd+IVlY6orJxHpmJ2fJKdqL
JT04g75Gid85r9LGGfQBu7tn0mAa4pkK0OuXdnGVbCKcfg2IQ0pplgt8ySlO5bTX3JrmA7cY34XD
cxhiMnO78RLhJQF6wee4chN3QPsdGvRuA9E3vsqPCV5dt3A0F+xO1/B6VQ7TIQQWsVSZUxe45dS2
pcuZk0YR0rMVhjRSq+RwKVvb+4lJB68zTyWi28TrHrBbJRKcf5tjmsT8qNazP+pLXUEQGfTQgr2P
9kj+vuY6V7NQPKgfhqIft7R8ITxVNq8b3rFZ+NmfFCbnheU7jepriSNlNYg/z/fRcT1iffMLK+Jk
HeTQAAhrjal7bhvhvMoxE+DRJ+UuYVp5jbdke8XhZkI7RKosYP3y8d/R1DsWAJz/NY68s9bKpF2r
wQXQ/mFVfzeRyRF2t+r204KzTPH0pbnGIWtRD3D4sawl5N/5J1FqWhzWohDcCndJDAaSk1neEs9L
HIbpB6EtXEmxc0f/kLjnRY7wPinHXvrxGiSa4uV25Lu4FT8TtkSMmBEBEygyhpbFzifqTj5zjpk3
mFlbe+cqEpOfkDhmJzaVdH8/cG8HeoCiBDfOJFPC2sZx/RGIg4UznO8e5fE0zaP8lq3QXKm9bWxh
S8lSbB4AuOH9RkVo8U/QYLKWm5NdhPyNIO/czPWI4UU76lx8RC7+C0hGWmswX/RmlFGoh86AqKuf
i5y3T0swzI5CCsTHSBxnFK0CVLzdNA10rNRRqdhNCaIVbLJ0h8B9ly13U8TCOEDoq9HM3igoSSDX
sE5BxGj8EVVT8GAnFDo4/g2zeQ22Pr+gYcqUM9BCIAz+zaCLxRMQaoAsrUAYvnNEt1SpP20Iy9Mo
E3EjgG4Va/AMvLtQ8v5q6+42HwGaY5J6f7YSSeIgbuQ6kCMm95zUEAVmlxCdRGufVkbqmuCTGjIZ
lABzc79iS8YeV3bnX4WTzNSPD3GTPXhCf+u9U2TWnxPNey/BHeLIDQ5ZLGtog8OE0JvSh89c0WlO
DzBPkIVAaC0CyIURXmiLDxTuuiStNXdW67dcWnz2YzNnE80Nas+Uk1RL5WLqrNfy0rJimKz2xsR9
eVqfgXP1MQ1oKGpCUalrWdY4HqQ2ZgL6J2YuZShwoTMx2qKDqwAlTZDfW4Hj1hJOGusgOshkeysQ
7VX3SM3Q8/gsv5MHKbk+nVjz4kf/pZGy6QFm3bsPxI6c8jQfU/l7UEvxtrDLP6l1eMPXhL7cRu4F
PZRp8y+q/WwucKGvYKg7xsuI5XjDhmTCqMtoof9Hi/83WKrsExj8pOoZd/llTJE2Ab90BHVh7QKz
7o/5emYt5+jCZi5nRk+hna/QXtXnYxVrcL9cmFBrkH8wkwOqi620LH88N76lKEpibAvdrznSqpEB
Bg+B+qVPHS6uYqjM61veQmhiL5Z5rtCbmbCfSLqMPgAik2BIeKXdBvZZDQJ4IeKtLLBoLdM5mvXp
8A+GOYjttn1xQ3t9PTbW9nB3Tor3cyPc3UKz3nJVhqDj9CXOr/v7NACg4f1YIyuM8cQLOSb9nuIy
6tTaFt80a5SwFjF5aalG0yUr5yNC6rrZKUtet289KfjvcZavFO1RNtXq43DoyfvmWvoH+9mr5zcU
OQz/sKjkJAJ93nBcdk84oymUu60HamLPwrINRGLDBUNZTt4epS/99nDg9rs1IT8zJ78j5q86pkAK
1v/wYNUgYbABnUdQ3T/3o041kbGWYJilGq6yyyAsbbKRvW04JXWMD6ScLep55Bc2HGkKUNh4vk7i
itFg7ROLBKiKD5IHWfmVDc2kT/PuNcNyfyYS669FNuKxoZ3eid6OYNG3reMqv9KZuqMRVhW7kkxw
upD4F7bqNL3qNSQWqRj1vWjhBtXBJlelUTAWNbhaofb9DBTQmYrvMheyyRTWKpcEDdX1C+ihPnvK
ZE2K4+FZfiOZxmrYGajOyPiuJjVMe+3mY2EUzL0M8BUuGwr04vNzvHV63nFSLDpFf5DBfJDx4+a/
QQ14ESdJ+A+7+YFuPmn+zjUdWNUEIuN/5HJrHi5SYC9b0sLEFzZd9ct78/xQ5qmmEIcRDfcYxWiU
u89DNtHKsD7eO8Xa5V2RgVAio1FfXxSLO91YClalfyb9ZDoOWIe5WqJK/mWTcg8BxqHky2CBTlfQ
2vakaCYy0Yl2/keczxbkM3M8ZW2EElN9DqkuRtXzCutFALTB0XCqBMC8hn7+aKQ7cdL0RNlGPLk6
66SP064cfVPCmBW7yx/IpGRDsAXDz7PvMBX/B3Oq3z1pwnOX5ZErfcwGh966SYHohCQQQOa/v8MQ
UlOTApQI4BxIcpx+wfmrS2S+djtEe4MofWpwK16/T32hfPgSUWjOkvgqCw7ac8inEex4lXxc2hW4
kz5VD0h3m7pS5kO3blzV9c2+/uEutnKbFdLWHyVqYIaFoaUSy1ZnTFdQLvWskeyUmOCxwfq5Ia6G
YbebJpRK8oE/1qmRUe1sE77WrWMZhibjz1094a9agjwpawolsHQpWzyOp1VKO/kPV6K8Ny7Nm2+1
t9hRdyKRmXGfgJNP7yaT+KjrU/jvHjNwGGapZvgjnpwVrcM4nyYoBBkZm1XsRh7CpC2X59b61oXk
YN+JB3LgfMtAHKdbbSsYJI5jeS2nXQcHVcSJo8yKlhzjxdApEU6tTmprV8g18jTEqx+Po1dFtnan
gBKy0I58sLObYK/AphkY1p8zhUzsXlvr4F80ws5uywS04NeFyGWpK1UQfzhGDFLvXZ0PH/9+0frw
9WlOdboxYBJ5taWefLtT4nFYb4ik7Sma2wQVPg5eUlNGM7fzDYofoNTYPk9hevIFD1leIdrHWbMM
tTOhf5uKjKr4aoG/0t4sjQqu+aO4tqKoXyESgAcwfl2bphEzhWPmZqTy2Jb1129M9YiXqAhfjrP7
R88TGQmwcR4we5htZgHidDE4DdE54GYVhaH7/Kl4Ybq5jAF3krQsC5YkkDBe/tZvnPweNy4/uggX
+y7fqKVeaTc03huzx0yNuIwoNiKpFxiOvXoSMa7aHvRrlq/jKfsLqKSWELhVB5vEVwUbJK//YU3W
nRaCmId8RX3vzABX+6KfH7jgW6ikRBzZtILzfUuNl7yaQ8P2GGqjcCw3SB226+x1fKdddj3CDbTu
AF++i/hpmJd5AROmegoaWA5kcEONUL5QqOoh+Er32q/BBRxx14j+nQflLCkuJPP4e+Z9jA1Csg72
SS2bkiQdD59azyyJPeNWjlxVKVuuCgA4DAaNqj/KEATjlJvNsJNr7f+1SZgjJZ13BoQAb6JKtb8f
zFnn+6tOgfrDfSjkgF7C+aSYs4PyntsAhwLRP0gH4MXnk8OF2X9aSNASRcQwUFduUX3cyRFKOhuK
tHYPu8LSzJ6FT0zMDdDe1ZW8kTCYo5Db+2mN9rIq5iuDApmPHDhvk6k2fQoUpZWIymVHjsvlDX8u
7hHTmxaCUIBd6jvsjCX/LY7FLtYZVmEzdD5KIPL2xOa7ESCfGubwbn9Q/ImlSA63kyjeLwfpKQmO
I+5HEQBs03hAiy8BvXS7pjKsxsPCZtHp5gehjwIGeymVtzQFNER/VyhryWDFfHXtvAVNaoghktm2
t1LPNI6q1YhcjM1EGhqZug9YOGgVvy1aHjf0qBnMMPXmz6fRe/ZU5NehTPN1e2arqAnBxTV4rb+C
7P6ZvyiXZHGT35AZ+ZW022zak8XgVGnYqPbbddl7qSBHNqhnABd33SGrDB8edssgbtqowAVkuu/j
sSxG8eLZBr6W9C/XjZPwz9ELnvg771OaOM1QlkdbkYGwCWF2tnd8F+KnxZHe7cTwBiarRfwox01E
Gq3QmE0+q/iyyIasYdTccRI/womT06CZeYmUx1VeRe7NOYqr6A2+caTKlqo8SY6lyOzm7Iegbm+O
w9NTfW1p8W+PMSkVsjrkIWyZ4cABqCzP+7bPPoO4kEv17H4hMuH1FJhVcR/SUjrxsIgIIGYhzpI3
oIZcMNmnL9iJMceUgF7lyf4QXdeipL+aMR1J3YM0FKb6aYEE5f2HE3mEjbB1nm54D/lPCV/Lq16I
/g8iZa+wXq1/4fl0I1OTZhFsk4SoalaBC79rqM7GBUprqCGNe8u9SCZpod6J1DCW11pJIEPaZrK/
FSwqkPv8fNX0rB2PkU0detIhweb/5wofWSi8eI06LQLOoyaxmNAPjVCj+WbxnJMj2DMR6cfJhcPy
QwLfG0GeLe8xLidlhH77tkmiOOxd/S7Bdoo/nY4ddZ1vGrTam91+niZT+H8EkvG0yJeD+6oX6+Mu
RkR/xSqlWM/T4VYexd9+hDQHfXkeQzo28xqOOEn+p39foGX4x+/7djLrENE6j5UY3cJiyUrEVzdK
auD1oBZR0K5Ob7o2zXxws24zLERRAhmo9mSt5SIgobhPFCqfEAWCAg4vuYB1sTXZtH4b2/3SdqyE
3JHRGG3vuOAax2LzP5oCC7iTTgm0E3hNNFEXByJ5JCLIdK4i+zI9P3Yvx30DSE+01mp4Ku4XVzQ0
nFBmk/jfdoCpA/LCubmtXWdgOJ5TnzKVcq5atKcZPFTRB61bgID26hu1VwjmfdIT1aowBoziPfEj
LYAp0XRNDqT+j2rbgOKRIrE7XYS0jdFyJ0eJfX8MeqNC0CKZqytPN46myCT98bBkmSNaWsfH7GPB
Q6vKeQAHbpOQA1vIokA7hhK4sugTD/z5yDlKnftS4K4WPFFVv1196cRAekB/7hMpzpZ9Zk1kIsBw
Bl01mfE2DC2bXdHI2lNjTXv9pASrqV8NHMmm3hxFScmeXcjo+iBpCTkxJyb4aHx/oi8Pfb+QUVFd
X7Jx4Tm8kbc/ID1VUxxGQG/9xhUjq2FaoyfYgx7KibAEUB0ZRh50NG2DjxAlm3ql8DPGNdsXp6+G
rz3rq4HuD+tzdSqNb4M4bkrsXxnvRewUPpzwbXOJI3GyK8uM26Y9cDnTXatkHwoiL59N2jR3e66t
WX+HDJxYjPDi5Q+W6TCYOxHiVECvwf8GUx+XGZZZ3uKYTMZCG9WOnfEKy43KuAN0GOMloouPNAOM
uK69/W7k5OprKKoqJmZP9iuzfNeJMuHu3Yaa+m7/PogvtZZEaUqs8/hHVZC9f5vX+tPxuN8FfDRr
D70IpKjvYr51mVRrI/LUvLC859OKOWZVMTKFD12po4vyT91uciKEnMGc73D3L+a9GBGAxE2FamFI
tV/+Sf7+vJx1X8y1Z5xSm7SOC5LjfR36Z252/6cyj8AhClDIk0WPwAEBDzwaD4RIRFQqMiv0lmc6
XfO6hUEVIewfr0BA4cEUohJvEUhEimUt3ietxkpJtgHsvVFG1R0/LZbblmKKQhHNUHbLZGfRzmBx
IiCZwcRK32+Or8ZkIYVVDvh5DvVKCTyegslX7zuQDithL8tt0Q80+8LccQ2DF4zkfhNimuLIxKJ0
C0ql5OTGz0lvc46z5f7DZF6okImTL6y9wyw0oEynQA1vBviax8s2jMUgyL5nBiOG9KOnta7tZIm4
3/bj2PqCPyIYJhaLo66jYieHXEHAcOSoxxbAtWDXSkQdHi/DxcPAafpcbel6HdsFk9jb1fuBwLNw
yxbg853/6rd9nIUVcdEv9nAJfJpmX64Bu3FL6NO8uURoEcpsQXQkDbGo63qzBTujG7UPkK1UbIPm
dJEz8E9bsRlXuyvGcPLNcDHezMqffBUYF7ZmHsp2d/+zZ5BuYIyjww0lyXCSPuB0QHfC8CYSai6B
x+g52Ot2M6ov0RGffQDgNg20wxMaiNoY/1JGw/MtQqNFwkfXTAkIEsTooh1U9J9rMI8lWBVfBviX
vbXBQmCmRLZctwhiuB8fuinIVtpgmfjK1cfKL2GF8qxx7QnjKegiadCYmBFXo9ebsa2hPd2dZIXM
HU3Ly6pmZvy4hcS0Oc4zy+c28ZWplkG0y/MBpUHIob5cmA7kymlym/AABBm/fROfP+Q+ofT5KFia
qBfZ/GZQCbg/L15jNQ/pjKpiYuMBbGyfGW/9r0u3UrTiOvrpZWSWlO+MTLdG9/wAEkgFGlLWcfV3
oE0s9fWpie37dmZG4wtpCw/SldKFd01yhu+oyoPMQflPj4zSB0F9qdBd2MsijRsm0zYFSAtv+ypc
NZ7QDo0RS4d7WVq4kg8AUZPm9sMmnJ/gVDtxLVivj3o5Rj03iknZVcpfHNP5jTvcPV22+hPBppRv
084ivqvut17ATl4fr0sd+jmoQuGhYHhTcdiiPgtjzg2Xjbn4u1AELXQ7R21AJEPiCRbLnF8RsL/E
1OnnUVAtZ2cQ2UmDaYFT844ltux/09+4iS5zLISwkcA9uh7y1HXTD1a4VA1Jrcivfwu/E3bLWIvi
JubTprzKd5uf38PnK7UAk0D62eYAnn/dvR+cOiTRUXjJJxoavHCpWvp5N7e9FQ4oxzeZOYGu/44Q
V/o0n+6ipZfhAXP2q0TrOSBCnf7AwptSdRb/gY013N+2hLGFXJTT0ePlbJzoH6AvP+6o+iFJWvma
16cblcETRRI4CiLJ342PyIy6Jfttfrdl+NMEfLiciLGt4Wyi5r3+lFY8BytHiWRgG5nWjGYMu/q4
4gw08OzbGvhDj8V7r0bwrZG02d6ZSK5fYSSeImbpZJfJiLKiJ0wVHmlvLmSNNQbTYc62mDpwU5H1
v5DZ82HWDk5V4sxmgLmZCW9Tn8fDwxWg6x8GWgklISI2dF7XgQc0a2Za8V6AANYc9ErHf0/35zCI
nTjIsuogErQJxmBx8lpxbRWxMifuJA6GVJnT6akYnE57JXJZ24ZZ7t1LiKpkuYaZBH4SQ7ImO3fQ
CqfDzR3qJFCEyCJ7OroPhD4/ijsaICloZoPT8lqgkg6WJE0W90YGYWnGNWQqkJIAV5WhbR7Ym/PE
4SaepyYYhxFFvodMS/Pr2vbIP6GaZaIcdql9RcZA15k1yKx/5ZDfqalrlxRfr9Pr5Uf0kZG5WX45
foiPRw1fDoFllXU9/WmTdyGEVcgIhEnfxAxE8Qt4hFnJDLTdvW8PwDI/YH7gqnpWcV65H8nbc/Ek
Gt2wVL9nyCn3rhdLVSs0yMcxYQo3t3jtSQ+qc2JEI8wtDFwWAIUDlbF1P4ospE++J5vcap7c7Gnx
Xd1exRnhslrtcWpEqpPY270no0MMkNT2WNIUwB0QdGqiBonilepFHD+sNgIu4PmZfk9B6c5sGAf1
tNvHt0zMI4H2bX9QtizTVC4B1k6OT1+HJ8HiheisU/wmcGBpx4hntsI7/khz5yLg8+OQm2w7EZKb
tAeT0hU4q4G31xCcOmHEzCSLmzjWPTaZhS0KX+1/wUt3lDPVaFVl7fFO4Dt9LSe3D4bHPnhgnXaR
ekrbSiUonmkdeMAVIIjqd8iwfMX1yfYCEZfcGT8sICSGv778fM3W+OHFvZI2KWt7n26f/q4CHmXR
5rw3ktlxc3Ju13Umcps/+z1fzCg9WiRmT7qSeReRZPUUrcPgWe493YQL7KyMLS7CQzjRb0wDfmgE
xmbYwEATqL7HV/wv8r+ZoS9cR49obW1+KMM4lCQwBnjfHlLeDnU5+FO2XGvJOZUk1dokrhCK7P+j
YwVy++WHaqw0Or60JvuszhtSOh7iSpaxeW3Vk65vTt41VpDC0XApd+9yDzWtHtSsYRyjF7tNvOIb
7jfytnMD+wlDCwFvaKm+o/q8vjCUjE40wwfEMwb3wi3bvaWb/qAF+31luBgnF2S99Cnzkbs2YbsW
OpDxW0Fl/lkUvywRk2xdJ9orHT8YtafuX9iqUuCf0Vd4p0HxXFgb6jK1s8XOwhE0tiwUKbGxsXUm
5GImjZjy0nneAl0yEUBGaLiCdze8JwINNHFEKooh+qbJa1316pi6VaXUMNa+u1dO/SVMOb6eX9Nw
Fw1TyOtBWMgHTwoexPVVgTNEKznRAQYiWmQObzf0CINeIQDeoDHJME4Ua4L2TEgclIe5MF9BJixs
kUHuzQdAi854A7hdCjwmCgJZSGqWsOPaqKFvvf0IQT51eTJs8l7a9o2HCifQx9unWFwg6SNn5ufn
KI4clR2gdyY/siZYS1oYZwIaa6GTYwsNOx5TwSN/AXDvyEXJPyWYM4zOdolby4OY3g8KOynnQwJE
Mns/O6H5tKvU1P6ATMyvxBOPk6iKVgj5Uu+8WCiEhSMKAtgbleAqqVpUv5Ih+BkNlkljNU4jQTh0
hhTBTyA2SvxubM0v4YL1MuRWb1Ac71KaMHNua26arkPvbCiQs3az8TnecRJjoCpXQX5RilIoDS0s
mjYASPMQoUQowLyDtg7JW/eqbTwZO7u96PbVMzT6UmNLzPiRwRUOf3ZgverelVwRQRisj9Zr1L7n
GjEJpWVudBf1t9bWuwtZZltMwMdBVmUh1j0/1JM9WbDog7JuvA72j/xVIn7oOpSyCa2bt0S0LRAB
Hl0xk/Fq7mtZWG0fh8w8H+n1dCbTOW939SIquvSndrwlpavZUAMqZZaWM808KpqJYssdWbTeAdUJ
OXmjMPjHwQ8zTOYDEq6H4lkhrNHCLhi5UQxQoppwSBvu/QirJBz2spPrq5Uw4Qa4aQ2QeZq0wcpH
j1C6npYN08M5w96zmGPU+gIlwwnHOh1nDrVd0s1SV3kznS35m17H51yYNubcyqd0B2wI7lncK1RS
8QVnzWDQuewhgrphqUBT2FbSRdS7LRVwe1yDaVAu+YDi5LIznrJk+STJwkJXVRkqz8zWAm87zBka
RKJe9J5oCQbWdkvmFOU7g+biZwjrVNQiCNHL84t6BfUS7akeTsdQUGU00NzyAXO1ibr5FRlOcKbJ
5X65KEaxrRRX27aUNK9ktFs1sGEMqYWAp13X80kywFrX0M3Ciaw5XV4ijmsGBdTiBaipDinYnXl7
Ucl87r1wsFwlOANe8e0qXzo9KtIRgq5oDTMkgzvjVLMCO1YoqrCpqMG6mRG5vO+lfzCddeDew2Wt
OwuzmOMqPIy4nwwQiGlz9bBFjDejSmPeVuSZyZl5z+PC20tagAl6l/GqzqQCI/701o4a5xhwI3du
lzGB3uG0+9aQrdJVjIwZkocfBlgvSG9zxedjN2uHQ73EfDHfx7/BZVX2mZ6ticyDu7Zq4Byyli2s
0BunXY3QligQwJgbLMTO6qcWSfPGJWybFSbF5Zf9eFvUz///HhZT+54dtQen26PDRcn1JPNEP3Uj
tvdETv3mfpOPsvsqy7ZewIjkJawqCnOmPw69Ux8JohBluiFd4HG4kIBxfZcL5/PvXc2JWeCxNMNo
rlngq3rqmppzxN4mKwLou4/qWE/3PUJkSdTwV0WjNOdG8bc5yTkHnTQzZi+yxqqNFs5w5baUjcm1
fdd5zHeK3KqqJLzf+ovzZEt60dXPlmCsQ2uMnJZ9Ul8RlmxBRfgbwQGkt1to3WldR5AQutuQ3eQg
//fBAKvHp9FjWZfTp2rXOF0l2BVDpa18fh6l/nS3vp4uozT0zESf3i6ctRsXGoXU2R/6Np94eJWg
UcBPfRBdRVWgqn3Bvf16wkt0hzjkinJ4NCSl9gMNGh9wTRWYAujT5S/AWLBg9uFwsELw/DrHYZjL
YEEUUfNJA5hBlbWuNlOueafpPWbQhHK1VJ0tNm4HD34EsOd3ZGorc3SHS6aoBlsTYKNIAZxKghiI
Mqt9mhLfUFCKO5rLTMitMf2ITKKvGc8XpEPOIQHndFh+IBhrpQczn+ctQGq+eV5BMhfnJECx6tDY
sFMzSuKC5DsMWS455pQDPVgv80pR8YW1u4hMn0A6QdNOgtOzu+Nv0uHKcBFI45+YCuG8sFA6vGVH
w3UYBRqLVlfrhGzSsyauoOy1UYD8gXQzDZjAD9gFvQXp+Xdi/lVJ25eeSgVCA/v2YO1zru8yHgE+
ZQiRaiSryNSyxSYNxj6qViei6GPkhDKbEzL7uvZZH/Z2Ug9HsfU9O9NLcytDBwX2rOijG/K9XjfO
TlNmmCqHXgexzcLD/5P2+OVoff7Mixsvlb8DqhkBuCUBhIInwnVyXv7ciQTUXbV0L4+hbZpNju8L
u6EMm0zrSQjF8LZVyCIU+drSq7G9NKFbWmLir1Rg3reiHY5NtXT+ofgKkQH1Ecvoep5e5GzTd0FN
/1vOf39panP5cfYH4kaxVL09EpkwN91i/80T+Tp+fg7tSzlfR5H61H3d0MlNUmIyBq8/88j89GwF
pHJKByqRdoT3h8L9cSJruC6F6ohSl/pnMh7mTNVW0TJnmzXr5v+aljt8DArID7Cj3NoXPSpv7vwT
edVEZ9ZULduh/TPUx8S44zdNBexOGQKzIVneigGy/EhoopBnvRqcJOMAzVupm8A73E8WqPeJ3NnO
ZQGrtRZlgjXCgskLbT85I+nQukwU3MFC46C1g/GKlUp1ahGnrNmE2J2YCuVWeA9iaNXEqew79Vy/
FDM2b3aqBYGMjsZgPQHNRlzhQ1NJIIAQ0OEcpNorKX+muy8W3z0KmkGEbKHESjX6c9V32W+6NAYw
s9EQ+VALQWI+waRslCIQgImt6Fz+0/sXgfzCYv5JMR9C1e6eusOZlfGYDr/mEM7dZ120VMxG03Cf
Bc6C5ByuL1Hokyx89WlSl7Mc2HyXTHBxFVkRpO/zfN77YAG+2goG+ixl926ebA1WVMcoTRU4C+mI
IVTeFYz5xPWazd/XiBIeim3k0ZibFpLPPzp2r6CgGMnST0M1a/nfTjrrAzGE5nQQEXQtNJvJTxpn
KmovO1gyCDoH9BkbsEbBo6yqjUNGDeioOiYbDh5HQewYX1UNtGvyIbz+gGXpegmVDD1CYD0wBtWi
ZGqqsTn+Xd7Qu9+C51u6kedUWLTUOL0XSrP1I23ReHBNdJhbIIyWIltyT7PurBhHJrvEfj3A4XqS
8kGCmVIbB4ktEsDj3tOL+EVm85JwMJFcZY8jjg2b1GMCnPt0UKesEW/BgQy5ImpJBElE2Y6oqslC
+1r7Pwd6o5ogXwFx7Yl9nJbK7t7QETo2bJ7QMF04VMCkytWb6/SfstTZIOWQoVaKyueGZVX//XW+
2lUnHq2MrTQAXo17avLUxmt4UxVbkdi+GUrNNuZQyWuw+WZ08+xg6w+gqRuFPkrzaEWXfWo6a7+w
rBkL/000hLO7flEn4onR21z9+YollHxNvUk5cCYrEK/fWC4YpDQ4EHyTm+M3wQYACmQtYP/3lqd3
/5HuliiUDPcOGcLonGBO1EtZfN1NwnGJBVBQpaFIzL957BrmgiC1ciASzBEMS2xdR6WvonTm+tvz
afeqhCJ6KkKaFaoUsROPjudjRVH4Dtvujtu0WgQ8B6eT7aJF2miSp35QvutgjucVYdaxLthF5n6Q
ft7bueNuNczHPSJSVsGQ+0xJr3P+48Hgt6qyLdrzalAB/0a7Do/BGNF0g8eLrAwCMCuOWvsJAPCR
hoYCsgEkcEgN1nitLq4DeMQyDmJsH9bi6uQv5+2nwKqmkX4vQvUnkgWSYhXNXpX1HGpmMLSi8zmF
fnW3GzeNfYd2PbrUMKjt2MbTkcHPL11MWQZI/KvWlxa/MItGsjbXO4C4CyqUMXb3AmtnlK6FqC1Y
V8YosiMrhXiIdoQO0sV9EPA+l7+ZmvhHTOCOvCEW2dBgtaS+VhyAwVDSY32nYs0L508H9YTeFErM
BfjtFXo2OgcfUXkRT8mIdfkctQbxzaZ+tAwB71s7jmGV0LFQHXjwSBm3Myvis1vV8UTfCwV37nr5
s1QgsLrYGJzumIE8F9pJs0M/SB23jfU9GcHse3ND0fn4Xo41wa/OwSsydPsO4awW8ZsQYg3Cnk2/
H9yxMWc/mWh3dIaKy/R1j6BMC9sgsvk1nOy+C9kBc7rgpscMNBL0fmOeUDFotKka4xieYBcMCAyN
dGY2cBKeD0bFHH3RNmyRvoHusgDpqnRGFUflAKuqeW6iHGf3ViuhEIzpn4JFNPfyM1nQh/GoVeZD
vbWqFrKusnjn0QRB2v4WT/7lqe99v2QnXZK5k4YK2TCXMWnwRZMRfVldXtiu/vnJxU0eGTiEt93h
gV6I4qXqb63oVsL3CzF1N7fX4+GzbjbaPsbgVYFgYTcaAQiamx+Vnkg6HCLvvs2ROS/ZIGz1L987
Pa+0pqmfTdBidsi0mqY3UtMbAKbn+UCrpF/iR1AI+RmZOL7xCE+32W791HNClfs6Ek3abzSfCq49
2bLCvmqzRjhPlswl+EKvWjgaxED6u6iLnC6LFL+ghPcmNKmjvy31Xbl25BoM2nQrhmDDeDZAA6Tt
tQKnNo1fXB4aYv1xYLfFZ+BOqXofN0Kk9+TwA3FWM171gVAHTq7sxOdbK69chjWxAnJiREB7PCmO
t9sMUrcLbAefp3Can38+/AG212TTC5+Sl4rVszGaVaUfVFAlh90mrCnDVWV1Qftg5Se3gAd/Xb46
T1bXB9MaBnaX+y2B6m3i3Nu9BUO7UcY/t/oTglquoeo+wVciKPqCF9j1rIt/upBeigLysJMiS3Px
+vtQiuAlTZe2Qiwxj/OPvZBcggI3w+ipifFsF7psolxoqvx+/lD3lZ4ZC6LKnqikghTtMccTvbiO
5m/+mWVN2Mg0hMVwkNIPySK2OyjExEL2AIsMofwf0PRgmNyc8SyQ+MZ2Bakv8I73TAsCOjNoakiC
qwnS1kKOVaQzVLmNmxTl3RufvQJ8tyavJgrt+c7AlZ2sUnREO0INT8NowJBFPlccTVBGqxTFV/Qy
X7H2p+/FeNR282ElEgI2L5zaLAWkqzK3X+D1u/nBx+f8Z0sGbXaxKeCHOCYiTDkcf/EtEjWpmdFC
FXgj8H0z4CXMK2riRn3yY6IvTS63P1qc62dW2w7ZzVc9eB6uYIOKoYVa2vA2Rw5mhju3yxJZgUgO
4nB+MUDGbAcDyhnyLFYLdk5OA0xzxJlZkujhE384OItcLQ+dqYsL/SI3XP8AaPbIhQPlmmOT/kgp
iVFmfYV14YDOixsaoYEA7pNeZ/fdfU3/2dT1Manz5xBjeUDDp/59o8MAjAEMSQoOsIdj6O5jUwL0
6j818GuTGUfXSRB0gkB5MC8vwMP6E/63sgLIPl85BalBbWApAnZ93dCdqBalipRiylaIYVcQMgWR
66n83KW54UKGcjVTXROH3eyapiywljjx5vs8SfEMf5EOtrnWWOF/g7zgaCe5dJQlKBG1jLPT54Ne
wWiF3b2mmcYhnwIvLtsd7lekSFqt87gSzejXkOE2q0TV+xl+faGMFTWEe0odfwAgGMCFcgS/yWao
5N4UKxXJ7QEcvE5ITB55g4atn+mhSvaA6Zc0EHvFKpi1j/9gFsAsNgfVPEDE/qTUpaGzQ1y9WcMC
n4ib5IvwXBR0y1VNyYxQKBpnBQy3Swx5eYbRst9tM+pOm80UxUwxe4BtLo8Y3ekJpWESfUgMvV4D
7Cwq06TiylSUdMwbPNNkvepJgZgMYhwsip/3T+3QURU0fZ2VV3AYKExewbAiK1ha9/taIdJNxuqW
defYK5krbunhUNaJZQZ5uEr7GORM35WPjmwxLH68iMPmlSntbG7U9sr3QaxzpVbwLZApqKcxu95j
viTKkZTydt9H8GyJtvNTPF7T7d2g27us0dwYf2kEzP0AH+SCH/EGYS76p79cZkxiDWqF6+h5/IW2
ekjsEHWqwiY22qHfpva8TahOf8n8fAzDxIisiEOxznYvpPtBpiuoHLsOQF4ze79aUT1trnfs/amI
Zf3Iv3THMZ3wtrnhpEl5uBxIYQbYCFf/IxMYdd+rk7CsxxGCbtzNCgyKLmjSPzQTJBM9E3h3zS71
aWXFIXQ/cnAuSQMNjf3vsMRjwhpOK7JNTWaiKbrYC3GwzzfFGArghihS6nVwzG3+B+GIXvdOlwvh
w7liIQ/B5doWZKEagtTpL2K6mG4iQSa9Ad4trIw7VYJ4tCHte1L2Pvj8DbELotGBR0uWW5dHsiDB
v3u3bhJ4YTkva20Qt0e9+YoM7Y8uFl5mJ7ZQuih8xpwJ9rXvrdzcD5IR5aR1OWxoOBI4jWXyDwwU
07gDhoFFMTjC/5sVZzM+v5CfgoZsV0MZlby/hOPw5c8X7akQ+zWAGTZAKJ5xMOpmAKCm2unDE3EQ
lIrc4FoSzkVhFBR/Zz/hfF2anhM9jDi311OHyzVInkh6dljZ3Cai5MaORQ/NyBbE/4zl+jwTMUbZ
SpWRavvDqhW29ocLcq+po4LqYoZJAaa7jVEySuxIFNkcGwdqS5pl6OiRHlTlHEa6AwK5UpwV/rdZ
qcmcGHck03dOFqIX2QVdPSVoVB9M4HDPJsk6NkIm4AUf2PUZo+bRcIXC4KR1lgc2tt8WUgDp7kX9
aXz1+RaS6sNXk/ArHATYH7jeDIOYaM5tiZS0BGQR4dRE98sl/WWbpbDR2qt6BQHxFwySSQUWaH/C
ev/gQuzP+HtPBfY05rpfvae716EP6Q40OORdyHiLOZIRaKCW3G3SNhp/t7f7mCzs2zsLY54s7i3M
hx5+mlf0/EtyXGu0vWmDgr6/oRUyciHmdvfCyH5rsiOJ1gFMkhTEPiGUstFjaFsvvCgUvPaAIDMI
AQ06oJYh2DgAaKx3qiZlix45yNXiQ2E5icnyWbD8aKWBbWA9bKi92BsLfMAVhSxH5p4fCcW1r4T+
gJ2vRnM3ME4gL9LnQ54m3W+KYLxR9ncY0ksgctHPdjyOE8sqCRYKdqZrh7iWyRFwwkgoLAnPqfkQ
0QhqfWCOQcreed06bnhrkN170BDvvCpS3SCRraMAUBWF9Yt9aSWi9fg6LlgKPFl8Y81diuzAjmvk
ilG1cNPeY2X9kFc9wxg4BfkZPCtu9PHqPKSU75G5S/9Cg2Q6RBbjS9gJijZOrfjS/ZsuBt+mS9mz
sffmneJ2QKJtH3V7vWV+Uh17X/KR6K5hB8LUUfyXX5Dx01I8cE3JYIYtYC0AVdmISnr0zZZnr28U
/YFv7y6ZfB7BTF5NOCtzs/08jBs3LoJVvolwin60snOwIs3IEhc6AONM6SQZ11OztIU1pUtfWDG2
LyquWpn4+sAL81S06i3RzxCv7yyAPVS1D2n/hmfcZB88JPP7JXEe7SyUFfQVAlzvTMVbuJIGnLoO
UJvfn78fvwY+uYg/0/VqNjVcHzAcxaWbezoKubjfwLZqUsriSVBcMgCZWR4vBMYQghUji8wiH6Zb
Aq1dVIvlO+WDRUnse2FV1aHch79ZzspU0QV2HYWK0xJIeGP1nTQ4gKq46CQQ1jaDr/OzHGmj9FpU
qKSvY4jf06bfjbAidx/iA4cUdJGQsRi9/DXB6UflQeU24uAZ8/sUZ07gqEeG9N+dvoDBH1tP9o/y
BF6fbIMnHg1Cp4kp3yi7MVOMt0Fhq6cVsLEh/fAIoRgNKMvvzgrvdXuZwqe4BWY1iW2bR3VnqRJr
2n1GVMiuZJAlVsVrX0CCidseH8kuW2e65Dgvu1XNh3XPBu+TMhSVB7waB1SLE7TpRHEyVo0gco+L
+IeFrYzkt/2VnJEN++JfWcnJIt+PtB6uY/f8ujUHEIPfdNWVW9m2j9iJ+XyVPH7sjFi/Q9Nw7C3W
7wt855KMBOcCUYpVPa64KQEKmrnh0VXyTD3dxCSuO9a4GvS2jV1N/GXAfUwymr7rsiL9+bmq38O9
GzmdsYdcr9QEUU+oNgR9T7QcGo+BZlaP5PJy9/Q80u/PYYAYqpNzRsMf7SelMydkVY/QDe7UHe9L
N55TjRs71ulcrxWRYLjagplyyNge6+gyOPMYoTx1g6EN8tR4NDHoYmFWJwUgiT7LRGrZQ3cTO/10
BSDGoSpN/dWtxzRMHjT/27f16a5Awh5Kp0s8Qktqr2eU8l/AgY/IjYgLI8wAgM909d2Wj0PItE9k
QHf4V73UzErKIpAfy1R5s+Y65XIwBrmz3BIESbUUyCtZ6JknE810PPgpPLDRQYV3E9RMXNllULx7
H/fIbzAxYF2hsnXBvlDPiyHDtw46PUNSMxVgMwE3QLUsrJePaRV6XuNG9JZcq3QdSu4WCPzmQKri
26mBylJaPKT4dxjvksZDkWOJvGCzBOe4AcYzG6T0vpl+g9T+s3XMy0RIBoL0Wx6sDXMwOQsSdEM0
0pMujxeseRYk0i+aQimDkFoOLuEKpeP4CYPGbM/aFo+XC59Du4HrS5v9pDZnrmt0tP+Me/NyXaUU
2ChHm80s1DnlQ23h4bBNQL4zZdyibEcgkPDa/0kuio4Typ/m+sk6IzCub+YdWgVsh290iLm7qPWU
iW0IphdMmRVRri5eI1LDSVkRSR+6CwtVT7rVlbKiZkKN1KdT11yzAKe9gkuauYbVaO07Ax4ovOw1
Mh4wh+02MW9XoR1y5KipVyGZH4X48OUOrN97COeMHdh9/+MCkMVGkboxzutSh+ZIDYAOoWbAa6pD
9WPkN39cCZVRffvNSHXz7NDOa6l3yCrQhB1sCJ+vRbqnxd0NMVOEkX50p4xwTt4qomdYE844PG7C
yEvXlBMIvKhf3MQqybuobmLjeWlBbyrSD44VQMmMJwdZ6wj+oEkDy6eOnEAhcfDpXuUAQFAwkaRT
knuiJbAKD5wEqG2ilYFz6WHOXFe6Ngp5QF8R56YQLpPx2ns3fFzvGwreRK8l0ROP6v6IXmMeJq5s
whxPIVK2hJPHFXM8zDmqLFh5HTbwQQ2XPmtcCrEZpBOgFfvnfms9dA5Ppjy/KRDT23PowGoG6Dcb
kPpT//yd+jHH+NhQTReuASOeACLrGi8IIZP+GPgwkfLjTy4SG5UqlD6/xYkxs6UHhwDtr3Tt8Gsh
RdPJtr46XXUX++jv8etd0CESWEI5rnf3UEWiVIhXsbxRfo+ayvtDOtsCPQDcCeirB7hgsavCSYmz
EoZmA6phsJXW3OM9zwRLd2+AA2SK+qhzvhKynZHfQn578VoAdqsqRLs6r6RZPv3LJJC2PoKCKBp3
BbRSWXfZ7vdqoydGVgUaF6yl0tbq6X4I9DSottDrw+hWz8/zTsccwzrdlnBxZHt4OjdXwLOqIqil
DdWFW8d/gtwJZEPJOf3MpR5GOQKv29EGRJAAAKAQDVMzW54yVDiDMOcv0hpfPJIYYlY7IPT1wUXk
2a89+6HiGszBuMQYGa28Rfu3RV1v5XndTQUU3bUK2C6My5XGbNCsVrpCD12alq2umbIouMxXLXVn
D2F1nYizje9JBdGlv6vH24fJdDIPBHVx1t6JoN4415HQhJ9uNAoqq6XjV5KvmavuA6+FgcAvwklJ
KZ2lFYOiyNbOYGeq+t9hjWpYwbE9uK1IG9tFCVkSMym2rJdH1o3gsTMIWAQoaTDu/dyDL7CHKw+y
FHwpGxhtN1xRGang7CjsWx+COetJXu8agU6r+TqzGFg/T41FtxGjqrWj4cAvSb3N4gFYdtcK1biC
a610n0mmx78iI3Fr5Bgke7+f4P19oNSE2WoGYlyB+GA44GUU1ns4gDnkfH6AYI1iLJgBpf6GnRXJ
9tWOFeKx74dLf5i5V/B5+8ewIr4CX7QKXmvE5AYKEYgX1I3/VVLc4K7XaxHcoTP1iE7ggnkF9V7p
AvSQEKQvdhtNfcNVnhnq1YgjreKBXrHqeloEPyRq849oIW1yus50qePPH/g1RcZ2jTeIZj4ZV7SE
z8yTHYGx0JIuII/VfCYerzTvKMZN6GvaYbeQSAuCojvnPX+TW2VJAEUYdtUKt0lvnowxVVS3Z5bv
A3uKef9cOwzz7WbdqXOcqHQ8NLfQeu3mbLoibiqXXOPuqIAywENKwLXNLs+vOhPwDMVUSxHW0o91
3U1/YnRvMRXB5M6sT0tipkSr4PJ8e/3l2TecOZ8hnVu/rz1eP88rdKr1pt5CSO4Hwx/+efYMfAGN
VyDESZ0iRVJGbNpNDr9+77SHjmwubsh+vqSmYpbjn+T4j7Th6mCRXoKS7ujYUoQZpiHZQv6NjY7y
1vuOt+I57i9E6cXv8xwkTYN2NwNqzjdIgUYDJImxgF5dNbb9ucsKkUaz25ZOiZ57q61csAg4c1oP
YcPbS958vVv+S28utbLviJZQE+RlUF07aQo46NdGwf7GKaVU4mFbNos5hP1Kvsub2bQHJD2Gw4nY
+udLRHAofaSYdD0ffais+Ozy3N0K0GF5YFBgdmbovnJeU4W8DJplKx/l0yjSPmD80TLYH34a5jhu
paBfZbxLwt7rodrDklAySZSUY9U8ofhsrBjTg+yQLRQspm+tgcUWXer8IFseAnFxL5nQr0i3viX3
UR1A0hIbK+F/4Uj8RaV4mWJHQtKB2mc+ANfZhVqNej3uVXkwhapfllfVtHUuG5WRQBJJXIOSP64j
LPfgh2JOggOhWca6sHqhxvgcUUMqlPmQmiDR2xW/CApHV4SXgmwC7P2M7APf6jJDNw/24m858NfN
yFiqbfn7Quhkmr6XqLEaooAoTtqY0mLypgYuPSJEtNGZHWNxKoPIAT3UmXdI5HAQF9ljRuAEsyfV
fWeUiAtpNdDGKjHFojCre+8TGr69HyeVvUulICZwG67lgVm7UBOhZYVWUaoM2rFOJN9bI6AGpE3+
4a9Mb72BigW2NpZZ28phlwSJRzOPHrznb/LiJ8oQiQHntQMno6Agz/IqNdP+GoQ1Ph6Cs6THeYN3
tDsaCEg0SrNA1SyQc/L9t3ft2C8vDeoemdGui9BRPzamaEEs/Unpoe1mGcnWJh1t4yFkfu1slybI
L78dpOdE/j5c3JsKhL95/SeZx0FEBq8q+HFHCNv4EJzvWC59RykorhMZts/touJPpwZYKRJtWzM1
mBGZATHSh6yKmJmhvDNx4QV+KcJ9OzWXabqBoaLqT+F9tK7YUWHNIw0L9GlY7Q9Mi6DcqkkC/4Xy
Abesi6A8acMiYgb+R5/PZYcwjqiPo/wnmRrFU72kJD/qcPie7FTxRMzSkjg1+66mh/LPNIrfQ4Rj
CM7ylZipmZTUVr7tJblcKPx3CbIjo5oJ4ZFcBJxDjO/K2XIojh2Ha+R/z9uVIAc2/1zwSvTc9cPp
rTqjHJtFhp0pU1qjCPGtvK8V0+YIIPXyVqwJw9onG1HTLXq4ajfwrL+08/Oh3S+l6rxVxMqT3W2b
JgUd+HsNufl2wtEC7IGenXD0zVMACbPOuMG4N6QJX5laX/Q+738PiQzK5DkNiHGUW/UYMGW6WmJ0
8Y/YhXmelX3NRM4VjZg+ig2Opesb1bBI4mcECq1a5HLlOltkCADA+OEY/eOyMI+oVIvTMK9BZyhX
je5GCmmSgKn3B885SLPXtfnKZkTBR0wH6Q4ISxnxzuL4omMACzG9i48tvrdUtyjlvIUqNbe8UVLm
qvIux8wmRzlkdyRwx+NJC/zlLUiEcPH6n3Z82kFjAE8YGmbBxK08QUiQ+SsvzrbbFU6XxyZcXHvM
Mk3XHtYfgOw1yy9veX7EA37msaOVVXxqfHjy25c+tXaeP0XYrw8ingGyYKONeKWjCNSTR3YPKMid
k4vAO7LvVQ7y013SNaT7xbm6ffY802wAHDKCqnDR2zBC4IMp6Frx8/iGvtuzDdt1dvSsTfXyPJWC
75VnOnLoOFTTeavu8vYzRa2yECgnPII3gNP65CRYB401TKUQ9MVyFcvK168n6Qp7jqKhjwiJiMr5
wf5WST3s/IJIV9/v3xVmp57dJ8Igwi0KkrDVPXGUK0K5pop79VdEDDsqSDXB5Fj8yU0mcoMzxoS+
bNbe1AQJdqtFMLkUgYlAyyMtPXlT50ndnZmDhatLquaTSH1/SAhhgG5t8f4KCURM1qM4v1LI0QxG
WYB7axVYAVDoGrcnnmYrHcWCzmwlpnKSD0b6n7hnbS3O43SQk3XTuaE58rAliGL+lHw3yWDOYhSG
iFgMycyedMJv5axbVnx3vabenM3aP0X/ZJ32jzX34czN9pGKU4VIVkzLCJAHnBil/GIsARyWpoPj
ze7JB2Vwh4ob/TwS9ez+p3/mJ8IoXcVR/WNe8wfVl3TaKOs3Wc7mW8K9eAM6yjvtYAgHZiCE8dGv
tuZ5tnPaggJtlgMrYSWsUu+mqKZn/Wy+DTq30j5EKEU2Ulg9+JTlXUz5wbvci2mjseG9MGJtL/8R
Hin2eJesX/y1pbbo8N8K5myA29hwOmrY+N40NpXXCWx7UgL9al6+GLH8EuZv29oIiew9re5SMgVU
fyKJmjluLUkNIMxIfrKG6t8yNYPzAQtcI9NPgbRHMp6HviIckmETr2mOuyLB/KCL1zhDZUHEAgtF
Ss9CTSUuBa4u+FLxe4BItxKQ+Y3VBXgmabQZEkWYVlRXTQr1TFrkj7iABHyQuvzabp0lZ8iQrq3N
/axkGz6gjqxoz0UlGQd5FyhxpE2CVR47we4t0zHToOWz7zrE7gNj4eLcGPjYTwyyPtVszlk+IwEV
wN6logoUZr/IuscIqMCOansFgm9JclJyF6jZeRWSokeY+dwrxf1X4aZOXC/V1yv9Pccsnct91PYT
q1xiOFECgbFKe/oDhKynzfZk2AGIk28cO5RkKkWICmTS5ItkvchS1pLaQeEdLQww4eg9APkdkVo5
EbNj8gOmxhAAmcLnvczp1/hf1yCCsTMLjLNfyqRJs06mWdEB2A2DvU7DccXJ8u8LWLcX5xe5Qbw2
QDu2dxniGBFPvfxg/JfOH+9gikc/JbeGCEi0cHr0w0DYcUhc3Aq5O3b8r6Yx088g5dlxC/wQFjBs
+FQ9dbwLA0qM27oPhUdRN/MzrrJMZ8RW68Cj/3OPmHGqqTM7eX4ZIxcN5mt83BiwgMLGv04w9eEv
0Jz3+NYLim7Z2TNfwyDbsNUmVsjJM7mL+OyLi9dUQqSIqQzehzwz/M6R1hebXqjw5DDcgcTf1Kg9
/0njcwATiu4PwCFJDZ4Ft0Jy+hFczYfZM7mfqaWZmNoa35bqKfJDvYgShaCGWy43G/ZE58H9it0s
Y5971ZAdGw3Jh9wBFynWNZZD6rdcB9o3eIACdKTwuDWhVhihBMFGpGkchYN3ad6tgs+8dLSC0RvU
OZMkX/4wWFD50gwL0zCc5xIjq9C294XOwtM9sQdJTLdEygDsXebQPJE5JVpevJGJH0uWWDOQPJo4
nbAZsNsHPE080Xoh160QxbygpbLJftFxrB0uS9Hrqsdk6zi6syOFiOlawRZtz0+OP2DcIEqZI0vf
UO3we+HpXyfIivX+AsmMNhpmBzfEtkpwwcnxgnaAw1g9dpAT6VieiMS+8CZLZkOQ4k+DStBiPr1d
GNYgNQEWuQo8ZMe4jGg/iJm9zsg4YNQUlVtUIslIKkQxop7ypseXqN3DjW2GGZ86AsOTZtCnut/O
Xk2P/OrbAKkUel/MBiL0/Q2BybPIy8iUkWee0XiVDzgMIsVClvnKvLVQeFaYvmLVgFjcN6QFe0qY
cy6Q5zDamlgv7SBc8wMk0M92gWQCa9eXAivjSGovGBv6CxqelWZa7Q5wngNooIUjVrzPeRR4pBqI
TocQ1328oTH33ENfsqHI7IasqgioCdAJuvMg2e3bMdMLvgOkw8rv+afjoyjPk5YZdVXqkZKF847q
D1PESllJpzXVfJNrrFY6OdwVsIk16z7+nWkjMiZRuwH5SoO24c+WBwhJMiG1oOwQFc9nr//FMgzH
/ROh6s+eOO0dAWDB0oaSnwcOfoH839KJFRhiTBXZxnm3osfsVrPnCOMguEz1SODMbQ4RQgm5307L
vcD/2Fmm1keWiP7T5cpkTv7eLUqm8G+Tf5nlEIk1/St34jZA+oSsIXyfremgtSv/TgaM0l+qs2hL
xRpmmlC7oE/J2JQC8+SvsvoH0WRZ4RfAj+2aAgv8ZTQZOioWIP+BCQtVSd6C46gS/42yOzFRz6kk
klD/YvTHyiNw6HUywWWEMwUSIzH6OndKw0UdWOvu8eOw+7cKwoeCzWFHazRytPBf+/Mst8mVkau0
kgWpaudArqmQxM+DzsC5AE5OYin8s3w0hlPs79S67Rv+6gYc6jkXRpUeB8iUIBZmib9QafHxI597
GZNXiWFamgOULfoExSAjTX6ZM9u54EJeOTzOHkiEaZgfzgVPVn9Ig0TlJhlhAbtWeltaPIGgAZIK
DVcXZIALqL67+L4H73/90EDjW37TpQ0ISlZ1E3a3Xz6Im6P4pRuY3CDbrGLCpxp//81m6E4gasxm
TUPQ47fpo8IoMfC7bZ+R9FM9gz1Ib7Ym0mwhpFNfvkkysQwaQiFia458LpQpi6+rfXddCkBc31ha
Ho8xGdYaUC9iSvwW+0iEM2uw5PV/uJ5Y0JRUY+XEzykQJmeHapgSIIhxMAVaNnyqnZAPEOU9gD2c
O4itnBCmY+a4+HgeGvm7i1ljMLcHkHyjpa/bHPmuVpZOc+WaIt2eRLN5siHYvfJAp+MH6NjDjwZC
w82p1WO1lJQn4uKlg9gQOc/l1ylZavV+TU+fd9YPPQxzWgixDlLaosfVh7ILujvW+cYFOFB60Xl6
EGErVQRvNLXEayZxt2EsqJ67Z2B9G4HOeV8iU3+LqV7bMQfMP2b1fZvPPjwjZFYrfAB3jzz/P0xB
2rOcESGUDNpMvVOoIAzmfRUIvteGZo0T5EmOP2Ehu0vwvEmJxljugQ98jPYInIavsRS/xfB/GreV
46s2aut8Je1h4x/EBi+GS0BZpSxPDbRUCPYnimAmtMP0lNCdMTcJtgwyJBWD2Al7CLbR3eBF63gV
GH0PHSOpGoD8kUaKZ0IdSdN82EieoKkqs3SZiJ0pDAO+2PMp1ku4a3OAjUKLK3mmqFE1MBKu73si
ch4QCgSrP20Q9jybhdVbV+kvHEdNJQq2/nlX2KFfM9dF0qKWxbc7sDFv72zdYpAjfwek9k5K7vXo
WyXCdQM8COGohc7jHN5EW8g6N102LnRyvHH3he5s+dzbRN3KE/4JkuTiWKhgqDFZuALr5iWhSQef
SV0UmQbx6cW8WEmNRu4aKOs1SklfCL/6s7JLooMoM3CHiUBee3ok6g/uAFmwfY1M/YU0gpy5k9mS
GaPXVV/QJ1+XTkXMpbK0TLmoVe/15KEFqNkvLG+nJXpp/iMa9EvoOBccn/Y/xVCZDuoMUzVcmW9/
PnO08Q5FEX3RMOTHCS8Zw9E+xnMm8TPnR4jN0mRh2AmAzMlnb3bIT6zIh/F3l6feAgEFaHdiP5qp
E24j2gfSCPomhtyOGE7LrZ/wJD7FaK706+aq34LbAoXADrRvlXzQelLHHd7JujblKJJpBKQexX7z
oTlkuIL8XX8UKObUG7+3vL3AXuPezJvp2vJi4k4HD9mRSww0Thki7ppjuS26brqCidIEsTdHYvya
aWkx5Mez7OnZYJIYru+lb3uSeQKlJ/txmy2jcH6t1b4mR8iujClelX5P6MlFKVBrpWqkoqdDsEK8
z7RB8RbzLGw6+oJ2IoBR8o/a2rmGirylqJnHepMh6YrjwOZmJJA0qiT5v7ZZ60OtWatikStG3rE4
69RdI77Xjm+cTvjtA9aH3d7kr94YP3iEfpaeEbhK4kyVekbmOQu+6dup4w6tfCZzaz2hRL68Dmsg
EqYtQpxarbVV7x4gPAL9CeOJRcqY7fectLPqrzIZOb8XqcMD50zIP9G7iEcjKSAFwheJf1wXZq6u
kGmuVcGCqy3Ft8B/vm6r2t/fw1hJVIRSBqE9VBM5KdxdOyhPMiK+CKTKibGu/hxvnPao+rpN1zdr
fnQp9pT7gk8vy8RcS8mRog0W/nkYFWTGmVeMpShTHFt0NOE82QEAG7EOUuvwWq9sTz/2kNd2fLE/
tgXJGWdccpPJyiN1GlNvjiKNvMkNiYnqE6U8vXLDkigKyHRrgeImwKDGdrSqGtneD5FB1sTMpaj4
eidAWBm5TluEJMQziTJ0hY1B01Bh2JEfUPZ9mBLo5r7q3Nf9Nv4fpaIE1i5cN3V2tJwGAXLExiIs
u/4UEmb9FDbj4knqWXH1jOb7nCaxTmnc+fKkBWqpujTIb1FfcOGYgGdprmubehdUuP1kWcOZbhOu
IEFfViqRoxDBNeSPXBAVeFHO3yERDjKQpIs2M/E1CclGG8k2eafrK4ZUMVR6AlWNlOjeiHSsKsVO
XVOFIWsUcPonpsKQL3+xBHealoCN7xWD0i0wwyENVbroNwcs6PJiJkh86Ow1x5qfi1HkgLkSnAYz
01/r5L5VZnv98r31ZIREHkCfl/vgo5uBP5v2eM5u5o6Q6BD9G4HQ2H4WSJAFsAVYQTl0RvXTS3aj
t2icREUhQVPNECcFvmpGglWWLolbFscJIwu7U9US1E3PjMMpMkeslXzFCQJQRoS1hTHmjxVHiRD0
ERxn5CvmhkURmcuq5KmKmGsQjpCsT7bseS3sQcPHgQbkO7Cj0qLBF5XqNb1nkH9PlnMgd5mGf9ge
rPTX1q1Yd4W27rNK94//TpxeiB58Gny/tzFnlBymo4SDErmeXwnVOZW6BqRHr+Di6XD9LkFFjkR7
He/8l8xhOSfZcSAd48LkfiTEoB/R0HBgtSsUEWK6Knp2tffF0qmiM/TaTSXGEpdPGVnQRNpIhANo
eF21+ZVZHx/eGJCYmzG2vk3DvadWa5fQ4KrsQlpA84yOcdWoUHqmXDMFYNLTY+D6ty9zGy0TK8KJ
/HRgdpWOOf3YHqlcaK0/AABumP23dGKTqcVYpgs+N+LBGvpOu5m58TVjIoKPP89vTNbrPQpwH5o5
N+QFqK6Rd2DsyMlPFFF5ZrbvMFXD4LuNrZo0ZDFUXQgW81u7eO8LE0FA/h/C/VZ7qO8wjNoo9pao
WoNrLt7Six5u7K9BuXgtdVaDPDhsomyiXISjBp37bzC04E4ia70ahab7iaTZdN6bV3FGQrsblgwX
v5LTbFiPuay101BDoSZv0su5p7L7Ut5R3kIxJmQB5rwL/6ZvjElzVXsaCKu9OTabkq/8jVekf9wy
m7HCXpD+vUqrMaGsyG5K/iEOX2qwlR9jJBWyiT/O7N5Ll5uGtYnAL9cPlR6TpGlxyqTQeLrbo4IK
7RAau+VlaOMJVII0DIaFZ1RPczuCyHcUYmX05ofHXGs74wbe3d2kMSQEFKY/wL5aFQN0Tye88DVR
B4x5r67+NQrSzSkBvNJ5S8d9VCIDWUKOLpWZsqF5Aa4z0gEGXYzVZ39VLN0YfbWZjwww5O2/hZaY
pnnbCSRyNj2Hu4kHPtyl0F3LhX9fqLU4ABasyABAbhSV8l0n6hOCmPFLzzvCHGehc5Z8EA/FB/g4
ytq1shXOqW3SqcXlMbD/d8YGKY6T7SEmJlJ2zwE2cdlYsHQjSZoX1vo+SwW+NqjZaMHziUGylDYw
TOfCeWKsbV34X2mna/Dvi/EYH9/e6JF930n2I3HnW477NK7ZmwShIQG7NIO7g+9DLBwlmOksua4X
rrcuG5o5O/wXyRk8D6b9eLTTvEvQFIk5li6DNzvwgV1/FdUk+LswVnP7ml5YgruC4nxPpBeDU7BL
ULZp8QU8yJ1hDR44TcH128qcIuVBcGqtnESUlJLctibRPMnAKXPaRjPpmdTAEUgeobJs2mylEC2j
gkL6Kvy8DBnHutZCzISwVMVw3iBsP4uONKs685OtTMcSemQ4DpQZweaJOgt6HpD6lzac16c5fnUk
2Mzs1aLGdMjXJoOYaCY4hU3COWb9v2oHJCw437ag39vSPvt1A9L+zTx92FcsWijwRR5j2de1U2Xb
B2ZGIZ+Ucox2yMNOdtfQJmW6WsYE622mFiI/pxu5RimzG3n2RYrHUz7TdEU8uHZhQzAFzXi692AF
F097YqMdJOuU/V8SEpMRU8L5rRNrgDR+FvPtZ+9OSCdJ3TONG3LKEG697MGjFi0jrXOFYTpGR5kZ
fcQJLkF1nV1NcvYqKboAlUDpHYxWFfDjknJ33UhfmSdo64qNbf3mn4R8EBGzQ9ryH3McO42Hw3Q6
xNN4QWFtQvNN+/SshOID1jFvWvPnWH0307pvAsrtZ0+Uj9I8zYtz8iOGziDWAcASCssyu+5bgtaK
098bXU4di0zHiTEjHQ8YGJyOyiTmfFQGy9t423x13Zk9qKzWp0IyfWkha7EO7H/EoMJgwmZMly07
Wimb98xiQ+URznOWHT+530/K3RG+00DF84JTPvXZv0ChjyWsJmcjP8AsDjw3FSEAHuublNDuZ5Jb
zYQ5kRffHB2w7RMfvpVv/vDIUAkqg4ZkKFyLttmv+HE0yFnLM/jpgfWPFwY9BMev/wsp9xc6c8Ft
5WvXN/MjRC0gUQt1vnsB/oVCO6X/rTBcI/XY2OG8XNuWYmAMkTrJ8y/YttFWqzeSrFSupcygaaSW
Oky868diaDgTml41+c2go48/PZIQHvUeJvCRlRml3FGvnibr0ZOQoONhKQqfA2Ny7+qsRNQJhKrG
3DfOKK9TfnVbcQrskgXeBZNDiu29eszYvuvU/B/OZy+4RmjYzvSNUBcoVviWTP3jYAA7cGa3p9Dz
qyU+grZBM/WZj16SrOkovjmAf88wsvAGnZ423MtQ5j88x3I5j63iQMmbdCPiVntC+SoGK2Rehyc9
+MVlLbDCFJI4TIheqfrbQK/tPNmiNbu6QHjmnRBO49E+6etRkPXUUD9bfcqsaFfZEQxKaeMMD/t6
s1OnIx8ZPIedfT/t/PM7ibcg5Eai2YxEHlD3HG7hcQDrC92ZbM/ZnM87Vc6BSsRglH3NwTeoZ36E
J6qqGyhC8jPkJuAVY9piL9ofsArGvhsf8/98MR/GOgNLahQndowKzrtMZ/HfI2e4/75eOIMvKJf2
IcOCRC6S27odYBq7q9uVDdZyP5siTEdhLGlTMYQrvYNvuMXB/kW/OboH6Q0qoxF414UxbSxblLh0
F+rY1sp9OpEMwi6aXxgL0+V2QwF0Yb+jCKEu3BWtTJT7Pc2VcHVcOWYwKe+G/WOo11rK/cG7GaDX
LFPi8t+ilbGC2Wyr566N6Nud6xjPoDTsi8YshSffqbeSxRe36vh3m5v59eL0/48FZ7pqJ/PJBL3t
DhcPO0uxxqRsMReqXWjULbGYePxAwMnhQIYFEB0bbLoVkLlmXsg/iPp/UXnJNLipUYy6sBZjxCv0
GmoklK/64iJ/Jk06N1NgzMY0eggVwyTI1S6CT7y2T5Hwd+I1QSliNj+ieNy8KEAyQqljcukF5Dhe
SszeRi99CtMG/wPsLw8JcHP67ET5poA1YtZ1pvP9N1n+iXNGiW6JG+ka1zYaDxo5+HtT7bXBa4MD
0oSxPM6BF5xQpNuwn4zsnKic4l0zSyTPPOneHxQwZ7b5ggTemiz40VVSmzqMv2AyiJDl3bVS/wSh
4ys+6nithn/B9344aWYd9+f6YC5uUD4clwLGoT/pLNqTV5jceGZm2PSRc0TanjUtwlMEem2zBTP1
4t21Ja7pT/fk9dx0s30kROgILAvvRxChJFsu5Xv+gqccETxT83c5AA9gsvZinG8Xc054HomAE9JA
/bc3npnrOAYgb8f8O7CgCYTVF8gnyFeUC1aMRG1stas1AVLch6P4pjKex3EbTRyXFRq1OPFkcLlL
riZyWtl34avtIsq7fZOWjUUJrpF0y3X8MY47JsfApH5RZEMV6Uom1WIFWPRU6WhhUJfdF/E+Gclr
EYJICELRsVRvEjsPL2iPoB8S5Q6FfolAlaEj74aT+RFZL053NFWXK5k/sBs7znljuT9QcuLJ+ZaT
FrSt3FDXBTkhPdaJc3S0vw+a733N17ezAS2b6qwKgKqNAg2XxbR+6AQBtVp6W2919l8sC/LilIk5
KMKkfx9aTIVZFyf8EqkwVhlrx8VYxL4+9wEDpeD0M+jyk0MmGus1wVkKPenz0VAujEjtSFcfwblg
K7Yf5srNDEFyEVjnxfvbtKXHtxRCWh4Z5oDzSRg5pUS6Bz0/u7LKnZtxHNk8yZNMmn2h/pXipSCE
vQriuJKK/ZXJ9mxFqK2HV0sX+OSHEGuJs3dmXsJzshzFV4W2/+pVVXiljYiLCAOMq5Zk3I5EIPXP
EWrhFQJCDYb8r0qGpGTZPSqsoNfnmvZaTP0IfMhCUxtyQDpd8MlcrAYdlc/jgEiry6PZJ3l0907T
vfSjx+pWO5InHeIhSHt/3LRLyKqmRlGqpmmFHalewuvWmd55UtFKhFQ0MEgyov5ztYHRSBLTss4T
JgQXnVn5xx+U0CNGwyeNOqdcQVeJ142GRVvPjseHP6ZyaFJBlFLnSeFL8eMSV8nPPo1rM6zOoKay
JLrzQ3gP4nO9GAn48/YLCrBmwTWiSW8mO4e44SuI1xUNYb236NQwBtVdDw0EsZgPknEYxURLkd3y
5tU3HsrxsaqQUNGvqJaqgVx8un26ddX0DxHDt7nJ+Q+hYtUhWGUUWHxRlpxdJYSn9MQp3vpFOkrl
OwUidiQ1UaNUoTdpF406r0FCxFmqiH2XvNZF7nqi1Yh0rfUKKzFqsSnFLiQRgzneM+YRktLUZ+wL
Aiuyu3c42I2fM4/8KW/MzbwAIwD74LMJlCHUtSDR784K2RJY3fOxwqxVpvz7xwd298FIfsLJI0mt
xWpOS4LBuosahMkEaT0kvhRvtl7Pp/lcFK6e5IB9T9JyM/0fPnLJpaLB0oxEqd0SFslwcwqFRB0b
gCo7CJuULDlyylFzzyMLYj8ct3pV0keBFRezt8wheu2+AeH5wB7PLFEaegWlW6xnHzu/l0Se7a5G
cVAEUq9nW5jr6saIdMdW5NOXnhE2nNQojAi6k55EoB+U3FOJ5MGB4yuLytZg9LGr3LoOd1HhXVWt
JcuqEbS8jiKX2AkwQhkcWtPrmdvOr/NzeHN+GNvaL6tozFclHO5s5crlRcQ/yRDsknYVwa8wN7Hm
57bEfXEtzNppLv2CXH2BglxPVtPfMGAD/oaPlMx+llIgkS0cARZx6KIo8Ab5xuj4TZpM1W0n2uoE
YHDyHtCrqwqlyKgBf5Y3CPb2r16KTvu8ccMvmJ+mw2e4u5FNmVIFUCzp2haNthPj6hqGXC4f+77J
VTovhrWZN+M+oyX/qRFlKN+meUWYfruK1ywMclX6058qB/CUPAxYwnh4wADxEOQdbZWNmcyKBXRI
q4db2vOP03sG2HXEBvr1sNIfDbM6pBtjPrTy7+i72L1q4x9fENEZx5oMI/jn/lyVL/gTT/S9aOxJ
YXm06O9Vy6v9o4iii7rtNFzSzK7fNU4wEL4a1jotIh+Ygzc2vLwdpClHJX7kVyUTvi33xPwTH/22
eQinGs4D8WgZhhscGO04Vj+PdRyctclfFdzbvT5I0pSPeKiRG43wNGcIO47jf/KMqcEjZh8Bfq/p
93xxMigjtUmhw3aDenKJPoLF6+Qff/oVQv3qPoRYIz5ZyGkHoRJoo6/Db90FIv0ATsUE/tjq18PY
/6SeQkJrWtLZGMEdq5eDveggmza5x+LWzXQH3napVEz7hFKi0xeDf7xEsG4KCm9bqtdqjESkpjya
zzSN0fJ1Q8WQLWrj/9MTYJReq7FkS+MabR6V22vLWu6RnWia8TL9kl8CjG2zfRI7bCQhQop24BLs
O5URykt7cpAUbpq7ZyPLNb8nyLw0Y5LddaOXFL2mR+vafM00m9MiIRZE6J9xo/y0ClCY8aW1mRyX
NOnGR7+iRQLpH9nXdf/jDdCn/fG9mIujZmFViKiG/THmY05af6Xh4y+zYbTLXJpu+be56pHCX481
el5cdLquQEpsNBN1XX3OeTI1EgBvbkj2xhmH5ok96zp4mj4WA2DwIxappUjN0GNhxc9FFuuxxpOq
6TqY9ZlFx/nuip92U4wMz2EqsVkv8bw3OuVtFYWkslDlHTZYiS7bropGJg6ZIWGd0qIveOKJY5Ts
rUtYJSjZUbpUlN9jE8C2NRy8P61Q528df/AwNK1l3hdnucBR42Wu7w+Ak5uP4VfnPtEmWPqYANpm
gMOVb7J7whd/nAwEOMrd1fumjA5laAVaDjtIXvMhzkjigxuMgp9jh54QuRaCShY/Q98YqpGtwOIs
vzcam8lfPXOHHklj7HwY5diiLjYizOGZoT9Rd00x2zcA8UsnqN4NuDPYoAKmGFojz/X0+yxzJwq+
Vzy61WOsibyqHKyAh5zNJiXV8aiXbTq4EezRXwAQyYv7Ym90zTtTxtpORFYq6GtquK17jtElknTB
/A9qlnBYL9iBD08SoQyIqWsD4KThyoBTU2o9GxArywJ8HrL0KpruquXnVQJxp3oTL3K7UubYN6i5
Y0LoVDCdzgJotIYP6KRdjme2tpVmgddqJ+s5/cYBRTJHFHOCXvuSk5MeFHW0i+GuE7XGufFzklSD
W/xT4a/ICUffxltmyiWowLBF3xwGhOaEUBqoZpm0Bj24yvwMhFMTHV7aI3SDXzfVkDa15omrKWYA
wawZey8TSHt44qeH4jmx/p1JC8la6gNmPJzs9GKb1GPGPXGLxLpjkjMojF7SKefpkFVXtSZQaW5T
fjS1wXVjZVvgLdEuqoc1ppE/niFXwWQJtZ9Z2bDZnqhxglugMcvzm/VOBoDDOaWIcjemnQ3OxsSv
4XPP03K8nTGL6kgP2wslat+pLuLpG3Qc2PkZhWm7nxCmToA1qctCJ5zFk5Vv5Gwvq19ghwYvoH5s
nmFNua0hemf3zVjtOZ524WBDxocfCLeMQ3PiJRkN1NUxPzaQ9Fnf9r7iom+RRSvo2MyeO/WmxKF5
8r0Ahg2f+QLrnQgPnZI0HjtsAygAY4Ecv/Y8M4jc6e0H1EIWQ08iC3iZgDu0YbZoIXYiD5GSYpxi
QKCSVA2Yjc1uHV3ZlbHAGUUyD8xj6FVTU9qC0SiT1kqZeuwkEg3R5cw7YNvTOq9+EApIdpnwEh1K
hJgWijreMA3l9asUB2UbMy8H3HtpBKr2m5AVGrlGkgx7001PqWCP7YAnyt+yGhsPcS7bG2NqInmj
CPTAkLHowswYultOt1CLjSLrN40eS43egPHuSxbwnagjatTQHysZVakr6vRmYXoOCQ5v2ehaL2kP
flRgZOyK7lXSc3JAI2/DQMhy+LXxCQa2Q7jIKq3NqiNl4uwjM9nT+UwiBW2qOZ1bWqq81xIc/T3y
4dVi90ucIFCKjQAXvpZgY1irTmUHMHTls7rwvUDwJzGB7yPLcSUua6p48ezlNrHTS6FS5znuG0Dq
vsvXrKdgp9QVbfnKUbat+KTBuNKUCi83RwU0oZxQcVOlcEAg6h0VnIqSa9j5rAoTFNQk/z4LB/+0
BYLDyey2kFTGNWyurZmLfwb++ZjC74oQoZbXX+eKT5E+RzAaH4bpesmbkNSJz+AWAE7WnCFjzJC8
MYWy0lKfPXnM342YU6u68o4ckNo8d0Tgf1vI3l0BivzeSo5omekqM+rklDGYDFoVBkoWHyAY6nkZ
AtZwHIM/9zoRNODy4EG/pQQ3+DGofrQANSTEAzmjrRnc1N/Xo/4wmBrXu3DgrbFnV4QC4fBVzTzy
5IZScyjTnlfTUdHtN7RxlpF7K038nPRQiyZiAvxTVqESmXmqHtQ4+40YuScPHSLoyScgDFtAuqfI
QCAvKUj64BThJHsnUicg/lvuoMFGSlKyMRppva6Nk6/3DsgwEGiKOJmSoStHk2FhNDj5+loSTwD1
wnUrVa+KGeAHJ3Fmc1up8FkYYHKXMULxAz3YBGaZdt+QKcfmvZASgfjAt3fJJKWPjBfoCy50Ye8d
1AHty8PjskAw9KwhA/SrFt26ew+T6WHghYxE0+qp4rZoVmDbedH5ux82Luf9M6V9N4c/lEn045rv
mjp6q+0SR463fJJcmI25L9Ab9wBjAsRcicK+u1K0M7i+h3Dz0fLnNu8R5q1tfL8P3s9UyCSD/RUD
Y+wIDmELmOQvu76UwXtNXUqhM4QrLVZ9Ni7Wk0cl4WIy62xIkz1DovmTp8IWf7WrWikpN8DJsGZt
q6suojo8Kj6oLHedH4Sr8JU377Ug2I525ETDHKxST82pudXI228YBki2bUvshQom58vtxt8X0uVn
MKBj+FL8z/0phHuLSHb0DQs75sPIpqY5f0ggc+UneFMaHHm8DrGwXGbkqjTg5du8tT9wMIrFs9Yf
duNZElWJZBGBDoHjuN7ZmQc2PbZBEUW9ki3Td2UH446ciQYswXS/vkvLHl4MF9CxgsrBXRL2SaKu
Mz4toBbZ3Doo6+coE2FaObrgEr0DxAxbAoFqtpmzaFbY4xb1gpPxlbviwmZwoANQeP5oMOob7VpX
UDlX4IjgESju7vGSZYwBRIKl/nMPrRxzZhyMDCn30EH+uGhAKnmItEuWJpRZ0MOKGFCGyJJXX0e2
DN/0RSVmICMqiyAFNfOf2lFShpY1GpdjmZj2C4Tn1fDWWO2utj/eUA7eGHKbV8YtbWcu9Fn9eaXh
I6nHYnXTJb5jwNLiJAMjb0i6XC2AreQ7U38vifddsmpqz+mZe+mLPZuf64kt0xsY18gS9gKUAoo3
bTf+AY63gkrXIoTi2CYYMGIHWklCzj8N8o2ES8r2CnXJYaoQzeMbxfZ8/BeNE1osgQhgq020DXf7
l4RRhp4UjUPEwGdlXLfhqFlMfYeoPaC/U5HD4DC6V2mLgCki+4g9E+2DsDnIwAYvmZnahVhI7D65
14524Umfu1kmkaJJTSCIITtJJiKETGoF19ADCNp9/09V25uLy6nVR8udVcNdaVkdz70z6JDV0g8X
s7oiNFR64j61zQ0g9aCEgW8UaXQtphbN2Y1Old7ezrsguzjXOFeLaiNnDEGKZXS3DmY3oL7HnRtD
ebZOcF+LCZiDLpPDgBS2PQOHquL9N4vMUNaDza96QsRmqkKle3vsWI/nuoPhyvYhnnlfIVcERy4L
M9aZTXdLM4ue+dDTeQqJ7VwPYgRrWFQnAD2Nep0/qDPgWoNu4fYqzS4jxY64m8ZDUMwa9AqH93C4
04GuPg9X7qWE8hFt2OAu+quiF/oHfUDAaQZjeS3MjaD9kRNERV4LFeauZjvQ6o6dINHdkoTpsEqj
QoBLfIkxt644E3J1wC+o/46r3b1XtP2fsMiMRKAYXqYzaWutQ43Ap7wbsA4XAzhrKVZc3Rs+tF02
3kb2df8SYRqp+DQgW3xt8g+CAwx8KmJ+NGfeVwOV+MYYKll9N+ahbznAkVuJi7cmDm3WcbXLNsPD
YAmRgVwPRX3NHG5XY14zG3PU+SI3O2C1a8dJTU2CHXDNkzuwvjXBvFOV6XVfWS0JzymtyGkh0T12
OTRiFVdkIPTWMAwojjd3BsWoZkDHx0dbSFKkX/+MgETCJJ17epTrc2Fi2FQhK2MibnECyvMzV+IY
YCUF5xkHUPIHM4h2o/EhOLv/ZhzIPpYu9Ld399+1ZqhN82O2U92sSocmUN4HbWBFzUldj6aacodj
VXUHe/Z/4i7+TLlLGhshxY36UVL4jDQBQMokV8waYU7IgFmzul0g3hk8O9AbaGZbnVDn9UfFWvH4
jhBTPUfL+h+m7GNCtX0bEWM0M76UFQ0dR/ddkNqjNch4Vkqgst+YmtkGLfyhe5nZHl5eJBGV7LvR
m8CR13V/wyv/CA3qToyiPuW0Q1sCs8IVTuW4rA9FiDKHYyMWvTkgNNqry6MUCA9bwjKPfJdzX7+3
wEnfHr/wg7qi0UMsr9Gb74uCQK+RYgVbMOpW5EAqmTMgYMD8qzE3I50O24pNAj5qQNjJPNr1BTER
7YA+5bbsCAqyOE4lsvoHGWaqNc6gFpbyHtx83I3pQ+RtsnAG7P+a+YAErIQYSIQvS26YLjq/hFVD
fPRskjvfIKgPaxJAMtpWqZawxvp7+TW13HHjpfryMsQipswdGJul+sM6IP16VCKWFpL6Kk3N8wum
JRVPMTU3SHeRh23wKG0DHuhJ4BGQbCeXLgXat8J/3aYFc3aHqYCZHSjPTT+f8Q3Qo6GmGaqEtCYh
J38C5XE5uH9XnwZY+Ct7ku2p6Jb/6bQGhnn1Y7YuzXDWcsyMd0B44BoH2Vyelgdu/uXHDSddcb7e
LrsF5P6+KuiRSJlFTfa5b7iabRMEdlR+2nmLUeoTFmAzb1zTUEYsYZKMuzZUMJMQvlAADeBkFxR3
bgqRf8kVDHd8h01BHJ7uQmgvFofKa0/cKBZoC2AoY0FA6a6rdhR06Ss2nDvxOSANytXqaqizagZy
Rxwov5NTi9hzJS8tIVg3DDg3mFqwKEauu9P/NOncpkw6GJAJvt4GATJXlYxR/HzPidIIC6ihLjDf
O8HU50x651ajMUAZdAT8HwxFpF7LhneXKbZfykoM0vR/TCw5TKz3ql42Ccz6gr5UgiidYJhm91UK
dJtiAiG48HMaq9le5IIr6n2FjFnJcDiHCSzvorU2TPiXXfhtAvFlgGBw1NxLC0IsJgKfuHNKmGlT
9h4uWAZUsgWtAe9SplRU+Sj6ugAHHeXzCJPal4qRPTJmhw/5zr6/EqzfpGVBKGymxE5vvA/sKOot
bWcSXy0JR6sMzoc1RhRqzClhd0euP7FwLEYvKRIZ24SBUR6tLdrJ69Ho1Rh/IlLRPpZVfOSI1v/u
Libk7WHmibZv+AVdNWhuYgHrKVWfUbjtG6UZrjhmc68L4fJR6ug3Wv321B/c7ZDAASkJJV3TCX6M
OYSuM4glb6Te1vUlhrwqsQEaNs1BaCDeIs+KzeqnGDyvloqYAqA9ROTuO3x3Bl/CzKFp28V3xcvd
sLE8TvLmBd+eatztyYueuzUFwTooLUqyJ/zZkVcFV6VPgwXaZPZfN2/iHGyLN5QyQyGkvGY9cVyL
ZofNP7caIdLpLZaRp2/KIlUFlN2tlX3GAZrtYNdQrnS/wP/UNT/OR7wTK3KdHTFsRqOi6aPuedsL
/VVTh1XC4Nv7TQQ+QN6JCrRRIFSoaFrMmHlA1Bfx1o4AHu4taca8nV5BODVXx8fC2RKAcJB7bYOG
zUS4OVtADZ49E3xRPAy/IgxTUtc1gE+My3cdFKPybe7jLBnuSmqinPSCYGQ1rQ/tW7gS721X97Ze
NpDxFtRxVoueikt6pJAfscHpoKFH7loPU3oye1BjOyEzluOK7v2ivLoldRgL4zDBWAJyIY9oyZmg
NtGhRsvYQBeZV77ToR0SP3prZIh37mO8FLBlRN1fRiudPbwKv5pzBCROZMYSsTst9Z82vsKHZMP7
TRejElemhtPGexLJ2i898V5Y8CCnvKR3jURpxnLmgZvZk9ei3Wt/WKwoKcmg7poCTNK3hP54fyq2
bLe8YKl4isZOIFL4shfiJvQtT6X+Spu9PV49L0W9mmHlxtDnwj5wldt6WThO16cmIvQrJFyhAftv
Wz0/XqvmUVG1htwdPDVJiVgopcwKcrNO7Je/5PI0+oawe2eRhgE2PWn7t07X5lOaUdoeysl/UfSP
tIqQKCc0HkoBj8DiSUoXV7jF6KSwmVFviau8YUimVY2W9xDf1dHzMDL/D0pUZmHVaeG7Yv1C8AST
u4odhzgHGlPbv0Q2yB1qcE8ltIqpxThmqblp9JAW196tBrZsOama3huwQ+QPfRzrKxyx7OcaaLjA
vczM+OH2pPLsqwAgAW2MU3KSVdhOO/l+wRisHXYxySxJvdvzQiASGaOSfw4MfKKvQslYtG73GaXg
vfl/Ek5sW5p94D2RbkxFbqd6UC9eDw16yStCnyFFNLz1uMKlUJZRo8hVzjj2PlKyjYdr06hFcmlc
63Hd6XLkXn27FdbyMGrSQkCDIVYLVi6ImNvp8SIkbPZUzLjvlYHIkpvBX4yCpPbgkSpofNVAwnf8
iPrlw3OcKbdJozmEH7YWWIz5VgicoHnKjULp256GsFjreaNSO1FxYGuPj1KsJXgC7+UNuc4uoCsc
w9AuD+XcTJpiQa/ZUcRWWT9dLuEcUE9cDj5cGQbpe22Lz2GRAdZqdn3XW0D6Y6JXKcn5GmcFfDQY
8DjbiB0iw6h6/jTrGcG05l2xMwmeFcr+8j0r0MmjTJAn8TnvkzgT3lUbeRBsFJLrW+FsJmjcvWBF
ISIWgpdXQoHwOTCYnckKSQx7HwlCg55qBLZiJ06+KSeUmDXGuwnZf+qtIuDUhVPD7DGiMJyxwkKd
9imrtmsBAxDO2fN0EwX7hnXTtKh65Ow70qLAVRs0+PO4RHqYYK5OG7FQ8wnVIgS2cAcLEL32LxxE
IWETAMqYzdJyQ8PSBHLaPFdafpgyWFkLB4DdX9dT7wTh3XFOfb8acpRYiROdvs+v3czliVpZ6No3
1nBvpRVW/KDF8L/rMPD9RRiJ3V61idavDyMEoGZ4LWqDCyBrJHgXhSQ9IORudlvOiz4qYoqQ71XC
zLkOQEAUmB7kwX/BDhj7R/o5TE4zaobyWZ9/zKjdI2ipLFvMHznkdoZfixi485MpehmiG+p4p7La
BiSenSNIqcFn7WV0YBHNquzX0hE2LpPbbjunXkpF3O28ZGss6Pi6vLDyZIa+xHfnmPwykVD64BaZ
Zs3AwtOxRVvUesfl8Y/TQ6zZp3ShLD1Vs5GGPXefdkJuFFflBI7kbXQ91Q5832PB0WCwI12lLANx
uN/avK6NZj7fORvydzUIla3dHVx2cV6f15/lqsjjx6rHe4zEoDRFmXvMwtuHLdOmbtO7IpfDo6io
iSvmrW7zmxbeN73oBlVmf7X1YmqO5YRCaMhISuhXHjzQ83Ao05Yb3O/O6Qi57OliHCa7n9hmnwih
wYF5yysppwZ2ga5v+dYXz4bdOAjjUU4p02tJRBnV9YYxvND1oTVTEojMACzdA1wW1LTH0EcM+Vpo
ams/xMTfTvOLj0o3hNLqoLbHLS9Ypp8xGAYelyrF8YTiVZ43K/FcB2CIegyaQS0Nr91oZzDZqwDm
PLQFWrBYqr8uXrym4faFbjBkcpVRcuiLwx9fQc9C+EzijoHzQbOA8px1LNZCJSjJIDeqAsGhVj0C
evHlTFR/E4rIUZd1qo7zfw0kdcxJqYmXIQHssc5GwPCd8pyD5V+UWTO1offLX2/D2p5iesVqTND8
NQjmfMiB+E4AMuwHE7+5gSYlTXQF4SXkz71DJsZSRaDcQ8zavtkjTMv8hbzUgfZALJiISwpUmXx4
sRT4prxRCMo6dOebm4LSddNwp0O7LjUtff+20JTj3TBFMYXfoMGMbtoWbvP9ByUSwRcvsG/28ke5
Qk8nTL6pSVIiQgdfUljg6AFhg0kT4XIUXhhXGf2/wWV5In3A17pdALJhcUxEUHnTg8Azsx6wfKVW
6ky9WYDKwI0Q2bsrTypxnoul0or0+eDzIJX3D+c9DZ/5Zt3zWVhI4VyZ+qe1DqJr13mD7ChBgSBx
+4XcOWTWy7SkOujapikCI8q4TjdxK2oscenJTM+ODa4iUdr9hNtj/QvKDTQW/6U6XYNksHm0dFED
AId4BE11kL9ECOYfeLCBTdU49Pi1GYKL+CbLZudY45SVI5LHExnwual3HxqgpWUAxLrD4BOTAlDq
yhrv1Zo1n3+cc0WNtHU+ZpXKKFsC2tEFE2LnR+Gs3xMJOEDfPVnHrpfeNIHyTGAVu+b1ZgXiqA2O
bho3BL9eP5utqh9MXNmCEOP2uhS04iw4JL8zBbPmh7UEDYp+up/8tjSGM5juf3E4ji47tM3ANQK4
aNFI8jhe7GwOHJBC5XtPXkAclIT8midUpJLbgKFxbCj+DJThYvgLr9CzTrz8bnUvny489zXHrE6X
Wz+1zgsszCQzY2iz3czuVzUiYPVqADc8J8qwlM8uPPF+264GD2ffg2ATpRzmmREVkPALkfut7RSW
TMx9LlUMuntx2IHKBS4P6HmHUxNsLj68Xe5PJy1idbmt8JrQcmiLAc+x4wtZtquN1du+mlK6gkzP
vkkrQ6SVjdKVMr3zGQaWjOE1dYP4DazSshudN1mu5mkrAq0GoIUegB+vvi5lLycT9z6DMKeLnlpd
66XJir7aqBpBg36JDHq1D6LcVepb5zHx/puAER2yh+FwunS+/GlzOnBO8Pyi+QZPeCvQ6xzQEDUe
zce/eezUIVoLhiKAUI5iCvbtOTPH2nDXYrurIxyt6Xi+1YqZhiw1S+/Ca7z/OsCA4D1bzbQvKzyj
NwXtffFh0wQnIYe1MPOIT2mmPz55JMN9SnWQeM7eL9+13dW2cPdNcoe8+G7y6TOEfF7cZH+f9Oyv
RaqW4BcB47uL3fZD2vz/ErOS7cIKcyA5dsIq/rUTx9WKgPg/9UXJ3XYlnAPtSmj56VTshm83l4aA
NokPdKkfahzvegC+Ci1JfR526U048CJPT4UOgmlypbCJA2d93qd8qgbFG1J3Vg/qIDGdKyE5c02g
XcCCg4T8vGqQqXwTFH4LLxnMATjqu7J/4hqNWcmUsB4fLfUCy7GwrJMMDB6GvjqFOlwwll6xgtTl
HeME8LsDs4Z2BkhbMbqk2K6D5O5nORk12WMzImz4wo03Nba1NQ1WIZGBTU7RcdZmxMmYZZ3S8VOw
slxELqYNfMODGHN3Jqmz4PgJsssYGECWZ/ZtkWFyg0oD0Mk/ThKygYARJFeXa8NWbTO4NFKe/gB+
PD4iU+SaMVPlHppkCliuUP8tZEr3Jq0R+IXifeQlH0wkwo8Q9/P7T+Ycv8dF6c3Qszz2VYExshZ/
lBx56pZGCPmuI1h4lQxA2QPIwLuXLhpE5OVHk8lRfj/H3Yadyhtzfq2FHPnyKDw90u6Su+BQplfK
nDacxtk5txlk2O/WlIaZBSms3EEYscwsQdWsNusbWZqSGI5p/mEn/QpBop2copWd/lB4HZz7EYrL
or5hqQ0O3xvMwtxzsmV3y0P052JgNL4g1VFc8/Hxh7nxXl5r7ch7ikoqy4rfiO+JkfoIzQIAXYQw
0i3notDtCHWVv2IMnNG6A01AUf72C5P3UGT6seVodxu/878kD6CaBfArzQhSEG75CZpJl2ClCepc
lOy6EwusGScL0uZ5zLE6b0Z/+Dk9PMVGKmOPksmuA0MV18akHZ0yaEcKiVlP69KCmo3Uu9ypw2+R
gyj5KlUdxvF8k8+vJEszq0+zaYiJ+9Q+n6bA5vNmsp9MPOWKW/SLwYqczEqG+39oT/BID/8vL6km
5XMUcpZqSVXAnYBTwM38Ef1G2ZVaB/umqOPHQH8gnrZoFPB9F9cYLHY4pO4NSs2orOcghsWHf5jZ
r7o5ThLLDWldahIsj2RfTOuPcDE5C5ycOAzZB/NM2TrnDcTsMBgqOqBTSfn4O+6XLZsQzGz81kNq
EuS+6g5niJpoeU2DLWa/Vlle51G9blzCsSyKOZ4Y7S9NMnedfOcFVeEYmalNmguj10XP00Egy+rq
a2x9taT7DFQWjx8b8A3UVNM+iSK1DrK7LgBeW1dFiw477xybVXSuQRDmxZcggOjpxHwHXYKaeBmN
9XDNSAxZO1XiPyEAGtxjZx7H1/AOpAs+wxq8YDpuUP6mu7cZjrybZD1TPOSR8g+lgzgYj8+avRgC
bGcCOGW2V6XXLh9lMb09M4Z+xAuEVtIZQr1bsfMWklP2tppYbjU8C2ooQx3VQdVTs36ptIcfKI3+
VsnZ3tzyDn9Fb991HjzsfDDKNC5cyM1Rulfqyiap/SL5Rse1U5IqlKsVCobogxBVQG3FIg+BA/0+
sd429RNz8JXh9b0RhhTcyEaoYGECIwD71JHIiRxjxNr81IdQfp31NPHsbMm6EyHoYQc7orDcnSni
PT0JcicTprdqWVUzoJJk3Ys5Hdob5Rui42Y03UDEy91Pa9IO9SEnU0ctBOC9GxeJfSCwP9y41egx
AvX4HkIxjL1Y2wb9M1BIL8g5y9xLy4fotr+1d4Dm3pmU8JhOeBpY3ZkNZ0a8TMlI+wIAj5pTT98w
2S7z1yWOCrBHUzbFZ7qmfUoblej/Co4bdQkAhMvLqkq8B16cGKDTcPp39iSyk+/4pua4KaczGUOB
YjrATsEERkAkWO9J/TA2rXw02b7RzKDNQwkX2j2IwXzkmMJoWfxxrApNL4SJwHpASNA1B3qoyO7j
6SzD+8QDm9VUp+HNEDxCkgqo5ypQ0ZbrnavvWA0+CrtugflUN3uCJUvPk59prv7EYf5Nk5Rvfo0S
KQb8JzSOhX3581Svw8UfczsAwBXo2sNlrblCLbgVxjIhR0fn4IX3DxxZaJWMy7wCgOa83WGnonh8
5orzAubd3n4wz8DVoEklldFxljePt34YFiHnmsTaQ+3znbbYCp791M+HfiVaNB2c+hD/Bz3oyna6
v4cly2f2Tjz5kF8na3PQMJjK00eupF29Fh8C98eeM5np6snjJuKTFFOb9K3i/L85ogKD32+u9Uib
kMayEqE7PKnkUI/VKZ9fmpyFX0KGf3FGR/+eYNN5JIM/TdNF4fM1KwV4xKAGkHhFypTOh65tfZUl
cQ7WK9DJw+IqWvGOWtYNGS07/u9i9DmOIDYjkfDTMLIiIrHthRnw9cgwBwXPPGLOSV+UG+eZpWG5
ZO1W/yKvcjkNgLxNxL1UPd4vAkrHdPhz9HxlVxA8x8bE+4MaTfYpO4I+Fl29ZVCYSGm/wGloCYZb
vie97Yn23A/UlgnS8U0FQNsALLhCkH+L6AvE5DIWK+DsgdhYyG5tQb4MjDP330d2x4tASO96KpZ1
g4NW2SSF14341j+YPgwPF2qNE275cYbO48OqjOT1WPE23ZuDF2VBo4w0yLxYeUSKBWM/Lc+q9qZZ
wBiWKoyjmTcU/2qZbddZ7rJMU/ycdIAI0crOdh9RgQl2B12qg8tJJv+yCFhhGGKVUNgxcvE3jIzs
3Waeqn62yFTw/yCXyxBoLMlurzlFfiiTf/ehIQMEXZ7F/buo1Ng5yiLLR61ik++ncDQQf1UQeZLc
O3QwBWd4NufslScKhbIcOL3VkXKU5yho8FwDLAQD9v707Wil1yEAldqhTQCPoSqwg3DfKRzbjtKq
uu7cTOBUP6mrN2NILtZTyC+dAtCL9u+mECKXVAEz6uBseyaRXpuN5s7msRCJSgn2NedsrCjzx59r
zGQ0ur4eBkD1FNhL/TkJV7e3zCsuY+rtmyz0ycvaiMxF1zd2o+OKZ8GQo74tV9tVR8VyLYgNfPLM
q9+TBQCrI81qLwbYR3UwbO9B/yE7sMtSdejRtJUIXQhNhk+gvqG0cqvzym1+BlDKneh2Bsv7cqV2
yFnelJbhWN10h8J49RjC73gOUbnAw3dfGZDp2n032bbUIh5mzpn2h1UIFrIYtUGNRQjwyNypSyRa
mFos3Z6EaRoCmxpuqefsbMZZw62n8dQkfcHoQatJbvJGY4QixS+bGziKqPjmG6ZLmSrOnmhRwAuq
U33WbaYzcPTT1Grp8OQ0KweqDDGmPSCNTLeswQiOv7F1qqrHwLKSpBbSyk9dnKNCjLsWiqXtJUqK
EEtlhrHZi9CGgsDqINsjbggdPZQpzJPUyQhl3RyGj7Dog0WtVXw2FRVe4v9nm8JqyVdpA03evQIw
9Qtf5BPxX7yxH+COmfY7AYPAJ/R8XT+qFpHL1jzY2k08
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
