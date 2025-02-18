`timescale 1ns/1ps
module JK_FF(
    input CLK,
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
);

always @(posedge CLK or posedge RST_n) 
    begin
        if(!RST_n)
            begin
                Q1 <= 0;
                Q2 <= 1;
            end
        else
            begin
                Q1 <= J&~Q1|~K&Q1;
                Q2 <= ~(J&~Q1|~K&Q1);
            end
            
    end
endmodule