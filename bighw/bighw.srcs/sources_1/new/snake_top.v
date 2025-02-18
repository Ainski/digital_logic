module snake_top (
    input wire clk,   //100Mhzʱ��
    input wire rst,   //��λ��
    input wire [0:4] key,   //�����尴��
    input wire PS2C,PS2D,   //PS/2Э��
    output wire [0:7] led,   //LED��
    output wire hsync,vsync,  //VGA�кͳ��ź�
    output wire [3:0] red,green,blue,  //�������
    output wire [0:7] seg_cs,seg_data0   //�������ʾģ��
);

    wire clk25,clr,vidon;
    wire [9:0] hc,vc;    //��ǰ�кͳ���ֵ
    wire [2:0] key_out,kb_out;  //�����������룬key_out�ǿ������ϵİ�����kb_out�Ǽ����ϵİ���
    wire [6:0] score;   //�÷�
    wire [0:127] M;   //����"��Ϸ����"�ַ�����
    wire [0:159] M1;  //����"��ѡ���Ѷ�"�ַ�����
    wire [4:0] rom_addr;   //Ѱλָ��

    assign clr = rst;   //��clr������rst

    clkdiv U1(.clk(clk),    //ʱ��ģ�飬����25MHz��Ƶ��������Ļ��ˢ��
              .clk25(clk25));
    
    vga U2(.clk25(clk25),   //vga�ź����ģ��
           .hsync(hsync),
           .vsync(vsync),
           .hc(hc),
           .vc(vc),
           .vidon(vidon));
           
    snake U3(.clk(clk),    //�ߵĺ����߼�����ģ��
            .vidon(vidon),
            .clr(clr),
            .hc(hc),
            .vc(vc),
            .M(M),
            .M1(M1),
            .rom_addr(rom_addr),
            .key_out(key_out),
            .kb_out(kb_out),
            .score(score),
            .led(led),
            .red(red),
            .green(green),
            .blue(blue));

    keyin U4(.clk(clk),    //�����尴������ģ��
            .key(key),
            .key_out(key_out));

    keyboard U5(.clk(clk),    //���̰�������ģ��
            .clr(clr),
            .PS2C(PS2C),
            .PS2D(PS2D),
            .kb_out(kb_out));

    scoring U6(.clk(clk),   //�������ʾ�÷�ģ��
            .score(score),
            .seg_cs(seg_cs),
            .seg_data0(seg_data0));

    word U7(.rom_addr(rom_addr),   //����"��Ϸ����"ģ��
            .M(M));

    word1 U8(.rom_addr(rom_addr),    //����"��ѡ���Ѷ�"ģ��
            .M1(M1));

endmodule