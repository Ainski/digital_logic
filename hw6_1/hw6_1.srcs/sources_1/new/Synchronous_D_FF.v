`timescale 1ns/1ps
module Synchronous_D_FF (
    input CLK,
    input D,
    input RST_n,
    output reg Q1,
    output reg Q2
);
always @(posedge CLK )
begin
    if (!RST_n)
    begin
        Q1 <= 0;
        Q2 <= 1;    
    end     
    else
    begin
        Q1 <= D;
        Q2 <= ~D;   
    end

end

endmodule
