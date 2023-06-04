`timescale 1ns / 1ps

//******************************************************************************
//* AXI4-Lite interface                                                     *
//******************************************************************************
module axi4_lite_if #(
    parameter ADDR_BITS = 8
) (
    input  wire                 clk,  
    input  wire                 rst,           
    
    input  wire [ADDR_BITS-1:0] s_axi_awaddr,
    input  wire                 s_axi_awvalid,
    output wire                 s_axi_awready,
    
    input  wire [31:0]          s_axi_wdata,
    input  wire [3:0]           s_axi_wstrb,
    input  wire                 s_axi_wvalid,
    output wire                 s_axi_wready,
    
    output wire [1:0]           s_axi_bresp,
    output wire                 s_axi_bvalid,
    input  wire                 s_axi_bready,
    
    input  wire [ADDR_BITS-1:0] s_axi_araddr,
    input  wire                 s_axi_arvalid,
    output wire                 s_axi_arready,
    
    output reg  [31:0]          s_axi_rdata,
    output wire [1:0]           s_axi_rresp,
    output wire                 s_axi_rvalid,
    input  wire                 s_axi_rready,
    
    output reg  [ADDR_BITS-1:0] wr_addr,       
    output wire                 wr_en,          
    output reg  [31:0]          wr_data,        
    output reg  [3:0]           wr_strb,        
    
    output reg  [ADDR_BITS-1:0] rd_addr,  
    output wire                 rd_en,       
    input  wire [31:0]          rd_data
);

//******************************************************************************
//* Write state machine                                                     *
//******************************************************************************
localparam WR_ADDR_WAIT = 2'd0;
localparam WR_DATA_WAIT = 2'd1;
localparam WR_EXECUTE   = 2'd2;
localparam WR_RESPONSE  = 2'd3;

reg [1:0] wr_state;

always @(posedge clk)
begin
    if (rst)
        wr_state <= WR_ADDR_WAIT;
    else
        case (wr_state)
            //Waiting for address valid
            WR_ADDR_WAIT: if (s_axi_awvalid)
                          begin
                              wr_state <= WR_DATA_WAIT;
                              wr_addr  <= s_axi_awaddr;
                          end
                          else
                              wr_state <= WR_ADDR_WAIT;
            
            //Waiting for write data valid              
            WR_DATA_WAIT: if (s_axi_wvalid)
                          begin
                              wr_state <= WR_EXECUTE;
                              wr_data  <= s_axi_wdata;
                              wr_strb  <= s_axi_wstrb;
                          end
                          else
                              wr_state <= WR_DATA_WAIT;
            
            //Execute the write
            WR_EXECUTE  : wr_state <= WR_RESPONSE;
            
            //Send response
            WR_RESPONSE : if (s_axi_bready)
                              wr_state <= WR_ADDR_WAIT;
                          else
                              wr_state <= WR_RESPONSE;
        endcase
end

assign s_axi_awready = (wr_state == WR_ADDR_WAIT);
assign s_axi_wready  = (wr_state == WR_DATA_WAIT);
assign s_axi_bvalid  = (wr_state == WR_RESPONSE);
assign s_axi_bresp   = 2'b00;

assign wr_en = (wr_state == WR_EXECUTE);


//******************************************************************************
//* Read state machine                                                   *
//******************************************************************************
localparam RD_ADDR_WAIT = 2'd0;
localparam RD_EXECUTE   = 2'd1;
localparam RD_SEND_DATA = 2'd2;

reg [1:0] rd_state;

always @(posedge clk)
begin
    if (rst)
        rd_state <= RD_ADDR_WAIT;
    else
        case (rd_state)
            RD_ADDR_WAIT: if (s_axi_arvalid)
                          begin
                              rd_state <= RD_EXECUTE;
                              rd_addr  <= s_axi_araddr;
                          end
                          else
                              rd_state <= RD_ADDR_WAIT;
            
            RD_EXECUTE  : begin
                              rd_state    <= RD_SEND_DATA;
                              s_axi_rdata <= rd_data;
                          end
            
            RD_SEND_DATA: if (s_axi_rready)
                          begin
                              rd_state    <= RD_ADDR_WAIT;
                              s_axi_rdata <= 32'd0;
                          end
                          else
                              rd_state <= RD_SEND_DATA;
        endcase
end

assign s_axi_arready = (rd_state == RD_ADDR_WAIT);
assign s_axi_rvalid  = (rd_state == RD_SEND_DATA);
assign s_axi_rresp   = 2'b00;

assign rd_en = (rd_state == RD_EXECUTE);

endmodule
