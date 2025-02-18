`timescale 1ns/1ps





module pcreg(input clk,input rst,input ena,input [31:0] data_in,output reg [31:0] data_out);

always@(posedge clk or posedge rst or posedge ena) 
begin
    if(rst)
    begin
        data_out<=0;
    end
    else if(ena)
    begin
        data_out<=data_in;
    end
    else
    begin
        data_out<=data_out;

    end
end


endmodule