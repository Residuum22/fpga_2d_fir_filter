`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/16/2023 04:28:31 PM
// Design Name: 
// Module Name: storage_tb
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


module storage_tb;


reg clk;
reg rst;

reg [7:0] y_i;
reg dv_i, hs_i, vs_i;
wire dv_o, hs_o, vs_o;

wire [10:0] x_index;
wire [9:0] y_index;


wire [7:0] pix_mux;

wire [7:0] p0, p1, p2, p3, p4;

storage uut(
    .clk(clk),
    .rst(rst),
    .y_i(y_i),
    .dv_i(dv_i),
    .hs_i(hs_i),
    .vs_i(vs_i),
    
    .dv_o(dv_o),
    .hs_o(hs_o),
    .vs_o(vs_o),
    
    .y_index(y_index),
    .x_index(x_index),
    
    .pix_mux(pix_mux),
    
    .p0(p0),
    .p1(p1),
    .p2(p2),
    .p3(p3),
    .p4(p4)
    );


always 
begin
    clk = 1'b1; #5; 
    clk = 1'b0; #5;
end

reg [7:0] col_cntr, row_cntr; 
integer i, p;

initial 
begin
    rst <= 1;
    hs_i <= 0;
    vs_i <= 0;
    dv_i <= 0;
    
    col_cntr <= 0;
    row_cntr <= 0;
    
    #20
    rst <= 0;
    
    #60
    dv_i <= 0;
      
    #40
    vs_i <= 1;
    
    #20
    vs_i <= 0;
    
    #60
    hs_i <= 1;
    
    #20
    hs_i <= 0;
    
    #60
    dv_i <= 0;
    
    for(p=0;p<10;p=p+1)
    begin
        for(i=0;i<15;i=i+1)
        begin
            if (i<10)
            begin
                #10
                dv_i <= 1;
                
                #160
                dv_i <= 0;
                
                #60
                hs_i <= 1;
                
                #20
                hs_i <= 0;
                
                #60
                dv_i <= 0;
            end
            else
            begin
                #10
                dv_i <= 0;
                
                #160
                dv_i <= 0;
                
                #60
                hs_i <= 1;
                
                #20
                hs_i <= 0;
                
                #60
                dv_i <= 0;
            end  
        end
        
        #60
        dv_i <= 0;
          
        #40
        vs_i <= 1;
        
        #20
        vs_i <= 0;
    end
end


always @(negedge clk)
begin
    if (dv_i)
    begin
        y_i <= {row_cntr[3:0], col_cntr[3:0]};
        col_cntr <= col_cntr + 1;
        if (col_cntr == 15)
        begin
            col_cntr <= 0;
            row_cntr <= row_cntr + 1;
        end
    end
    if (vs_i)
    begin
        col_cntr <= 0;
        row_cntr <= 0;
    end
end

endmodule
