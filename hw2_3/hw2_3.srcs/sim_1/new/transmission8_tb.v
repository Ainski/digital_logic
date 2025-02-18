`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/23 22:36:35
// Design Name: 
// Module Name: transmission8_tb
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


module transmission8_tb;
    reg[7:0] iData;
    reg A;
    reg B;
    reg C;
    wire[7:0] oData;
    initial 
        begin
            iData=8'b00000000;
        end
        
    initial 
        begin
        A=0;
        #40 A=0;
        #40 A=0;
        #40 A=0;
        #40 A=1;
        #40 A=1;
        #40 A=1;
        #40 A=1;
        end
    
    initial 
        begin 
        B=0;
        #40 B=0;
        #40 B=1;
        #40 B=1;
        #40 B=0;
        #40 B=0;
        #40 B=1;
        #40 B=1;
        end
    
    initial 
        begin 
        C=0;
        #40 C=1;                
        #40 C=0;
        #40 C=1;
        #40 C=0;
        #40 C=1;
        #40 C=0;
        #40 C=1;
        end
        
    transmission8 
    transmission8_uut(
    .iData(iData),
    .A(A),
    .B(B),
    .C(C),
    .oData(oData));
    
endmodule
