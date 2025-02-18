`timescale 1ns / 1ps


module Divider (
    input I_CLK,     // ����ʱ���źţ���������Ч
    input rst,       // ��λ�źţ��ߵ�ƽ��Ч
    output reg O_CLK // ���ʱ��
);
    parameter DIVISOR = 50000000; // ��Ƶ����
    reg [31:0] count = 0;    // ���ڼ����ļĴ������㹻����0-19
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
