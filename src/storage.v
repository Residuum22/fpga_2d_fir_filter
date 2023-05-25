`timescale 1ns / 1ps

module storage(
    input           clk,
    input           rst,
    input [7:0]     y_i,
    input           dv_i,
    input           hs_i,
    input           vs_i,
    
    output          dv_o,
    output          hs_o,
    output          vs_o,
    
    output reg [10:0] x_index,
    output reg [10:0] y_index,
    
    output reg [7:0] pix_mux,
    
    output [7:0] p0, p1, p2, p3, p4
    );


// BRAM write address is the same for the all BRAM 
// 11 bit is needed for addressing cols in the BRAM
// only one bram will be writen in the same time because the pixels are comming serial
// the upper 4 bit is needed to select the good bram.             
reg [14:0]  bram_addr_wr;

// BRAM read address is the same at the all BRAMs because the same colomn is needed to 
// read from all BRAMs
reg [10:0]  bram_addr_rd;

// Data will be written into the BRAM. This data is the y_o of the grayscaler output
reg [7:0]   bram_data_wr;

// BRAMs output is a 4 element array with the pixel width.
wire [7:0]  bram_data_rd[3:0];
 

// This block generate 4 BRAM for rows FIFO
genvar bram_i;
generate 
    for(bram_i=0;bram_i<4;bram_i=bram_i+1)
    begin
    dp_bram
    #(
        // BRAM depth need to be 1800 according to VESA for 1600x900 resolution
        .DEPTH(2000)
    )
    dp_bram
    (
        .clk(clk),
    
        .we_a(bram_addr_wr[11+bram_i]),
    
        .addr_a(bram_addr_wr[10:0]),
        .addr_b(bram_addr_rd),
        
        .din_a(bram_data_wr),
        .dout_b(bram_data_rd[bram_i])
    );
    end
endgenerate

// Edge detection logic for the hs_i and vs_i signal
// hs_i_edge signal is resetting the colomn index and increment row counter index.
// vs_i_edge signal is resetting the row index
wire vs_i_edge;
wire hs_i_edge;
reg hs_i_dly, vs_i_dly;
always @(posedge clk)
begin
    hs_i_dly <= hs_i;
    vs_i_dly <= vs_i;
end

assign hs_i_edge = hs_i & ~hs_i_dly;
assign vs_i_edge = vs_i & ~vs_i_dly;

// Mux for select signal from the y_i or 0 for padding.
// If data is valid then the incommin pixel wil be written into the bram
// if data is NOT valid then 0 valued pixel will be written into the bram == zero padding. 
always @(posedge clk)
begin
    case (dv_i)
        1'b0: pix_mux <= 0;
        2'b1: pix_mux <= y_i;
    endcase
end

// This logic is the main part of the block storage
integer i;
always @(posedge clk)
begin
    if (rst)
    begin
        x_index <= 0; // Reset x index
        y_index <= 0; // Reset y index
        bram_addr_wr[10:0] <= 0; // Disable the write of all bram
        bram_addr_rd <= 0; // Set the read address to 0
    end
    else
    begin
        bram_addr_wr[14:11] <= 4'b0001 << (y_index % 4); // Select the right bram where the incomming pixel will be written.
        bram_addr_wr[10:0] <= x_index; // Write Address is the colomn of the image with padding.
        bram_addr_rd <= x_index; // Read Address is the colom of the image with padding (Memory is read first mode) 
        bram_data_wr <= pix_mux; // The data is paddig or valid pixel.
        
        if (hs_i_edge)
        begin
            y_index <= y_index + 1; // Increment the row index
            x_index <= 0; // Reset the col index.
        end
        else
        begin
            x_index <= x_index + 1; // In every clock cycle a new pixel is comming or padding is needed.
        end
        if (vs_i_edge)
        begin
            y_index <= 0; // If vertical sync signal is arrived then reset the y_index.
        end
    end
end

// Delay the incomming signal with 2 clock cycle.
reg [7:0] pix_mux_2clk[1:0];
always @(posedge clk)
begin
    for(i=0;i<2;i=i+1)
    begin
        pix_mux_2clk[i] <= (i==0) ? pix_mux : pix_mux_2clk[i-1];
    end
end

    
reg [7:0] p0_reg, p1_reg, p2_reg, p3_reg, p4_reg;
always @(posedge clk)
begin
    case (y_index % 4)
    3'd0:
    begin
        p0_reg <= bram_data_rd[0];
        p1_reg <= bram_data_rd[1];
        p2_reg <= bram_data_rd[2];
        p3_reg <= bram_data_rd[3];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd1:
    begin
        p0_reg <= bram_data_rd[1];
        p1_reg <= bram_data_rd[2];
        p2_reg <= bram_data_rd[3];
        p3_reg <= bram_data_rd[0];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd2:
    begin
        p0_reg <= bram_data_rd[2];
        p1_reg <= bram_data_rd[3];
        p2_reg <= bram_data_rd[0];
        p3_reg <= bram_data_rd[1];
        p4_reg <= pix_mux_2clk[1];
    end
    3'd3:
    begin
        p0_reg <= bram_data_rd[3];
        p1_reg <= bram_data_rd[0];
        p2_reg <= bram_data_rd[1];
        p3_reg <= bram_data_rd[2];
        p4_reg <= pix_mux_2clk[1];
    end
    default:
    begin
        p0_reg <= 8'bZ;
        p1_reg <= 8'bZ;
        p2_reg <= 8'bZ;
        p3_reg <= 8'bZ;
        p4_reg <= 8'bZ;
    end
    endcase
end

assign p0 = p0_reg;
assign p1 = p1_reg;
assign p2 = p2_reg;
assign p3 = p3_reg;
assign p4 = p4_reg;

reg dv_o_reg[1:0], hs_o_reg[1:0], vs_o_reg[1:0];
// Assigning the controls, but I need to delay them with one CLK

always @ (posedge clk)
begin
    for (i=0;i<2;i=i+1)
    begin
        dv_o_reg[i] <= (i==0) ? dv_i : dv_o_reg[i-1];
        hs_o_reg[i] <= (i==0) ? hs_i : hs_o_reg[i-1];
        vs_o_reg[i] <= (i==0) ? vs_i : vs_o_reg[i-1];
    end
end

assign hs_o = hs_o_reg[1];
assign vs_o = vs_o_reg[1];
assign dv_o = dv_o_reg[1];
//************************************************************************************
// Convulution and write out END
//************************************************************************************

endmodule

