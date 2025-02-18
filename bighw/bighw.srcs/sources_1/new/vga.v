//640*480
module vga (
    input wire clk25,
    output reg hsync,
    output reg vsync,
    output reg [9:0] hc,
    output reg [9:0] vc,
    output reg vidon
);

//    //-----------------------------------------------------------// 
//// ˮƽɨ��������趨1024*768 60Hz VGA 
////-----------------------------------------------------------// 
//parameter LinePeriod =1344; //�������� 
//parameter H_SyncPulse=136; //��ͬ�����壨Sync a�� 
//parameter H_BackPorch=160; //��ʾ���أ�Back porch b�� 
//parameter H_ActivePix=1024; //��ʾʱ��Σ�Display interval c�� 
//parameter H_FrontPorch=24; //��ʾǰ�أ�Front porch d�� 
//parameter Hde_start=296; parameter Hde_end=1320; 
 
////-----------------------------------------------------------// 
//// ��ֱɨ��������趨1024*768 60Hz VGA 
////-----------------------------------------------------------// 
 
//parameter FramePeriod =806; //�������� 
//parameter V_SyncPulse=6; //��ͬ�����壨Sync o��
//parameter V_BackPorch=29; //��ʾ���أ�Back porch p�� 
//parameter V_ActivePix=768; //��ʾʱ��Σ�Display interval q�� 
//parameter V_FrontPorch=3; //��ʾǰ�أ�Front porch r�� 
//parameter Vde_start=35;
//parameter Vde_end=803;

    parameter hpixels = 10'b1100100000;    //�����ص㣬800
    parameter vlines = 10'b1000001001;    //������521
    parameter hbp = 10'b0010010000;       //����ʾ���أ�144��128+16��
    parameter hfp = 10'b1100010000;       //����ʾǰ��784��128+16+640��
    parameter vbp = 10'b0000011111;       //����ʾ���ӣ�31��2+29��
    parameter vfp = 10'b0111111111;       //����ʾǰ�أ�511��2+29+480��
    
    reg vsenable;

    always @(posedge clk25) begin
    if(hc == hpixels - 1)
    begin
        hc <= 0;
        vsenable <= 1;
    end
    else
    begin
        hc <= hc +1;
        vsenable <= 0;
    end 
    end

    always @(*) begin
    if(hc < 96)  //ͬ��Ϊ96
        hsync = 0;
    else
        hsync = 1;
    end

    always @(posedge clk25) begin
    if(vsenable == 1)
    begin
        if(vc == vlines - 1)
            vc <= 0;
        else
            vc <= vc + 1;
    end
    else
        vc <= vc;   
    end

    always @(*) begin
    if(vc < 2)   //ͬ��Ϊ2
        vsync = 0;
    else
        vsync = 1;
    end

    always @(*) begin
    if((hc < hfp)&&(hc >= hbp)&&(vc < vfp)&&(vc >= vbp))
        vidon = 1;
    else
        vidon = 0;
    end
endmodule