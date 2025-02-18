`timescale 1ps/1ps
module Regfiles_tb();
    reg clk, rst, we;
    reg [4:0] raddr1, raddr2, waddr;
    reg [31:0] wdata;
    wire [31:0] rdata1, rdata2;
    Regfiles regfiles(.clk(clk), .rst(rst), .we(we), .raddr1(raddr1), .raddr2(raddr2), .waddr(waddr), .wdata(wdata), .rdata1(rdata1), .rdata2(rdata2));
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end 
    initial begin
        rst =1;
        we = 0;
        waddr = 0;
        wdata = 0;
        raddr1 =0;
        raddr2 =0;
        #10 rst = 0;
        
        #10 we = 1;
        waddr = 0;
        wdata = 32'h12345678;
        #10 we = 0;
        raddr1 =  0;
        raddr2 = 16;
        #10
        we = 1;
        waddr = 16;
        wdata = 32'h87654321;
        #10 we = 0;
        raddr1 = 16;
        raddr2 = 0;
        #10
        $finish;
    end
endmodule