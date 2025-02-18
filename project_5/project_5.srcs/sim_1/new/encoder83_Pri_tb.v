`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/04 20:20:43
// Design Name: 
// Module Name: encoder83_Pri_tb
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


module encoder83_Pri_tb(

    );
    reg [7:0]iData;
    reg iEI;
    
    wire [2:0]oData;
    wire oEO;
    
    
    initial 
    begin 
        iData=8'bxxxxxxxx;
        #40 iData=8'b11111111;
        #40 iData=8'b0xxxxxxx;
        #40 iData=8'b10xxxxxx;
        #40 iData=8'b110xxxxx;
        #40 iData=8'b1110xxxx;
        #40 iData=8'b11110xxx;
        #40 iData=8'b111110xx;
        #40 iData=8'b1111110x;
        #40 iData=8'b11111110;
    end 
    
    initial 
    begin 
        iEI=1;
        #40 iEI=0;
    end
    
    encoder83_Pri encoder83_Pri_uut(
    .iData(iData),
    .iEI(iEI),
    .oData(oData),
    .oEO(oEO)
    );
    
endmodule
