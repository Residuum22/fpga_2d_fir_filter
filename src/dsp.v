// DSP48E1 DSP code
module dsp
#(
    parameter            USE_PCI = 1
)(
    // System clock
    input                clk,
    
    // Pre-adder inputs (which is substraction in our case)
    input          [7:0] a,
    input          [7:0] d,
    
    // Kr or Kb number for Y calculation
    input  signed [17:0] b,
    
    // G component input
    input  signed [31:0] c,
    
    // Another dsp block output as input
    // p: dsp output, c: input, i=input
    input  signed [31:0] pci,
    
    // DSP block output
    output signed [31:0] p
);

// 18 bit b dsp input 2 FF level
reg signed [17:0] b_reg[1:0];
always @(posedge clk)
begin
    // Shifting from FF to another
    b_reg[0] <= b;
    b_reg[1] <= b_reg[0];
end 

// Pre adder definition
// a and b input is always an unsigned number
// with width of 8 bit. this will be the
// R, B, G number. This can be negative so need one
// more bit for the sign bit. 
reg signed [8:0] a_reg, d_reg;
reg signed [9:0] pre_add;
always @(posedge clk)
begin
    // Sign bit is always 0 because the number can not be
    // negative.
    a_reg <= {1'b0, a};
    d_reg <= {1'b0, d};
    
    // R-B in first dsp block and
    // B-G in the second dsp block.
    pre_add <= a_reg - d_reg;
end

reg signed [27:0] m_reg;
always @ (posedge clk)
    // Multiplication with the b register second stage
    // and the pre_add value which is the substracted value
    m_reg <= b_reg[1] * pre_add;

reg signed [31:0] c_reg;
always @(posedge clk)
    // 
    c_reg <= c;
    
// Output register for storing information
// in the always block.
reg signed [31:0] p_reg;
always @ (posedge clk)
if (USE_PCI==1)
    // Use another dsp block output for adder
    p_reg <= m_reg + pci;
else
    // Use current dsp mul out as adder input
    p_reg <= m_reg + c_reg;

// Assign output wire with the output register
assign p = p_reg;

endmodule
