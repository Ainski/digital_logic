`timescale 1ps/1ps
module ram_2_tb;
    reg clk; //ʱ���ź�
    reg ena; //��Ч�ź�
    reg wena; //��д��Ч�ź�
    reg [4:0] addr; //��ַ�ź�
    reg [31:0] data; //������
    wire [31:0] data_wire;
    assign data_wire=data;
    ram2 ram2_inst (
        .clk(clk),
        .ena(ena),
        .wena(wena),
        .addr(addr),
        .data(data_wire)
    );
    initial begin
        clk = 1;
        ena = 0;
        wena = 0;
        addr = 0;
        #10
        ena = 1;
        wena = 1;
        addr = 0;
        data = 32'h12345678;
        #10
        wena = 0;
        addr = 1;
        #10
        wena = 1;
        addr = 1;
        data = 32'h87654321;
        #10
        wena = 0;
        addr = 2;
        #10
        wena = 1;
        addr = 2;
        data = 32'h24680135;
        #10
        wena = 0;
        addr = 3;
        #10
        wena = 1;
        addr = 3;
        data = 32'h76543210;
        #10
        $finish;
    end
    always #5 clk = ~clk;
endmodule