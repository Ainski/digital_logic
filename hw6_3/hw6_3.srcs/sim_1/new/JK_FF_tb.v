`timescale 1ns/1ps
module JK_FF_tb;
    reg CLK,J,K,RST_n;
    wire Q1,Q2;
    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end
    initial begin
        J = 0;
        K = 0;
        RST_n = 0;
        #15 RST_n = 1;
        #15 RST_n = 0;
        #15 RST_n = 1;

    end
    initial begin
        #10 J = 1;
        #10 K = 1;
        #10 J = 0;
        #10 K = 0;
        #10 J = 1;
        #10 K = 0;
        #10 J = 0;
        #10 K = 1;
        #10 J = 1;
        #10 K = 0;
        #10 J = 0;
        #10 K = 1;
        #10 J = 1;
        #10 K = 0;
        #10 J = 0;

    end

    JK_FF DUT(.CLK(CLK),.J(J),.K(K),.RST_n(RST_n),.Q1(Q1),.Q2(Q2));
endmodule