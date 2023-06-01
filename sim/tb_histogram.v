`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/25/2023 05:11:26 PM
// Design Name: 
// Module Name: tb_histogram
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


module tb_histogram(

    );
    
    reg clk = 0;
    reg rst;
    reg [7:0] px;
    reg calc_flag = 0;
    reg start_of_frame = 0;
    reg end_sig = 0;
    
    wire [15:0] out_data;
    wire out_valid;
    
histogram_calculator hc(
    .clk(clk),
    .rst(rst),
    .in_pixel(px),
    .calc_flag(calc_flag),
    .in_valid(start_of_frame),
    .end_of_frame(end_sig),
    .external_addr_rd(0),

    .external_data_rd(out_data),
    .out_valid(out_valid)
    );    
    
always #5
    clk = ~clk;  

initial
begin
    #50
    calc_flag = 1;
    #10
    
    start_of_frame = 1;
    #20
    start_of_frame = 0;
    #20
    end_sig=1;
    #10
    end_sig=0;
    #50
    start_of_frame = 1;
    px = 0;
    #10
    px = 1;
    #10
    calc_flag = 0;
    px = 2;
    #10
    px = 255;
    #10
    px = 3;
    #10
    px = 4;
    #10
    px = 1;
    #10
    px = 5;
    start_of_frame = 0;
    end_sig=1;
    #10
    end_sig=0;
    
    /*#150
    calc_flag = 1;
    #10
    calc_flag = 0;
    start_of_frame = 1;
    px = 0;
    #10
    px = 1;
    #10
    px = 2;
    #10
    px = 1;
    #10
    px = 3;
    #10
    px = 4;
    #10
    px = 1;
    #10
    px = 5;
    start_of_frame = 0;
    end_sig=1;
    #10
    end_sig=0;*/
    
    
    
end
    
    
    
    
    
    
endmodule
