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
    input I_CLK,     // ����ʱ���źţ���������Ч
    input rst,       // ��λ�źţ��ߵ�ƽ��Ч
    output reg O_CLK // ���ʱ��
);
    parameter DIVISOR = 500000000; // ��Ƶ����
    reg [4:0] count = 0;    // ���ڼ����ļĴ������㹻����0-19
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
            O_CLK <= ~O_CLK; // ��ת���ʱ��
        end else begin
            count <= count + 1;
        end
    end
endmodule
