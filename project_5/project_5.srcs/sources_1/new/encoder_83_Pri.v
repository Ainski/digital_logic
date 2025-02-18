`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/04 17:46:34
// Design Name: 
// Module Name: encoder_83_Pri
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


module encoder83_Pri(
    input [7:0] iData,
    input iEI,
    output [2:0] oData,
    output oEO
    );
    
    
     reg [2:0] oData_t;
     reg oEO_t;
     always @(*)
     begin
        oEO_t=1;
        if(~iData[7]) oData_t=3'b000;
        else if(~iData[6]) oData_t=3'b001;
        else if(~iData[5]) oData_t=3'b010;
        else if(~iData[4]) oData_t=3'b011;
        else if(~iData[3]) oData_t=3'b100;
        else if(~iData[2]) oData_t=3'b101;
        else if(~iData[1]) oData_t=3'b110;
        else if(~iData[0]) oData_t=3'b111;
        else 
        begin
        oData_t=3'b111;
        oEO_t=0;
        end
     end
      

       
       
     assign oData[0]=oData_t[0]|iEI;
     assign oData[1]=oData_t[1]|iEI;
     assign oData[2]=oData_t[2]|iEI;
     assign oEO=oEO_t|iEI;
endmodule
