`timescale 1ns/1ps

module Adder_tb;

reg [7:0] iData_a;
reg [7:0] iData_b;
reg iC;
wire [7:0] oData;
wire oData_C;

initial
begin
    iData_a = 8'b00000001;
    iData_b = 8'b00000010;
    iC = 1'b0;

    #40
    iData_a = 8'b00000010;
    iData_b = 8'b00000001;
    iC = 1'b1;
    #40
    iData_a = 8'b00000011;
    iData_b = 8'b00000011;
    iC = 1'b0;

    #40
    iData_a = 8'b11111111;
    iData_b = 8'b11111111;
    iC = 1'b0;


end
Adder Adder_uut(.iData_a(iData_a),.iData_b(iData_b),.iC(iC),.oData(oData),.oData_C(oData_C));

endmodule
