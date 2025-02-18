module keyin (
    input wire clk,
    input wire [7:0] key,
    output reg [2:0] key_out
);

    parameter xd = 21'd2000000;   //20ms

    reg [0:20] cnt_xd = 0;    //������ʱ


    always@(posedge clk) begin    //������ʱ
    if(key == 5'b00000)    //���������¿�ʼ
        cnt_xd <= 0;
    else if(cnt_xd == xd)
        cnt_xd <= xd;
    else
        cnt_xd <= cnt_xd + 1;
    end

    always@(posedge clk) begin
    if(cnt_xd == 0)
        key_out <= 0;
    else if(cnt_xd == (xd - 21'b1))    //����1��ʱ�䵥λ�İ����ź�
        case(key)     //���ݼ���õ���Ӧ��ֵ
        5'b10000: key_out <= 1;    //��
        5'b01000: key_out <= 2;    //��
        5'b00010: key_out <= 3;    //��
        5'b00001: key_out <= 4;    //��
        5'b00100: key_out <= 5;    //��ͣ�����¿�ʼ��Ϸ
        endcase
    else
       key_out <= 0;   //0��ʾ�ް�������
    end

endmodule