`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.05.2023 18:12:20
// Design Name: 
// Module Name: fir_tb
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


module fir_tb;

reg clk;
reg rst;

reg [7:0] y_i;
reg dv_i, hs_i, vs_i;
wire [7:0] y_o;
wire dv_o, hs_o, vs_o;

wire [10:0] x_index;
wire [9:0] y_index;

wire hs_i_edge;

wire [7:0] pixel_00, pixel_01, pixel_02, pixel_03, pixel_04;
wire [7:0] pixel_10, pixel_11, pixel_12, pixel_13, pixel_14;
wire [7:0] pixel_20, pixel_21, pixel_22, pixel_23, pixel_24;
wire [7:0] pixel_30, pixel_31, pixel_32, pixel_33, pixel_34;
wire [7:0] pixel_40, pixel_41, pixel_42, pixel_43, pixel_44;

fir_filter uut(
    .clk(clk),
    .rst(rst),
    .y_i(y_i),
    .dv_i(dv_i),
    .hs_i(hs_i),
    .vs_i(vs_i),
    
    .r_o(y_o),
    .hs_i_edge(hs_i_edge),
    
    .dv_o(dv_o),
    .hs_o(hs_o),
    .vs_o(vs_o),
    
    .y_index(y_index),
    .x_index(x_index),
    .pixel_00(pixel_00), .pixel_01(pixel_01), .pixel_02(pixel_02), .pixel_03(pixel_03), .pixel_04(pixel_04),
    .pixel_10(pixel_10), .pixel_11(pixel_11), .pixel_12(pixel_12), .pixel_13(pixel_13), .pixel_14(pixel_14),
    .pixel_20(pixel_20), .pixel_21(pixel_21), .pixel_22(pixel_22), .pixel_23(pixel_23), .pixel_24(pixel_24),
    .pixel_30(pixel_30), .pixel_31(pixel_31), .pixel_32(pixel_32), .pixel_33(pixel_33), .pixel_34(pixel_34),
    .pixel_40(pixel_40), .pixel_41(pixel_41), .pixel_42(pixel_42), .pixel_43(pixel_43), .pixel_44(pixel_44)
    );


always 
begin
    clk = 1'b1;
    #5; 
    clk = 1'b0; 
    #5; // 10ns period
end
    
integer i, b;
initial 
begin
    rst <= 1;
    hs_i <= 0;
    vs_i <= 0;
    dv_i <= 0;
    
    #20
    rst <= 0;
    
    for(b = 0; b < 5; b = b + 1)
    begin
        for(i = 0; i < 5; i = i + 1)
        begin
            #40
            dv_i <= 1;
            y_i <= 10;
            
            #10
            y_i <= 11;
            
            #10
            y_i <= 12;
            
            #10
            y_i <= 13;
            
            #10
            y_i <= 14;
            
            #10
            dv_i <= 0;
            
            #10
            hs_i <= 1;
            
            #10
            hs_i <= 0;
        end
    vs_i <= 1;
    # 10
    vs_i <= 0; 
    end
end

endmodule
