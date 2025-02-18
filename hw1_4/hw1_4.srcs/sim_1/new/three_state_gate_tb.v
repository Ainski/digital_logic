`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/19 23:23:52
// Design Name: 
// Module Name: three_state_gate_tb
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

Module three_state_gates_tb;
    reg iA;
    reg iEna;
    wire oTriState;
    
    three_state_gates uut(.iA(iA),
        .iEna(iEna),
        .oTri(oTriState)
    );
    
    initial
    begin
    iA =0;
    #40 iA=1;
    #40 iA=0;
    #40 iA=1;
    end 
    
    initial 
    begin 
    iEna=1;
    #20 iEna = 0;
    #40 iEna = 1;
    #20 iEna = 0;
    end
endmodule