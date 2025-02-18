`timescale 1ns/1ns

module Divider_tb;

// 连接到被测试模块的信号
reg clk;
reg rst;
wire out_clk;

// 实例化被测试模块
Divider dut (.I_CLK(clk),.rst(rst),.O_CLK(out_clk));

// 生成时钟信号
always #5 clk = ~clk;

// 测试过程
initial begin
    clk = 0;
    rst = 1;
    #10;
    rst = 0;
    #200;
    $finish;
end

endmodule