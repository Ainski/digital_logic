`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/23 16:31:48
// Design Name: 
// Module Name: selector41_tb
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


module selector41_tb;
    reg [3:0] iC0;
    reg [3:0] iC1;
    reg [3:0] iC2;
    reg [3:0] iC3;
    reg iS1;
    reg iS0;
    wire [3:0] oZ;
    initial iC0=4'b0001;
    initial iC1=4'b0010;
    initial iC2=4'b0100;
    initial iC3=4'b1000;
    initial 
    begin 
        iS1=0;
        #40 iS1=0;
        #40 iS1=1;
        #40 iS1=1;
    end
    initial 
    begin 
        iS0=0;
        #40 iS0=1;
        #40 iS0=0;
        #40 iS0=1;
    end 
    selector41
    selector41_uut(
        .iC0(iC0),
        .iC1(iC1),
        .iC2(iC2),
        .iC3(iC3),
        .iS1(iS1),
        .iS0(iS0),
        .oZ(oZ)
    );    
endmodule
