`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/12 15:59:34
// Design Name: 
// Module Name: barrelshifter32_tb
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


module barrelshifter32_tb;
    reg [31:0] a;
    reg [4:0] b;
    reg [1:0] aluc;
    wire [31:0] c;
    
    initial
    begin
        aluc=2'b00;
        a=32'b00000000000000001111111111111111;
        b=5'b00000;
    end
    
    initial
    begin
        #40 b=5'b00000;
        #40 b=5'b00001;
        #40 b=5'b00011;
        #40 b=5'b00100;
        #40 b=5'b01000;
        #40 b=5'b10000;
        #40 b=5'b11111;
    end   
    
    initial
    begin
        #40 aluc=2'b00;
        #40 aluc=2'b10;
        #40 aluc=2'b01;
        #40 aluc=2'b11;
        #40 aluc=2'b00;
        #40 aluc=2'b10;
        #40 aluc=2'b01;
    end   
    
    barrelshifter32
    barrelshifter32_inst(
        .a(a),
        .b(b),
        .aluc(aluc),
        .c(c)
    );
    
endmodule
