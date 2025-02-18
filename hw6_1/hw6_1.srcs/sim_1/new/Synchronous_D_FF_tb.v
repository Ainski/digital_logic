`timescale 1ns/1ps
module Synchronous_D_FF_tb;

reg CLK,D,RST_n;
wire Q1,Q2;

initial 
begin 
    CLK=1;
    forever #5 CLK=~CLK;
end 

initial 
begin 
    RST_n=1;
    D=0;
    
    #10 RST_n=0;
    #10 RST_n=1;
    #100 D=1;
    #10 D=0;
    #10 D=1;
    #10 D=0;
    
end 
Synchronous_D_FF Synchronous_D_FF_uut(.CLK(CLK),.D(D),.RST_n(RST_n),.Q1(Q1),.Q2(Q2));

endmodule