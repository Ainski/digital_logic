`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/30 16:01:41
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb();
    reg[1:0] iEna;
    reg[2:0] iData;
    wire[7:0] oData;
    
    initial 
    begin
        iEna=2'bx1;
        #40 iEna=2'b0x;
        #40 iEna=2'b10;
    end
    
    initial 
    begin
        iData=3'b000;
        #120 iData=3'b001;
        #40 iData=3'b010;
        #40 iData=3'b011;
        #40 iData=3'b100;
        #40 iData=3'b101;
        #40 iData=3'b110;
        #40 iData=3'b111;
    end
    
    decoder decoder_uut(
        .iData(iData),
        .iEna(iEna),
        .oData(oData)
        );
endmodule
