`timescale 1ns / 1ps

module true_dp_bram
#(
    parameter DEPTH = 2000,
    parameter WIDTH = 8
)(
    input clk_a, we_a, re_b,
    input [10:0] addr_a, addr_b,
    input clk_b,
    input [WIDTH-1:0] din_a, 
    output [WIDTH-1:0] dout_b
);
    
reg [WIDTH-1:0] memory[DEPTH-1:0];
reg [WIDTH-1:0] dout_reg_b;

integer i;
initial begin
  for (i=0;i<DEPTH;i=i+1)
    memory[i] = 0;
end

// Read first 
always @ (posedge clk_a)
begin
    if (we_a)
        memory[addr_a] <= din_a;
end
        
        
always @ (posedge clk_b)
begin
    if (re_b)
        dout_reg_b <= memory[addr_b];
end
    
assign dout_b = dout_reg_b;

endmodule
