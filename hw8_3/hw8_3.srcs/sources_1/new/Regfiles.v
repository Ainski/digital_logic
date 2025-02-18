`timescale 1ns/1ps


module decoder(
    input [4:0] iData,
    input  iEna,
    output [31:0] oData
    );

    assign oData[0]=~iData[0]&~iData[1]&~iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[1]=iData[0]&~iData[1]&~iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[2]=~iData[0]&iData[1]&~iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[3]=iData[0]&iData[1]&~iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[4]=~iData[0]&~iData[1]&iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[5]=iData[0]&~iData[1]&iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[6]=~iData[0]&iData[1]&iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[7]=iData[0]&iData[1]&iData[2]&~iData[3]&~iData[4]&iEna;
    assign oData[8]=~iData[0]&~iData[1]&~iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[9]=iData[0]&~iData[1]&~iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[10]=~iData[0]&iData[1]&~iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[11]=iData[0]&iData[1]&~iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[12]=~iData[0]&~iData[1]&iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[13]=iData[0]&~iData[1]&iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[14]=~iData[0]&iData[1]&iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[15]=iData[0]&iData[1]&iData[2]&iData[3]&~iData[4]&iEna;
    assign oData[16]=~iData[0]&~iData[1]&~iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[17]=iData[0]&~iData[1]&~iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[18]=~iData[0]&iData[1]&~iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[19]=iData[0]&iData[1]&~iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[20]=~iData[0]&~iData[1]&iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[21]=iData[0]&~iData[1]&iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[22]=~iData[0]&iData[1]&iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[23]=iData[0]&iData[1]&iData[2]&~iData[3]&iData[4]&iEna;
    assign oData[24]=~iData[0]&~iData[1]&~iData[2]&iData[3]&iData[4]&iEna;
    assign oData[25]=iData[0]&~iData[1]&~iData[2]&iData[3]&iData[4]&iEna;
    assign oData[26]=~iData[0]&iData[1]&~iData[2]&iData[3]&iData[4]&iEna;
    assign oData[27]=iData[0]&iData[1]&~iData[2]&iData[3]&iData[4]&iEna;
    assign oData[28]=~iData[0]&~iData[1]&iData[2]&iData[3]&iData[4]&iEna;
    assign oData[29]=iData[0]&~iData[1]&iData[2]&iData[3]&iData[4]&iEna;
    assign oData[30]=~iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iEna;
    assign oData[31]=iData[0]&iData[1]&iData[2]&iData[3]&iData[4]&iEna; 
endmodule

module Asynchronous_D_FF(
    input CLK,
    input [31:0] D,
    input RST_n,
    input iEna,
    output reg [31:0] Q1
);

always @(negedge CLK )
begin 
    if(RST_n)
        begin
            Q1 <= 32'h0;
        end
    else
    begin
        if(iEna)
        begin 
            Q1 <= D;
        end 
    end
end 
endmodule
module mux(
    input [4:0] addr,
    input [31:0] iData1,
    input [31:0] iData2,
    input [31:0] iData3,
    input [31:0] iData4,
    input [31:0] iData5,
    input [31:0] iData6,
    input [31:0] iData7,
    input [31:0] iData8,
    input [31:0] iData9,
    input [31:0] iData10,
    input [31:0] iData11,
    input [31:0] iData12,
    input [31:0] iData13,
    input [31:0] iData14,
    input [31:0] iData15,
    input [31:0] iData16,
    input [31:0] iData17,
    input [31:0] iData18,
    input [31:0] iData19,
    input [31:0] iData20,
    input [31:0] iData21,
    input [31:0] iData22,
    input [31:0] iData23,
    input [31:0] iData24,
    input [31:0] iData25,
    input [31:0] iData26,
    input [31:0] iData27,
    input [31:0] iData28,
    input [31:0] iData29,
    input [31:0] iData30,
    input [31:0] iData31,
    input [31:0] iData32,
    input iEna,
    output [31:0] oData
);
    reg [31:0]oData_r;
    always @(*)
    begin
        if(iEna)
        begin
        case (addr)
            5'b00000: oData_r = iData1;
            5'b00001: oData_r = iData2;
            5'b00010: oData_r = iData3;
            5'b00011: oData_r = iData4;
            5'b00100: oData_r = iData5;
            5'b00101: oData_r = iData6;
            5'b00110: oData_r = iData7;
            5'b00111: oData_r = iData8;
            5'b01000: oData_r = iData9;
            5'b01001: oData_r = iData10;
            5'b01010: oData_r = iData11;
            5'b01011: oData_r = iData12;
            5'b01100: oData_r = iData13;
            5'b01101: oData_r = iData14;
            5'b01110: oData_r = iData15;
            5'b01111: oData_r = iData16;
            5'b10000: oData_r = iData17;
            5'b10001: oData_r = iData18;
            5'b10010: oData_r = iData19;
            5'b10011: oData_r = iData20;
            5'b10100: oData_r = iData21;
            5'b10101: oData_r = iData22;
            5'b10110: oData_r = iData23;
            5'b10111: oData_r = iData24;
            5'b11000: oData_r = iData25;
            5'b11001: oData_r = iData26;
            5'b11010: oData_r = iData27;
            5'b11011: oData_r = iData28;
            5'b11100: oData_r = iData29;
            5'b11101: oData_r = iData30;
            5'b11110: oData_r = iData31;
            5'b11111: oData_r = iData32;    
        endcase
        end
        else
        begin
            oData_r = 32'hz;
        end

    end
    assign oData = oData_r;
endmodule
module Regfiles(
input clk, //寄存器组时钟信号，下降沿写入数据
input rst, //异步复位信号，高电平时全部寄存器置零
input we, //寄存器读写有效信号，高电平时允许寄存器写入数据，低电平时允许寄存器读出数据
input [4:0] raddr1, //所需读取的寄存器的地址
input [4:0] raddr2, //所需读取的寄存器的地址
input [4:0] waddr, //写寄存器的地址
input [31:0] wdata, //写寄存器数据，数据在 clk 下降沿时被写入
output [31:0] rdata1, //raddr1 所对应寄存器的输出数据
output [31:0] rdata2 //raddr2 所对应寄存器的输出数据
);
    wire [31:0] regfile [0:31]; //寄存器组，每个寄存器 32 位
    wire [31:0] wire_en; //寄存器读写使能信号，高电平时允许寄存器写入数据，低电平时允许寄存器读出数据
    decoder decoder1(.iData(waddr),.iEna(we),.oData(wire_en)); //寄存器读写使能信号的译码器
    Asynchronous_D_FF DFF1(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[0]),.Q1(regfile[0])); //寄存器组的 DFF
    Asynchronous_D_FF DFF2(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[1]),.Q1(regfile[1]));
    Asynchronous_D_FF DFF3(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[2]),.Q1(regfile[2]));
    Asynchronous_D_FF DFF4(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[3]),.Q1(regfile[3]));
    Asynchronous_D_FF DFF5(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[4]),.Q1(regfile[4]));
    Asynchronous_D_FF DFF6(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[5]),.Q1(regfile[5]));
    Asynchronous_D_FF DFF7(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[6]),.Q1(regfile[6]));
    Asynchronous_D_FF DFF8(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[7]),.Q1(regfile[7]));
    Asynchronous_D_FF DFF9(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[8]),.Q1(regfile[8]));
    Asynchronous_D_FF DFF10(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[9]),.Q1(regfile[9]));
    Asynchronous_D_FF DFF11(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[10]),.Q1(regfile[10]));
    Asynchronous_D_FF DFF12(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[11]),.Q1(regfile[11]));
    Asynchronous_D_FF DFF13(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[12]),.Q1(regfile[12]));
    Asynchronous_D_FF DFF14(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[13]),.Q1(regfile[13]));    
    Asynchronous_D_FF DFF15(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[14]),.Q1(regfile[14]));
    Asynchronous_D_FF DFF16(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[15]),.Q1(regfile[15]));    
    Asynchronous_D_FF DFF17(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[16]),.Q1(regfile[16]));
    Asynchronous_D_FF DFF18(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[17]),.Q1(regfile[17]));
    Asynchronous_D_FF DFF19(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[18]),.Q1(regfile[18]));
    Asynchronous_D_FF DFF20(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[19]),.Q1(regfile[19]));
    Asynchronous_D_FF DFF21(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[20]),.Q1(regfile[20]));
    Asynchronous_D_FF DFF22(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[21]),.Q1(regfile[21]));
    Asynchronous_D_FF DFF23(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[22]),.Q1(regfile[22]));
    Asynchronous_D_FF DFF24(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[23]),.Q1(regfile[23]));
    Asynchronous_D_FF DFF25(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[24]),.Q1(regfile[24]));        
    Asynchronous_D_FF DFF26(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[25]),.Q1(regfile[25]));
    Asynchronous_D_FF DFF27(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[26]),.Q1(regfile[26]));
    Asynchronous_D_FF DFF28(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[27]),.Q1(regfile[27]));    
    Asynchronous_D_FF DFF29(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[28]),.Q1(regfile[28]));
    Asynchronous_D_FF DFF30(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[29]),.Q1(regfile[29]));
    Asynchronous_D_FF DFF31(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[30]),.Q1(regfile[30]));
    Asynchronous_D_FF DFF32(.CLK(clk),.D(wdata),.RST_n(rst),.iEna(wire_en[31]),.Q1(regfile[31]));
    mux mux1(.addr(raddr1), .iData1(regfile[0]), .iData2(regfile[1]), .iData3(regfile[2]), .iData4(regfile[3]), .iData5(regfile[4]), 
        .iData6(regfile[5]), .iData7(regfile[6]), .iData8(regfile[7]), .iData9(regfile[8]), .iData10(regfile[9]), .iData11(regfile[10]), 
        .iData12(regfile[11]), .iData13(regfile[12]), .iData14(regfile[13]), .iData15(regfile[14]), .iData16(regfile[15]), .iData17(regfile[16]), 
        .iData18(regfile[17]), .iData19(regfile[18]), .iData20(regfile[19]), .iData21(regfile[20]), .iData22(regfile[21]), .iData23(regfile[22]),
        .iData24(regfile[23]), .iData25(regfile[24]), .iData26(regfile[25]), .iData27(regfile[26]), .iData28(regfile[27]), .iData29(regfile[28]), 
        .iData30(regfile[29]), .iData31(regfile[30]), .iData32(regfile[31]), .iEna(!we), .oData(rdata1));
    mux mux2(.addr(raddr2), .iData1(regfile[0]), .iData2(regfile[1]), .iData3(regfile[2]), .iData4(regfile[3]), .iData5(regfile[4]), 
        .iData6(regfile[5]), .iData7(regfile[6]), .iData8(regfile[7]), .iData9(regfile[8]), .iData10(regfile[9]), .iData11(regfile[10]), 
        .iData12(regfile[11]), .iData13(regfile[12]), .iData14(regfile[13]), .iData15(regfile[14]), .iData16(regfile[15]), .iData17(regfile[16]), 
        .iData18(regfile[17]), .iData19(regfile[18]), .iData20(regfile[19]), .iData21(regfile[20]), .iData22(regfile[21]), .iData23(regfile[22]),
        .iData24(regfile[23]), .iData25(regfile[24]), .iData26(regfile[25]), .iData27(regfile[26]), .iData28(regfile[27]), .iData29(regfile[28]), 
        .iData30(regfile[29]), .iData31(regfile[30]), .iData32(regfile[31]), .iEna(!we), .oData(rdata2));   


endmodule
