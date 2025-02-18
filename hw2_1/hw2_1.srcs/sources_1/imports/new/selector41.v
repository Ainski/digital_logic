`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/23 16:15:34
// Design Name: 
// Module Name: selector41
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


module selector41(
    input [3:0] iC0,
    input [3:0] iC1,
    input [3:0] iC2,
    input [3:0] iC3,
    input iS1,
    input iS0,
    output [3:0] oZ
    );
    
    reg[3:0]    oZ_t;
    always @(*)
    begin
        case ({iS1,iS0})
            2'b00:  oZ_t=iC0;
            2'b01:  oZ_t=iC1;
            2'b10:  oZ_t=iC2;
            2'b11:  oZ_t=iC3;
        endcase
    end
    assign oZ=oZ_t;            
endmodule
