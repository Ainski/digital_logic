`timescale 1ns / 1ps
module ram2 (
 input clk, //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
 input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
 input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч����ena ͬʱ��Чʱ�ſɶԴ洢�����ж�д
 input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
 inout [31:0] data //�洢�������ߣ��ɴ���洢��������д������ݡ�д��������� clk ������ʱ��д��
);

    reg [31:0] ram [0:31]; //�洢���Ĵ洢��Ԫ���� 16 ����ÿ����Ԫ 32 λ
    initial begin //��ʼ���洢������
        $readmemh("C:\\Users\\86182\\Downloads\\input10.txt", ram); //���ļ� ram.txt ��ȡ�洢�����ݵ� ram ������
    end

    reg [31:0] data_reg; //�洢�����������ݵ��ݴ���������ͬ�����
	wire data_wire; //��������ߣ��� data_reg ͬ�����
	assign data_wire=data_reg;
	assign data_wire=data;
    always @(posedge clk) //ʱ�������ش���
	begin
    	if (ena) //��� ena ��Ч�������д洢��
    	begin
    	    if (wena) //��� wena ��Ч����д������
        	begin
        	    ram[addr] <= data_reg; //д�����ݵ�ָ����ַ
        	end
        	else //�����ȡ����
        	begin
        	    data_reg <= ram[addr]; //��ָ����ַ��ȡ����
        	end
    	end
    	else //������� z
    	begin
    	    data_reg <= 32'bz; //��� 0
    	end
	end

endmodule