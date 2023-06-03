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
    
    reg [7:0] externa_addr = 0;
    wire [15:0] out_data;
    wire out_valid;
    
    wire [7:0] y_i;
    reg dv_i, hs_i, vs_i;
    wire dv_o, hs_o, vs_o;
    
histogram_calculator hc(
    .clk(clk),
    .microblaze_clk(clk),
    .rst(rst),
    .in_pixel(y_i),
    .calc_flag(calc_flag),
    .in_valid(dv_i),
    .end_of_frame(vs_i),
    .external_addr_rd(externa_addr),

    .external_data_rd(out_data),
    .out_valid(out_valid)
    );    
    
always #5
    clk = ~clk;  
    
reg [7:0] col_cntr, row_cntr; 
integer i, p;
integer c;

initial 
begin
#18000
for(c = 0; c < 256; c = c + 1)
begin
#10
    externa_addr = c;
end

end

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
    calc_flag <=1;
    
    #60
    dv_i <= 0;
    calc_flag<=0;
      
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
    
    for(p=0;p<20;p=p+1)
    begin
        for(i=0;i<20;i=i+1)
        begin
            if (i<16)
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
    
assign y_i = {row_cntr[3:0], col_cntr[3:0]};
    
    
    
    
    
    
    
endmodule
