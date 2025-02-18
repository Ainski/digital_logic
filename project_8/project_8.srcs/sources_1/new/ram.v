`timescale 1ps/1ps

module ram (
    input clk, //�洢��ʱ���źţ�������ʱ�� ram �ڲ�д������
    input ena, //�洢����Ч�źţ��ߵ�ƽʱ�洢�������У�������� z
    input wena, //�洢����д��Ч�źţ��ߵ�ƽΪд��Ч���͵�ƽΪ����Ч���� enaͬʱ��Чʱ�ſɶԴ洢�����ж�д
    input [4:0] addr, //�����ַ��ָ�����ݶ�д�ĵ�ַ
    input [31:0] data_in, //�洢��д������ݣ��� clk ������ʱ��д��
    output [31:0] data_out //�洢������������
);

    reg [31:0] ram [0:31]; //�洢���Ĵ洢��Ԫ��32�� 32λ�Ĵ���
    initial begin //��ʼ���洢������
    $readmemh("C:\\Users\\86182\\Downloads\\input10.txt", ram); //���ļ� ram.txt ��ȡ�洢�����ݵ� ram ������
    end

    reg [31:0] data_out_reg; //�洢�����������ݵ��ݴ���������ͬ�����
    assign data_out = data_out_reg; //���ͬ���Ķ�������
    always @ (posedge clk) begin
        if (ena) begin
            if (wena) begin
                ram[addr] <= data_in; //д������
                data_out_reg<= data_in; //��������
            end
            else begin
                data_out_reg <= ram[addr]; //��������
            end 

        end
        else begin
            data_out_reg <= 32'bz; //��� z
        end
    end
    
endmodule