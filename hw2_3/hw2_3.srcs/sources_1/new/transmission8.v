`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/23 21:52:46
// Design Name: 
// Module Name: transmission8
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


module transmission8(
    input [7:0] iData,
    input A,
    input B,
    input C,
    output [7:0] oData
    );
    
    reg[7:0] oData_t;
    always @(*)
    begin
        
        case ({A,B,C})
    
    3'b000:
        begin
            oData_t=8'b11111111;
            oData_t[0]=iData[0] ;
        end
    3'b001:
        begin
            oData_t=8'b11111111;
            oData_t[1]=iData[1] ;
        end
    3'b010:
        begin
            oData_t=8'b11111111;
            oData_t[2]=iData[2] ;
        end
    3'b011:
        begin 
            oData_t=8'b11111111;
            oData_t[3]=iData[3];
        end
    3'b100:
        begin
            oData_t=8'b11111111;
            oData_t[4]=iData[4];
        end
    3'b101:
        begin 
            oData_t=8'b11111111;
            oData_t[5]=iData[5];
        end
    3'b110:
        begin
            oData_t=8'b11111111;
            oData_t[6]=iData[6];
        end
    3'b111:
        begin
            oData_t=8'b11111111;
            oData_t[7]=iData[7];
        end
        endcase
    end
    assign oData=oData_t;

//    reg oData_t0,oData_t1,oData_t2,oData_t3,oData_t4,oData_t5,oData_t6,oData_t7;
//    always @ (*)
//    begin
//    case ({A,B,C})
//    3'b000:
//    begin oData_t0=
        
endmodule
