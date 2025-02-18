`timescale 1ps/1ps
module ram_tb;
    reg clk; //ʱ���ź�
    reg ena; //��Ч�ź�
    reg wena; //��д��Ч�ź�
    reg [4:0] addr; //��ַ�ź�
    reg [31:0] data_in; //д�������ź�
    wire [31:0] data_out; //���������ź�
    
    ram ram_instance (
       .clk(clk),
       .ena(ena),
       .wena(wena),
       .addr(addr),
       .data_in(data_in),
       .data_out(data_out)
    );
    
    initial begin
        clk = 0; //��ʼ��ʱ���ź�
        ena = 0; //��ʼ����Ч�ź�
        wena = 0; //��ʼ����д��Ч�ź�
        addr = 0; //��ʼ����ַ�ź�
        data_in = 0; //��ʼ��д�������ź�
        #10 
        ena = 1; //ʹ�ܴ洢��
        wena = 1; //ʹ�ܶ�д
        addr = 0; //���õ�ַ
        data_in = 32'h12345678; //д������
        #10 
        wena = 0; //��ֹ��д
        addr = 0; //���õ�ַ
        #10 
        addr = 0; //���õ�ַ
        #10 
        addr = 1; //���õ�ַ
        #10 
        addr = 2; //���õ�ַ
        #10 
        addr = 3; //���õ�ַ
        #10 
        addr = 4; //���õ�ַ
        #10 
        addr = 5; //���õ�ַ
        #10 
        addr = 6; //���õ�ַ
        #10 
        addr = 7; //���õ�ַ
        #10 
        addr = 8; //���õ�ַ
        #10 
        addr = 9; //���õ�ַ
        #10 
        addr = 10; //���õ�ַ
        #10 
        addr = 11; //���õ�ַ
        #10 
        addr = 12; //���õ�ַ
        #10 
        addr = 13; //���õ�ַ
        #10 
        addr = 14; //���õ�ַ
        #10 
        addr = 15; //���õ�ַ
        #10 
        addr = 16; //���õ�ַ
        #10 
        addr = 17; //���õ�ַ
        #10 
        addr = 18; //���õ�ַ
        #10 
        addr = 19; //���õ�ַ
        #10 
        addr = 20; //���õ�ַ
        #10 
        addr = 21; //���õ�ַ
        #10 
        addr = 22; //���õ�ַ
        #10 
        addr = 23; //���õ�ַ
        #10 
        addr = 24; //���õ�ַ
        #10 
        addr = 25; //���õ�ַ
        #10 
        addr = 26; //���õ�ַ
        #10 
        addr = 27; //���õ�ַ
        #10 
        addr = 28; //���õ�ַ
        #10 
        addr = 29; //���õ�ַ
        #10 
        addr = 30; //���õ�ַ
        #10 
        addr = 31; //���õ�ַ
        #10 
        $finish;
    end
    
    always #5 clk = ~clk; //ʱ���źŵı仯
endmodule