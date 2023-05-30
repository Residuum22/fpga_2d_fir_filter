`timescale 1ns / 1ps

module histogram_calculator(
    input       clk,
    input       microblaze_clk,
    input       rst,
    input [7:0] in_pixel,
    input       in_valid,
    input       base_address,
    input       end_of_frame,
    input [7:0] external_addr_rd,

    output [15:0] external_data_rd,
    output        out_valid
    );
    
    wire [15:0] internal_data_rd;
    wire [15:0] internal_data_wr;
    
    reg  [10:0] internal_addr_rd = 0;
    reg  [10:0] internal_addr_wr = 0;
    
    reg  [2:0]  internal_ena_wr = 0;
    
    dp_bram 
    #(
        .DEPTH(256),
        .WIDTH(16)
    ) internal_ram
    (
        .clk(clk),
    
        .we_a(internal_ena_wr[1] | internal_ena_wr[2]),
    
        .addr_a(internal_addr_wr),
        .addr_b(internal_addr_rd),
        
        .din_a(internal_data_wr),
        .dout_b(internal_data_rd)
    );
    
    reg [15:0]  external_addr_wr = 0;
    reg [1:0]   external_ena_wr = 0;
    
    true_dp_bram 
    #(
        .DEPTH(256),
        .WIDTH(16)
    ) external_ram
    (
        .clk_a(clk),
        .clk_b(microblaze_clk),
    
        .we_a(external_ena_wr[1]),
    
        .addr_a(external_addr_wr),
        .addr_b(external_addr_rd),
        
        .din_a(internal_data_rd),
        .dout_b(external_data_rd)
    );
       
    reg [7:0] counter = 0;
    reg       frame_reset = 0;

assign internal_data_wr =  frame_reset == 0 ? internal_data_rd + 1 : 0;

// histogram counter
always@(posedge clk)
if(frame_reset == 0)
begin
    internal_addr_rd <= {3'b0, in_pixel};
    internal_addr_wr <= internal_addr_rd;
    internal_ena_wr  <= {internal_ena_wr[1:0], in_valid};
end
   
    
reg [3:0] pre_counter = 0;
reg [2:0] post_counter = 0;

reg       frame_copy = 0;
reg       post_count = 0;
    
// counter used for addressing the external ram
always@(posedge clk)
if(end_of_frame == 1 | pre_counter != 0)
begin
    pre_counter <= pre_counter + 1; 
end   
    
// reset flag set if frame ended
always@(posedge clk)
if(pre_counter == 2)
begin
    frame_reset <= 1;
    frame_copy <= 1;
end

// counter used for addressing the external ram
always@(posedge clk)
if(frame_copy == 1)
begin
    counter <= counter + 1;
    pre_counter <= 0;
end
    
// set reset flag to 0 after a full cycle
always@(posedge clk)
if(counter == 255)
begin
    counter <= 0;
    frame_copy <= 0;
    post_count <= 1;
    internal_ena_wr <= 1'b0;
end

// moving data to output ram
always@(posedge clk)
if(frame_copy == 1)
begin
    internal_addr_rd <= {3'b0, counter};
    internal_addr_wr <= internal_addr_rd;
    external_ena_wr <= {external_ena_wr[0], 1'b1};
    internal_ena_wr <= {internal_ena_wr[1:0], 1'b1};
end
else 
    external_ena_wr <= {external_ena_wr[0], 1'b0};

// setting output address
always@(posedge clk)
    external_addr_wr <= internal_addr_rd; 
    
// 2 cycles needed to finish writing and reseting
always@(posedge clk)
if(post_count == 1)
begin
    post_counter <= post_counter + 1;
    internal_ena_wr <= {internal_ena_wr[1:0], 1'b0};
    internal_addr_wr <= internal_addr_rd;
end
    
// Clear and out writing finished
always@(posedge clk)
if(post_counter == 2)
begin
    post_counter <= 0;
    post_count   <= 0;
    frame_reset  <= 0;
end
    
assign out_valid = post_counter == 2;
    
    
    
    
    
endmodule
