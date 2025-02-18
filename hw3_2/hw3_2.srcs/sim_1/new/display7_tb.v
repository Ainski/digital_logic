`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/04 10:58:18
// Design Name: 
// Module Name: display7_tb
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


module display7_tb;
    reg [3:0] iData;
    wire [6:0] oData;
    
    initial 
        begin 
        iData=4'd0;
        #40 iData=4'd1;
        #40 iData=4'd2;
        #40 iData=4'd3;
        #40 iData=4'd4;
        #40 iData=4'd5;
        #40 iData=4'd6;
        #40 iData=4'd7;
        #40 iData=4'd8;
        #40 iData=4'd9;
    end
    
    display7 
    display7_uut(
    .iData(iData),
    .oData(oData)
    );

        
endmodule
