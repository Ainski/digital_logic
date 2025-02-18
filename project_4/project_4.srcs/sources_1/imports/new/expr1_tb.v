`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/14 16:26:28
// Design Name: 
// Module Name: expr1_tb
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


module logic_gates_tb(
    );
    reg a;
    reg b;
    wire oAnd;
    wire oOr;
    wire oNot;
    
    initial
    begin 
        iA=0;
        #40  iA=1;
        #40  iA=0;
        #40  iA=1;
        #40  iA=0;
    end
    
    initial
    begin 
        iB=0;
        #40  iB=0;
        #40  iB=1;
        #40  iB=1;
        #40  iB=0;
    end
    
    logic_gate_1
    logic_gates_inst(
        .iA(iA),
        .iB(iB),
        .oAnd(oAnd)
        .oOr(oOr)
        .oNot(oNot)
        );
endmodule
