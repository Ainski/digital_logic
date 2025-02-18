`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/14 16:04:52
// Design Name: 
// Module Name: expr1
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


module logic_gates_1(
    iA,
    iB,
    oAnd,
    oOr,
    oNot
    );
    input iA,iB;
    ouput oAnd,oOr,oNot;
    and (oAnd,iA,iB);
    or (oOr,iA,iB);
    not (oNot,iA);
endmodule
