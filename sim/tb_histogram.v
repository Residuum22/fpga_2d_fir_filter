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
    reg valid;
    reg end_sig;
    
    wire [15:0] out_data;
    wire out_valid;
    
histogram_calculator hc(
    .clk(clk),
    .rst(rst),
    .in_pixel(px),
    .in_valid(valid),
    .base_address(0),
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
    valid = 1;
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
    valid = 0;
    end_sig=1;
    #10
    end_sig=0;
    
    
    
end
    
    
    
    
    
    
endmodule
