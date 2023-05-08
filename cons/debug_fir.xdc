



create_debug_core u_ila_0 ila
set_property ALL_PROBE_SAME_MU true [get_debug_cores u_ila_0]
set_property ALL_PROBE_SAME_MU_CNT 2 [get_debug_cores u_ila_0]
set_property C_ADV_TRIGGER false [get_debug_cores u_ila_0]
set_property C_DATA_DEPTH 131072 [get_debug_cores u_ila_0]
set_property C_EN_STRG_QUAL true [get_debug_cores u_ila_0]
set_property C_INPUT_PIPE_STAGES 0 [get_debug_cores u_ila_0]
set_property C_TRIGIN_EN false [get_debug_cores u_ila_0]
set_property C_TRIGOUT_EN false [get_debug_cores u_ila_0]
set_property port_width 1 [get_debug_ports u_ila_0/clk]
connect_debug_port u_ila_0/clk [get_nets [list hdmi_rx_0/rx_clk]]
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe0]
set_property port_width 8 [get_debug_ports u_ila_0/probe0]
connect_debug_port u_ila_0/probe0 [get_nets [list {fir_filter_0/bram_data_rd[3][0]} {fir_filter_0/bram_data_rd[3][1]} {fir_filter_0/bram_data_rd[3][2]} {fir_filter_0/bram_data_rd[3][3]} {fir_filter_0/bram_data_rd[3][4]} {fir_filter_0/bram_data_rd[3][5]} {fir_filter_0/bram_data_rd[3][6]} {fir_filter_0/bram_data_rd[3][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe1]
set_property port_width 8 [get_debug_ports u_ila_0/probe1]
connect_debug_port u_ila_0/probe1 [get_nets [list {fir_filter_0/bram_data_rd[2][0]} {fir_filter_0/bram_data_rd[2][1]} {fir_filter_0/bram_data_rd[2][2]} {fir_filter_0/bram_data_rd[2][3]} {fir_filter_0/bram_data_rd[2][4]} {fir_filter_0/bram_data_rd[2][5]} {fir_filter_0/bram_data_rd[2][6]} {fir_filter_0/bram_data_rd[2][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe2]
set_property port_width 15 [get_debug_ports u_ila_0/probe2]
connect_debug_port u_ila_0/probe2 [get_nets [list {fir_filter_0/bram_addr_wr[0]} {fir_filter_0/bram_addr_wr[1]} {fir_filter_0/bram_addr_wr[2]} {fir_filter_0/bram_addr_wr[3]} {fir_filter_0/bram_addr_wr[4]} {fir_filter_0/bram_addr_wr[5]} {fir_filter_0/bram_addr_wr[6]} {fir_filter_0/bram_addr_wr[7]} {fir_filter_0/bram_addr_wr[8]} {fir_filter_0/bram_addr_wr[9]} {fir_filter_0/bram_addr_wr[10]} {fir_filter_0/bram_addr_wr[11]} {fir_filter_0/bram_addr_wr[12]} {fir_filter_0/bram_addr_wr[13]} {fir_filter_0/bram_addr_wr[14]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe3]
set_property port_width 8 [get_debug_ports u_ila_0/probe3]
connect_debug_port u_ila_0/probe3 [get_nets [list {fir_filter_0/r_o[0]} {fir_filter_0/r_o[1]} {fir_filter_0/r_o[2]} {fir_filter_0/r_o[3]} {fir_filter_0/r_o[4]} {fir_filter_0/r_o[5]} {fir_filter_0/r_o[6]} {fir_filter_0/r_o[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe4]
set_property port_width 8 [get_debug_ports u_ila_0/probe4]
connect_debug_port u_ila_0/probe4 [get_nets [list {fir_filter_0/bram_data_wr[0]} {fir_filter_0/bram_data_wr[1]} {fir_filter_0/bram_data_wr[2]} {fir_filter_0/bram_data_wr[3]} {fir_filter_0/bram_data_wr[4]} {fir_filter_0/bram_data_wr[5]} {fir_filter_0/bram_data_wr[6]} {fir_filter_0/bram_data_wr[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe5]
set_property port_width 8 [get_debug_ports u_ila_0/probe5]
connect_debug_port u_ila_0/probe5 [get_nets [list {fir_filter_0/bram_data_rd[0][0]} {fir_filter_0/bram_data_rd[0][1]} {fir_filter_0/bram_data_rd[0][2]} {fir_filter_0/bram_data_rd[0][3]} {fir_filter_0/bram_data_rd[0][4]} {fir_filter_0/bram_data_rd[0][5]} {fir_filter_0/bram_data_rd[0][6]} {fir_filter_0/bram_data_rd[0][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe6]
set_property port_width 8 [get_debug_ports u_ila_0/probe6]
connect_debug_port u_ila_0/probe6 [get_nets [list {fir_filter_0/bram_data_rd[1][0]} {fir_filter_0/bram_data_rd[1][1]} {fir_filter_0/bram_data_rd[1][2]} {fir_filter_0/bram_data_rd[1][3]} {fir_filter_0/bram_data_rd[1][4]} {fir_filter_0/bram_data_rd[1][5]} {fir_filter_0/bram_data_rd[1][6]} {fir_filter_0/bram_data_rd[1][7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe7]
set_property port_width 11 [get_debug_ports u_ila_0/probe7]
connect_debug_port u_ila_0/probe7 [get_nets [list {fir_filter_0/bram_addr_rd[3][0]} {fir_filter_0/bram_addr_rd[3][1]} {fir_filter_0/bram_addr_rd[3][2]} {fir_filter_0/bram_addr_rd[3][3]} {fir_filter_0/bram_addr_rd[3][4]} {fir_filter_0/bram_addr_rd[3][5]} {fir_filter_0/bram_addr_rd[3][6]} {fir_filter_0/bram_addr_rd[3][7]} {fir_filter_0/bram_addr_rd[3][8]} {fir_filter_0/bram_addr_rd[3][9]} {fir_filter_0/bram_addr_rd[3][10]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe8]
set_property port_width 8 [get_debug_ports u_ila_0/probe8]
connect_debug_port u_ila_0/probe8 [get_nets [list {fir_filter_0/y_i[0]} {fir_filter_0/y_i[1]} {fir_filter_0/y_i[2]} {fir_filter_0/y_i[3]} {fir_filter_0/y_i[4]} {fir_filter_0/y_i[5]} {fir_filter_0/y_i[6]} {fir_filter_0/y_i[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe9]
set_property port_width 8 [get_debug_ports u_ila_0/probe9]
connect_debug_port u_ila_0/probe9 [get_nets [list {fir_filter_0/y_o_reg[0]} {fir_filter_0/y_o_reg[1]} {fir_filter_0/y_o_reg[2]} {fir_filter_0/y_o_reg[3]} {fir_filter_0/y_o_reg[4]} {fir_filter_0/y_o_reg[5]} {fir_filter_0/y_o_reg[6]} {fir_filter_0/y_o_reg[7]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe10]
set_property port_width 32 [get_debug_ports u_ila_0/probe10]
connect_debug_port u_ila_0/probe10 [get_nets [list {fir_filter_0/sum_y[0]} {fir_filter_0/sum_y[1]} {fir_filter_0/sum_y[2]} {fir_filter_0/sum_y[3]} {fir_filter_0/sum_y[4]} {fir_filter_0/sum_y[5]} {fir_filter_0/sum_y[6]} {fir_filter_0/sum_y[7]} {fir_filter_0/sum_y[8]} {fir_filter_0/sum_y[9]} {fir_filter_0/sum_y[10]} {fir_filter_0/sum_y[11]} {fir_filter_0/sum_y[12]} {fir_filter_0/sum_y[13]} {fir_filter_0/sum_y[14]} {fir_filter_0/sum_y[15]} {fir_filter_0/sum_y[16]} {fir_filter_0/sum_y[17]} {fir_filter_0/sum_y[18]} {fir_filter_0/sum_y[19]} {fir_filter_0/sum_y[20]} {fir_filter_0/sum_y[21]} {fir_filter_0/sum_y[22]} {fir_filter_0/sum_y[23]} {fir_filter_0/sum_y[24]} {fir_filter_0/sum_y[25]} {fir_filter_0/sum_y[26]} {fir_filter_0/sum_y[27]} {fir_filter_0/sum_y[28]} {fir_filter_0/sum_y[29]} {fir_filter_0/sum_y[30]} {fir_filter_0/sum_y[31]}]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe11]
set_property port_width 1 [get_debug_ports u_ila_0/probe11]
connect_debug_port u_ila_0/probe11 [get_nets [list fir_filter_0/dv_o]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe12]
set_property port_width 1 [get_debug_ports u_ila_0/probe12]
connect_debug_port u_ila_0/probe12 [get_nets [list fir_filter_0/hs_o]]
create_debug_port u_ila_0 probe
set_property PROBE_TYPE DATA_AND_TRIGGER [get_debug_ports u_ila_0/probe13]
set_property port_width 1 [get_debug_ports u_ila_0/probe13]
connect_debug_port u_ila_0/probe13 [get_nets [list fir_filter_0/vs_o]]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets rx_clk]
