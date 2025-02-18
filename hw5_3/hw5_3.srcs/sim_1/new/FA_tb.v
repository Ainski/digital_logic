`timescale 1ns/1ps

module FA_tb;
reg iA,iB,iC;
wire oC,oS;
initial begin
    iA = 0;
    iB = 0;
    iC = 0;
    #10
    iA = 1;
    iB = 0;
    iC = 0;
    #10
    iA = 0;
    iB = 1;
    iC = 0;
    #10
    iA = 0;
    iB = 0;
    iC = 1;
    #10
    iA = 1;
    iB = 1;
    iC = 0;
    #10
    iA = 1;
    iB = 0;
    iC = 1;
    #10
    iA = 0;
    iB = 1;
    iC = 1;
    #10
    iA = 1;
    iB = 1;
    iC = 1;
    
end
FA FA_uut(.iA(iA),.iB(iB),.iC(iC),.oC(oC),.oS(oS));
endmodule