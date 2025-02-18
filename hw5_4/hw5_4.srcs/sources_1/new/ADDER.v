`timescale 1ns/1ps

module Adder(
    input [7:0] iData_a,
    input [7:0] iData_b,
    input iC,
    output [7:0] oData,
    output oData_C
);
    wire carry0, carry1, carry2, carry3, carry4, carry5, carry6, carry7;
    FA fa0(.iA(iData_a[0]),.iB(iData_b[0]),.iC(iC),.oS(oData[0]),.oC(carry0));
    FA fa1(.iA(iData_a[1]),.iB(iData_b[1]),.iC(carry0),.oS(oData[1]),.oC(carry1));
    FA fa2(.iA(iData_a[2]),.iB(iData_b[2]),.iC(carry1),.oS(oData[2]),.oC(carry2));
    FA fa3(.iA(iData_a[3]),.iB(iData_b[3]),.iC(carry2),.oS(oData[3]),.oC(carry3));
    FA fa4(.iA(iData_a[4]),.iB(iData_b[4]),.iC(carry3),.oS(oData[4]),.oC(carry4));
    FA fa5(.iA(iData_a[5]),.iB(iData_b[5]),.iC(carry4),.oS(oData[5]),.oC(carry5));
    FA fa6(.iA(iData_a[6]),.iB(iData_b[6]),.iC(carry5),.oS(oData[6]),.oC(carry6));
    FA fa7(.iA(iData_a[7]),.iB(iData_b[7]),.iC(carry6),.oS(oData[7]),.oC(carry7));
    
   
    assign oData_C = carry7;



endmodule