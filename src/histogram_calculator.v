`timescale 1ns / 1ps
module histogram_calculator(
    input       clk,
    input       microblaze_clk,
    input       rst,
    input [7:0] in_pixel,
    input       calc_flag,
    input       in_valid,
    input       end_of_frame,
    input [7:0] external_addr_rd,

    output [15:0] external_data_rd,
    output        out_valid
    );
    
reg valid_frame = 0;
reg next_frame_valid = 0;
wire valid;

reg calc_flag_dly = 0;
wire calc_flag_edge;

// generating edge detection for trigger
always @(posedge microblaze_clk)
begin
    calc_flag_dly <= calc_flag;
end

assign calc_flag_edge = calc_flag & ~calc_flag_dly;

reg end_of_frame_dly = 0;
wire end_of_frame_edge;

always @(posedge clk)
begin
    end_of_frame_dly <= end_of_frame;
end

assign end_of_frame_edge = ~end_of_frame & end_of_frame_dly;

// when edge is detected, the next frame will be valid
always@(posedge clk)
if(calc_flag_edge == 1)
    next_frame_valid <= 1'b1;
else if(valid_frame == 1)
    next_frame_valid <= 1'b0;

// the current frame start can be determined by checking for the previous end of frame
always@(posedge clk)
if(next_frame_valid == 1 & end_of_frame_edge == 1)
    valid_frame <= 1;
else if(valid_frame == 1 & end_of_frame == 1)
    valid_frame <= 0;
    
// validity based on the external validity and the pixel validity
assign valid = (valid_frame == 1 & in_valid == 1) ? 1 : 0;


wire [15:0] internal_data_rd;
wire [15:0] internal_data_wr;

reg  [10:0] internal_addr_rd = 0;
reg  [10:0] internal_addr_wr = 0;

reg  [2:0]  internal_ena_wr = 0;

// Internal ram for storing the currently used histogram data
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

// external ram for the microblaze to access
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

// Internal data write needs to be set to a valid value when computing and to 0 when clearing phase
assign internal_data_wr = frame_reset == 0 ? internal_data_rd + 1 : 0;

reg       frame_copy = 0;
reg       post_count = 0;

reg [3:0] pre_counter = 0;
reg [2:0] post_counter = 0;

// histogram internal ram handler
always@(posedge clk)
if(frame_reset == 0)        // calculation phase
begin
    internal_addr_rd <= {3'b0, in_pixel};
    internal_addr_wr <= internal_addr_rd;
    internal_ena_wr  <= {internal_ena_wr[1:0], valid};
end
else if(frame_copy == 1)    // copying and reseting the internal ram fields
begin
    internal_addr_rd <= {3'b0, counter};
    internal_addr_wr <= internal_addr_rd;
    internal_ena_wr <= {internal_ena_wr[1:0], 1'b1};
end
else if(post_count == 1)    // needs for finishing the reseting of the internal ram
begin
    internal_ena_wr <= {internal_ena_wr[1:0], 1'b0};
    internal_addr_wr <= internal_addr_rd;
end
    
reg internal_end_of_frame = 0;
// delaying end of frame singal by one for the correct timing of the copying
always@(posedge clk)
if(valid_frame == 1)
    internal_end_of_frame <= end_of_frame;
else
    internal_end_of_frame <= 0;
    
// === counters ===================================================
// counters used in the copying and reseting
always@(posedge clk)
if(frame_copy == 1)
    pre_counter <= 0;
else if(internal_end_of_frame == 1 | pre_counter != 0)
    pre_counter <= pre_counter + 1; 
    
always@(posedge clk)
if(counter == 255)
    counter <= 0;
else if(frame_copy == 1)
    counter <= counter + 1;
    
always@(posedge clk)
if(post_counter == 2)
    post_counter <= 0;
else if(post_count == 1)
    post_counter <= post_counter + 1;
  
// === status flags ===============================================  
// reset flag set if frame ended 
always@(posedge clk)
if(post_counter == 2)
    frame_reset <= 0;
else if(pre_counter == 2)
    frame_reset <= 1;
    
// set flag for copying phase
always@(posedge clk)
if(counter == 255)
    frame_copy <= 0;
else if(pre_counter == 2)
    frame_copy <= 1;

// Clear and out writing finished
always@(posedge clk)
if(post_counter == 2)
    post_count <= 0;
else if(counter == 255)
    post_count <= 1;

// === external ram handling =======================================
// external ram enabling
always@(posedge clk)
if(frame_copy == 1)
    external_ena_wr <= {external_ena_wr[0], 1'b1};
else 
    external_ena_wr <= {external_ena_wr[0], 1'b0};

// setting output address
always@(posedge clk)
    external_addr_wr <= internal_addr_rd; 
    
// valid flasg set to signal cpu
assign out_valid = post_counter == 2;
    
endmodule
