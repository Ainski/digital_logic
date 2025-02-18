`timescale 1ns/1ps

module DataCompare4_tb;

reg [3:0] iData_a;
reg [3:0] iData_b;
reg [2:0] iData;
wire [2:0] oData;

initial begin
    iData_a = 4'b0001;
    iData_b = 4'b0010;
    iData = 3'b010;
    #10
    iData_a = 4'b0010;
    iData_b = 4'b0100;
    iData = 3'b001;
    #10
    iData_a = 4'b0100;
    iData_b = 4'b1000;
    iData = 3'b010;
    #10
    iData_a = 4'b1000;
    iData_b = 4'b0001;
    iData = 3'b001;
    #10
    iData_a = 4'b0001;
    iData_b = 4'b0010;
    iData = 3'b100;
    #10
    iData_a = 4'b0010;
    iData_b = 4'b0100;
    iData = 3'b100;
    #10
    iData_a = 4'b0100;
    iData_b = 4'b1000;
    iData = 3'b010;
    #10
    iData_a = 4'b1000;
    iData_b = 4'b0001;
    iData = 3'b001;
    #10
    iData_a = 4'b0001;
    iData_b = 4'b0001;
    iData = 3'b010;
    #10
    iData_a = 4'b0001;
    iData_b = 4'b0001;
    iData = 3'b001;
    #10
    iData_a = 4'b0001;
    iData_b = 4'b0001;
    iData = 3'b010;
end
DataCompare4 DataCompare4_uut (
   .iData_a(iData_a),
   .iData_b(iData_b), 
   .iData(iData),
   .oData(oData)
);
endmodule
