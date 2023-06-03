`timescale 1ns / 1ps

module fir_dsp
#(parameter INPUT_DELAY = 1)
(
    // System clock
    input                clk,

    input  signed [16:0] a,

    input  signed [15:0] b,
    input  signed [35:0] c,
    // DSP block output
    output signed [16:0] a_out,
    output signed [35:0] p
);

// necessary buffers within block
reg signed [16:0] a_inbuff [INPUT_DELAY:0];
reg signed [15:0] b_inbuff; 
reg signed [30:0] mul;
reg signed [35:0] p_outbuff;

// input buffers
always@(posedge clk)
begin
    a_inbuff[0] <= a;
    if(INPUT_DELAY == 1)
        a_inbuff[1] <= a_inbuff[0];
    b_inbuff <= b;
end

// muliplier
always@(posedge clk)
    mul <= a_inbuff[INPUT_DELAY] * b_inbuff;

// adder
always@(posedge clk)
    p_outbuff <= mul + c;
    
// setting output
assign a_out = a_inbuff[INPUT_DELAY];
assign p = p_outbuff;
    
endmodule



module Systolic_FIR(
    input clk,
    input rst,
    input in_valid,
    
    input [7:0] pixel,
    
    input signed [15:0] coeff0, coeff1, coeff2, coeff3, coeff4,
    
    output signed [35:0] out_pixel,
    output out_valid
    );

// intrenal wiring
wire signed [16:0] pixel_extended;
wire signed [16:0] a_cascade [3:0];
wire signed [35:0] p_cascade [4:0];

assign pixel_extended = {1'b0, pixel, 8'h00};
    
// dsp blocks cascaded into the systolic FIR line
fir_dsp #(.INPUT_DELAY(0)) fir0 
(
    .clk(clk),
    .a(pixel_extended),
    .b(coeff0),
    .c(0),
    .a_out(a_cascade[0]),
    .p(p_cascade[0])
);

fir_dsp #(.INPUT_DELAY(1)) fir1
(
    .clk(clk),
    .a(a_cascade[0]),
    .b(coeff1),
    .c(p_cascade[0]),
    .a_out(a_cascade[1]),
    .p(p_cascade[1])
);

fir_dsp #(.INPUT_DELAY(1)) fir2
(
    .clk(clk),
    .a(a_cascade[1]),
    .b(coeff2),
    .c(p_cascade[1]),
    .a_out(a_cascade[2]),
    .p(p_cascade[2])
);

fir_dsp #(.INPUT_DELAY(1)) fir3
(
    .clk(clk),
    .a(a_cascade[2]),
    .b(coeff3),
    .c(p_cascade[2]),
    .a_out(a_cascade[3]),
    .p(p_cascade[3])
);

fir_dsp #(.INPUT_DELAY(1)) fir4
(
    .clk(clk),
    .a(a_cascade[3]),
    .b(coeff4),
    .c(p_cascade[3]),
    .a_out(),
    .p(p_cascade[4])
);

reg [10:0] counter = 0;

// handling validity
always@(posedge clk)
if(rst)
    counter <= 0;
else
    counter <= {counter[9:0], in_valid};
    
// handling output
assign out_valid = counter[10];
assign out_pixel = p_cascade[4];
   
endmodule



module cascade_systolic_fir
(
    input clk,
    input rst,
    input in_valid,
    
    input dv_i, hs_i, vs_i,

    input [7:0] pixel0, pixel1, pixel2, pixel3, pixel4,
    
    input signed [15:0] coeff00, coeff01, coeff02, coeff03, coeff04,
    input signed [15:0] coeff10, coeff11, coeff12, coeff13, coeff14,
    input signed [15:0] coeff20, coeff21, coeff22, coeff23, coeff24,
    input signed [15:0] coeff30, coeff31, coeff32, coeff33, coeff34,
    input signed [15:0] coeff40, coeff41, coeff42, coeff43, coeff44,

    output [7:0] out_pixel,
    output dv_o, hs_o, vs_o,
    output out_valid
);

reg [2:0] sync_dly[10:0];
integer cntr;
// Assign controls 
always @ (posedge clk)
for (cntr=0; cntr<11; cntr=cntr+1)
    sync_dly[cntr] <= (cntr==0) ? {dv_i, hs_i, vs_i} : sync_dly[cntr-1];
    
assign dv_o = sync_dly[10][2];
assign hs_o = sync_dly[10][1];
assign vs_o = sync_dly[10][0];
    
// packing into array for systolic filter generation
wire [15:0] coeff [24:0];

assign coeff[0] = coeff00;
assign coeff[1] = coeff01;
assign coeff[2] = coeff02;
assign coeff[3] = coeff03;
assign coeff[4] = coeff04;
assign coeff[5] = coeff10;
assign coeff[6] = coeff11;
assign coeff[7] = coeff12;
assign coeff[8] = coeff13;
assign coeff[9] = coeff14;
assign coeff[10] = coeff20;
assign coeff[11] = coeff21;
assign coeff[12] = coeff22;
assign coeff[13] = coeff23;
assign coeff[14] = coeff24;
assign coeff[15] = coeff30;
assign coeff[16] = coeff31;
assign coeff[17] = coeff32;
assign coeff[18] = coeff33;
assign coeff[19] = coeff34;
assign coeff[20] = coeff40;
assign coeff[21] = coeff41;
assign coeff[22] = coeff42;
assign coeff[23] = coeff43;
assign coeff[24] = coeff44;

// packing into array for systolic filter generation
wire [7:0] pixels [4:0];
assign pixels[0] = pixel0;
assign pixels[1] = pixel1;
assign pixels[2] = pixel2;
assign pixels[3] = pixel3;
assign pixels[4] = pixel4;

wire [4:0] out_valids;

wire signed [35:0] sub_res [4:0];

genvar i;

// Systolic filter array
generate
    for(i = 0; i < 5; i = i + 1)
    begin
        Systolic_FIR filter
        (
            .clk(clk),
            .rst(rst),
            .in_valid(in_valid),
            .pixel(pixels[i]),
            .coeff0(coeff[i*5 + 0]),
            .coeff1(coeff[i*5 + 1]),
            .coeff2(coeff[i*5 + 2]),
            .coeff3(coeff[i*5 + 3]),
            .coeff4(coeff[i*5 + 4]),
            .out_pixel(sub_res[i]),
            .out_valid(out_valids[i])
        );
    end
endgenerate

reg signed [35:0] sum;

// summing systolic lines 
always@(posedge clk)
    sum <= sub_res[0] + sub_res[1] + sub_res[2] + sub_res[3] + sub_res[4];
    
reg temp_out_valid = 0;

// outvalid moved into a temporary buffer to be able to reset
always@(posedge clk)
if(rst)
    temp_out_valid <= 0;
else
    temp_out_valid <= out_valids[0];
    
// setting outputs
assign out_valid = temp_out_valid;
assign out_pixel = sum[35] == 1 ? 8'h00 : (sum > 39'h0000FF0000 ? 8'hFF : sum[24:16]);



endmodule
