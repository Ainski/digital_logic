`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/04 16:16:42
// Design Name: 
// Module Name: Divider
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


module Divider (
    input I_CLK,     // 输入时钟信号，上升沿有效
    input rst,       // 复位信号，高电平有效
    output reg O_CLK // 输出时钟
);
    parameter DIVISOR = 500000000; // 分频倍数
    reg [4:0] count = 0;    // 用于计数的寄存器，足够储存0-19
    initial begin
    count=0;
    O_CLK=0;
    end
    always @(posedge I_CLK) begin
        if (rst) begin
            count <= 0;
            O_CLK <= 0;
        end else if (count == DIVISOR/2-1) begin
            count <= 0;
            O_CLK <= ~O_CLK; // 翻转输出时钟
        end else begin
            count <= count + 1;
        end
    end
endmodule
