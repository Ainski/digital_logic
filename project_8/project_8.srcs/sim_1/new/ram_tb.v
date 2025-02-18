`timescale 1ps/1ps
module ram_tb;
    reg clk; //时钟信号
    reg ena; //有效信号
    reg wena; //读写有效信号
    reg [4:0] addr; //地址信号
    reg [31:0] data_in; //写入数据信号
    wire [31:0] data_out; //读出数据信号
    
    ram ram_instance (
       .clk(clk),
       .ena(ena),
       .wena(wena),
       .addr(addr),
       .data_in(data_in),
       .data_out(data_out)
    );
    
    initial begin
        clk = 0; //初始化时钟信号
        ena = 0; //初始化有效信号
        wena = 0; //初始化读写有效信号
        addr = 0; //初始化地址信号
        data_in = 0; //初始化写入数据信号
        #10 
        ena = 1; //使能存储器
        wena = 1; //使能读写
        addr = 0; //设置地址
        data_in = 32'h12345678; //写入数据
        #10 
        wena = 0; //禁止读写
        addr = 0; //设置地址
        #10 
        addr = 0; //设置地址
        #10 
        addr = 1; //设置地址
        #10 
        addr = 2; //设置地址
        #10 
        addr = 3; //设置地址
        #10 
        addr = 4; //设置地址
        #10 
        addr = 5; //设置地址
        #10 
        addr = 6; //设置地址
        #10 
        addr = 7; //设置地址
        #10 
        addr = 8; //设置地址
        #10 
        addr = 9; //设置地址
        #10 
        addr = 10; //设置地址
        #10 
        addr = 11; //设置地址
        #10 
        addr = 12; //设置地址
        #10 
        addr = 13; //设置地址
        #10 
        addr = 14; //设置地址
        #10 
        addr = 15; //设置地址
        #10 
        addr = 16; //设置地址
        #10 
        addr = 17; //设置地址
        #10 
        addr = 18; //设置地址
        #10 
        addr = 19; //设置地址
        #10 
        addr = 20; //设置地址
        #10 
        addr = 21; //设置地址
        #10 
        addr = 22; //设置地址
        #10 
        addr = 23; //设置地址
        #10 
        addr = 24; //设置地址
        #10 
        addr = 25; //设置地址
        #10 
        addr = 26; //设置地址
        #10 
        addr = 27; //设置地址
        #10 
        addr = 28; //设置地址
        #10 
        addr = 29; //设置地址
        #10 
        addr = 30; //设置地址
        #10 
        addr = 31; //设置地址
        #10 
        $finish;
    end
    
    always #5 clk = ~clk; //时钟信号的变化
endmodule