`timescale 1ns/1ps

module Asynchoronous_D_FF_tb;

reg CLK;
reg RST_n;
reg D;
wire Q1;
wire Q2;


initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end
initial 
begin
    RST_n = 0;
    #15 RST_n = 1;
    #15 RST_n = 0;
    #15 RST_n = 1;
end
initial
begin
    D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;  
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
    #10 D = 0;
    #10 D = 1;
end

Asynchronous_D_FF D_FF1(.CLK(CLK),.D(D),.RST_n(RST_n),.Q1(Q1),.Q2(Q2));

endmodule