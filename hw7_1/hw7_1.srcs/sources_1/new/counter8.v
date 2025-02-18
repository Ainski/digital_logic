`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/28 15:27:50
// Design Name: 
// Module Name: Counter8
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module Divider (
    input I_CLK,     // 输入时钟信号，上升沿有效
    input rst,       // 复位信号，高电平有效
    output reg O_CLK // 输出时钟
);
    parameter DIVISOR = 500000000; // 分频倍数
    reg [32:0] count = 0;    // 用于计数的寄存器，足够储存0-19
    initial begin
    count=0;
    O_CLK=0;
    end
    always @(posedge I_CLK) begin
        if (rst) begin
            count <= 0;
            O_CLK <= 0;
        end else if (count == DIVISOR/2-1) begin
            count <= 0;
            O_CLK <= ~O_CLK; // 翻转输出时钟
        end else begin
            count <= count + 1;
        end
    end
endmodule

module display7(
    input [2:0] iData,
    output [6:0] oData
    );
    reg[6:0] Data_t;
    always @ (*)
    begin
    case(iData)
        3'b000:
        begin Data_t=7'b1000000; end
        3'b001:
        begin Data_t=7'b1111001; end
        3'b010:
        begin Data_t=7'b0100100; end
        3'b011:
        begin Data_t=7'b0110000; end        
        3'b100:
        begin Data_t=7'b0011001; end        
        3'b101:
        begin Data_t=7'b0010010; end
        3'b110:
        begin Data_t=7'b0000010; end
        3'b111:
        begin Data_t=7'b1111000; end
    endcase
    end   
    assign oData=Data_t;                                             
endmodule

module JK_FF(
    input CLK,
    input J,
    input K,
    input RST_n,
    output reg Q1,
    output reg Q2
    );
    
    always @ (posedge CLK or negedge RST_n)
    begin
        if(!RST_n)
        begin
            Q1<=0;
            Q2<=1;
        end
        else
        begin
            Q1<=(J&(~Q1))|((~K)&Q1);
            Q2<=~((J&(~Q1))|((~K)&Q1));
        end
    end
    
endmodule

module Counter8(
    input CLK,
    input rst_n,
    output [2:0] oQ,
    output [6:0] oDisplay
);

    wire [6:0] displayData;
    wire [2:0] Q2;
    wire Q3;
    assign Q3=oQ[0]&oQ[1];
    wire clk_div;
    Divider divider(
       .I_CLK(CLK),
       .rst(~rst_n),
       .O_CLK(clk_div)
    );

JK_FF jk0(
    .CLK(clk_div),
    .J(1),
    .K(1),
    .RST_n(rst_n),
    .Q1(oQ[0]),
    .Q2(Q2[0])
);

JK_FF jk1(
    .CLK(clk_div),
    .J(oQ[0]),
    .K(oQ[0]),
    .RST_n(rst_n),
    .Q1(oQ[1]),
    .Q2(Q2[1])
);


JK_FF jk2(
    .CLK(clk_div),
    .J(Q3),
    .K(Q3),
    .RST_n(rst_n),
    .Q1(oQ[2]),
    .Q2(Q2[2])
);

display7 display_inst(
   .iData(oQ),
   .oData(displayData)
);

assign oDisplay = displayData;

endmodule