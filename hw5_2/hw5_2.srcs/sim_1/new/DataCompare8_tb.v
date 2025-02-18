`timescale 1ns/1ps
module DataCompare8_tb;

reg [7:0] iData_a;
reg [7:0] iData_b;
wire [2:0] oData;

initial
begin
    iData_a = 8'b00000001;
    iData_b = 8'b00000010;
    #10
    iData_a = 8'b00000010;
    iData_b = 8'b00000100;
    #10
    iData_a = 8'b00000100;
    iData_b = 8'b00001000;
    #10
    iData_a = 8'b00001000;
    iData_b = 8'b00010000;
    #10
    iData_a = 8'b00010000;
    iData_b = 8'b00100000;
    #10
    iData_a = 8'b00100000;
    iData_b = 8'b01000000;
    #10
    iData_a = 8'b01000000;
    iData_b = 8'b10000000;
    #10
    iData_a = 8'b10000000;
    iData_b = 8'b00000001;
    #10
    iData_a = 8'b00000010;
    iData_b = 8'b00000001;
    #10
    iData_a = 8'b00000100;
    iData_b = 8'b00000010;
    #10
    iData_a = 8'b00001000;
    iData_b = 8'b00000100;
    #10
    iData_a = 8'b00010000;
    iData_b = 8'b00001000;
    #10
    iData_a = 8'b00100000;
    iData_b = 8'b00010000;
    #10
    iData_a = 8'b01000000;
    iData_b = 8'b00100000;
    #10        
    iData_a = 8'b10000000;
    iData_b = 8'b01000000;
    #10
    iData_a= 8'b00000001;
    iData_b= 8'b00000001;
    #10
    iData_a= 8'b00000010;
    iData_b= 8'b00000010;
    #10
    iData_a= 8'b00000100;
    iData_b= 8'b00000100;
    #10
    iData_a= 8'b00001000;
    iData_b= 8'b00001000;
    #10
    iData_a= 8'b00010000;
    iData_b= 8'b00010000;
    #10
    iData_a= 8'b00100000;
    iData_b= 8'b00100000;
    #10
    iData_a= 8'b01000000;
    iData_b= 8'b01000000;
    #10
    iData_a= 8'b10000000;
    iData_b= 8'b10000000;
    
end

DataCompare8 DUT(
   .iData_a(iData_a),
   .iData_b(iData_b),
   .oData(oData)
);

endmodule