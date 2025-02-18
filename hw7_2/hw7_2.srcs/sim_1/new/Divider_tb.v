`timescale 1ns/1ns

module Divider_tb;

// ���ӵ�������ģ����ź�
reg clk;
reg rst;
wire out_clk;

// ʵ����������ģ��
Divider dut (.I_CLK(clk),.rst(rst),.O_CLK(out_clk));

// ����ʱ���ź�
always #5 clk = ~clk;

// ���Թ���
initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    #200;
    $finish;
end

endmodule