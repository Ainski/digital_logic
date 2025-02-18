module snake(
    input wire clk,
    input wire vidon,
    input wire clr,
    input wire [9:0] hc,
    input wire [9:0] vc,
    input wire [2:0] key_out,
    input wire [2:0] kb_out,
    input wire [0:127] M,
    input wire [0:159] M1,
    output reg [0:7] led,
    output reg [3:0] red,green,blue,
    output reg [6:0] score,
    output reg [4:0] rom_addr
);

    parameter hbp = 10'b0010010000;       //����ʾ���أ�144��128+16��
    parameter vbp = 10'b0000011111;       //����ʾ���ӣ�31��2+29��
    parameter h_begin = 100;   //��λ�ó�ʼ��������
    parameter v_begin = 300;   //��λ�ó�ʼ��������
    parameter h_diff = 100;    //�Ѷ�ѡ��ɫ��������
    parameter v_diff = 240;    //�Ѷ�ѡ��ɫ�鳡����
    parameter h_lose = 256;   //��Ϸʧ�ܱ���������
    parameter v_lose = 224;   //��Ϸʧ�ܱ��ﳡ����
    parameter h_start = 240;  //��Ϸ��ʼ����������������
    parameter v_start = 134;  //��Ϸ��ʼ���������峡����
    parameter pass_diff = 200;   //�Ѷ�ɫ����
    parameter length = 20;   //����ÿһ���С����Ϊ�����Σ�

    reg [0:25] cnt_js = 0;   //�˶���ʱ
    reg [0:23] speed;     //�ߵ��ٶȣ�ֵԽС�ٶ�Խ��
    reg [99:0] h_all = 0;   //�������е������꣨ʮ�Σ�
    reg [99:0] v_all = 0;   //�������еĳ����꣨ʮ�Σ�
    reg [2:0] state = 0;    //��Ϸ״̬
    reg [3:0] num = 4'd4;   //�����ȣ���ʼΪ4
    reg [4:0] rand_x,rand_y;   //��������кͳ�ֵ
    reg [9:0] food_x = 10'd300; //ʳ�������꣬��ʼ��Ϊ300
    reg [9:0] food_y = 10'd200; //ʳ�ﳡ�������꣬��ʼ��Ϊ200
    reg [7:0] rom_pix;    //������ʾ��λ��ָ��
    reg [1:0] color = 0;   //������ʾ����ɫ
    reg [1:0] pos;    //����ϵ��
    reg [1:0] diff;   //�Ѷ�ϵ��
    reg [1:0] cs = 0; //�����޸��޷�����ĳ�һ�γ������bug 
    reg eat = 0;   //��û�гٵ�
    reg DIR = 0;   //��Ƶ����Ϊ1��������ˢ��
    reg foodflag = 1;   //�Ƿ���Ҫˢ��ʳ��
    reg isbody = 0;    //��ǰˢ�²�λ�Ƿ�Ϊ�ߵ�����
    reg isfood = 0;    //��ǰˢ�²�λ�Ƿ�Ϊʳ��
    reg ishit = 0;    //���Ƿ�ײ�����º���ǽ��������
    reg ishit1 = 0;   //���Ƿ�ײ���������ǽ��������
    reg isword = 0;   //��ǰˢ�²�λ�Ƿ�Ϊ����
    reg R,G,B;        //��������ˢ�µ�����ɫ
    
    always @(*) begin   //�жϵ�ǰˢ������λ���Ƿ�Ϊ��������Ѷ�ɫ�飬�����ж����num���ڼ��ǳ���Ҫ
    if((hc >= h_diff + hbp)&&(hc < hbp + h_diff + length)&&(vc >= v_diff + vbp)&&(vc < v_diff +vbp + length)&&(state == 0))
        begin isbody <= 1; color <= 1; end
    else if((hc >= h_diff + pass_diff + hbp)&&(hc < hbp + h_diff + pass_diff + length)&&(vc >= v_diff + vbp)&&(vc < v_diff +vbp + length)&&(state == 0))
        begin isbody <= 1; color <= 2; end
    else if((hc >= h_diff + pass_diff*2 + hbp)&&(hc < hbp + h_diff + pass_diff*2 + length)&&(vc >= v_diff + vbp)&&(vc < v_diff +vbp + length)&&(state == 0))
        begin isbody <= 1; color <= 3; end
    else if((hc >= h_all[9:0] + hbp)&&(hc < h_all[9:0] + hbp + length)&&(vc >= v_all[9:0] + vbp)&&(vc < v_all[9:0] + vbp + length)&&(state != 0))
        begin isbody <= 1; color <= 0; end
    else if((hc >= h_all[19:10] + hbp)&&(hc < h_all[19:10] + hbp + length)&&(vc >= v_all[19:10] + vbp)&&(vc < v_all[19:10] + vbp + length)&&(num >= 2)&&(state != 0))
        begin isbody <= 1; color <= 2; end
    else if((hc >= h_all[29:20] + hbp)&&(hc < h_all[29:20] + hbp + length)&&(vc >= v_all[29:20] + vbp)&&(vc < v_all[29:20] + vbp + length)&&(num >= 3)&&(state != 0))
        begin isbody <= 1; color <= 3; end
    else if((hc >= h_all[39:30] + hbp)&&(hc < h_all[39:30] + hbp + length)&&(vc >= v_all[39:30] + vbp)&&(vc < v_all[39:30] + vbp + length)&&(num >= 4)&&(state != 0))
        begin isbody <= 1; color <= 0; end
    else if((hc >= h_all[49:40] + hbp)&&(hc < h_all[49:40] + hbp + length)&&(vc >= v_all[49:40] + vbp)&&(vc < v_all[49:40] + vbp + length)&&(num >= 5)&&(state != 0))
        begin isbody <= 1; color <= 2; end
    else if((hc >= h_all[59:50] + hbp)&&(hc < h_all[59:50] + hbp + length)&&(vc >= v_all[59:50] + vbp)&&(vc < v_all[59:50] + vbp + length)&&(num >= 6)&&(state != 0))
        begin isbody <= 1; color <= 3; end
    else if((hc >= h_all[69:60] + hbp)&&(hc < h_all[69:60] + hbp + length)&&(vc >= v_all[69:60] + vbp)&&(vc < v_all[69:60] + vbp + length)&&(num >= 7)&&(state != 0))
        begin isbody <= 1; color <= 0; end
    else if((hc >= h_all[79:70] + hbp)&&(hc < h_all[79:70] + hbp + length)&&(vc >= v_all[79:70] + vbp)&&(vc < v_all[79:70] + vbp + length)&&(num >= 8)&&(state != 0))
        begin isbody <= 1; color <= 2; end
    else if((hc >= h_all[89:80] + hbp)&&(hc < h_all[89:80] + hbp + length)&&(vc >= v_all[89:80] + vbp)&&(vc < v_all[89:80] + vbp + length)&&(num >= 9)&&(state != 0))
        begin isbody <= 1; color <= 3; end
    else if((hc >= h_all[99:90] + hbp)&&(hc < h_all[99:90] + hbp + length)&&(vc >= v_all[99:90] + vbp)&&(vc < v_all[99:90] + vbp + length)&&(num >= 10)&&(state != 0))
        begin isbody <= 1; color <= 0; end
    else
    begin
        isbody <= 0;
        color <= color;
    end
    end
    //�ж����Ƿ�ײ�����º���ǽ�������壬�����ж����num���ڼ��ǳ���Ҫ
    always @(*) begin
    if((h_all[9:0] == h_all[19:10])&&(v_all[9:0] == v_all[19:10])&&(state == 2)&&(num >= 2))
        ishit <= 1;
    else if((h_all[9:0] == h_all[29:20])&&(v_all[9:0] == v_all[29:20])&&(state == 2)&&(num >= 3))
        ishit <= 1;
    else if((h_all[9:0] == h_all[39:30])&&(v_all[9:0] == v_all[39:30])&&(state == 2)&&(num >= 4))
        ishit <= 1;
    else if((h_all[9:0] == h_all[49:40])&&(v_all[9:0] == v_all[49:40])&&(state == 2)&&(num >= 5))
        ishit <= 1;
    else if((h_all[9:0] == h_all[59:50])&&(v_all[9:0] == v_all[59:50])&&(state == 2)&&(num >= 6))
        ishit <= 1;
    else if((h_all[9:0] == h_all[69:60])&&(v_all[9:0] == v_all[69:60])&&(state == 2)&&(num >= 7))
        ishit <= 1;
    else if((h_all[9:0] == h_all[79:70])&&(v_all[9:0] == v_all[79:70])&&(state == 2)&&(num >= 8))
        ishit <= 1;
    else if((h_all[9:0] == h_all[89:80])&&(v_all[9:0] == v_all[89:80])&&(state == 2)&&(num >= 9))
        ishit <= 1;
    else if((h_all[9:0] == h_all[99:90])&&(v_all[9:0] == v_all[99:90])&&(state == 2)&&(num >= 10))
        ishit <= 1;
    else if((h_all[9:0] > 630)||(v_all[9:0] > 470))
        ishit <= 1;
    else
        ishit <= 0;    
    end

    always @(posedge clk) begin   //������һ���������bugģ��
    if((food_x == h_all[9:0]) && (food_y == v_all[9:0])&&(state == 2))
        cs <= cs + 1;
    else if(cs == 2)
        cs <= 0;
    else
        cs <= cs;
    end
    //�������ģ��
    always @(posedge clk) begin
    if(!clr || state == 1)
        pos <= 0;   //��Ϸ��ʼ����λ��Ϊ0��������
    else if(state != 0)
        case(kb_out)
            3'd1: begin
                if(pos == 1)   //�����ʱ�������£���ִ��
                    pos <= pos;
                else 
                    pos <= 3;   //��
                end
            3'd2: begin
                if(pos == 3)   //�����ʱ�������ϣ���ִ��
                    pos <= pos;
                else 
                    pos <= 1;   //��
                end
            3'd3: begin
                if(pos == 0)   //�����ʱ�������󣬲�ִ��
                    pos <= pos;
                else
                    pos <= 2;   //��
                end
            3'd4: begin
                if(pos == 2)   //�����ʱ�������ң���ִ��
                    pos <= pos;
                else
                    pos <= 0;   //��
                end
            default: pos <= pos;
        endcase
    else
        pos <= pos;   
    end

    always @(posedge clk) begin
    if((vidon == 1)&&(state == 2))   //ֻ��״̬Ϊ2�Ż��ʱ
    begin
        if(cnt_js == speed)   //�������ٶȵ���ֵ
        begin
            DIR <= 1;    //���������ؿ�������ˢ��
            cnt_js <= 0;
        end
        else
        begin
            DIR <= 0;
            cnt_js <= cnt_js + 1; 
        end
    end
    else if(state == 0)
        cnt_js <= 0;
    else
        cnt_js <= cnt_js;   //�������Ҫ����Ҫ����Щ��дΪcnt_js <= 0
    end


    always@(posedge clk) begin    //״̬�߼�ת��ģ��
    if(!clr)   //��λ��״̬����
        state <= 0;
    else if(state == 0)
    begin
        case (key_out)  //���ݿ������ϵİ���ѡ���Ӧ���Ѷ�
            3'd1 : begin diff <= 2; state <= 1; end   //����
            3'd5 : begin diff <= 1; state <= 1; end   //�е�
            3'd3 : begin diff <= 0; state <= 1; end   //��
            default: state <= 0;
        endcase
    end
    else if(state == 1)
    begin
        state <= 2;
        case (diff)   //�����Ѷ�ȥ������Ӧ���ٶ�
            2'd0 : speed <= 24'd15000000;
            2'd1 : speed <= 24'd10000000;
            2'd2 : speed <= 24'd5000000;
            default: speed <= 24'd15000000;
        endcase        
    end
    else if(state == 3 && key_out == 5)   //��״̬3�°�S2���Խ�����һ�ֵ���Ϸ
        state <= 0;
    else if(ishit == 1 || ishit1 == 1)   //���С������������״̬3������Ϸ����״̬
        state <= 3;
    else if(state == 2 && key_out == 5)  //���������Ϸ����״̬������S2������ͣ��Ϸ
        state <= 4;
    else if(state <= 4 && key_out == 5)  //���������Ϸ��ͣ״̬������S2�����ٿ�ʼ��Ϸ
        state <= 2;
    else
        state <= state;   //����������state����
    end

    always @(*) begin    //����ͼ���ˢ��
    if((hc >= h_lose + hbp)&&(hc < hbp + h_lose + 128)&&(vc >= v_lose + vbp)&&(vc < v_lose + vbp + 32)&&(state == 3))    //��Ϸ��������
    begin
        rom_addr <= vc - v_lose - vbp;   //�õ���ʱ���ַ�����
        rom_pix <= hc - h_lose - hbp;    //�õ���ʱ���ַ�����
        isword <= 1;    //������ǰλ�������ǵ��ַ�����
    end
    else if((hc >= h_start + hbp)&&(hc < hbp + h_start + 160)&&(vc >= v_start + vbp)&&(vc < v_start + vbp + 32)&&(state == 0))   //��ѡ���Ѷ�����
    begin
        rom_addr <= vc - v_start - vbp;
        rom_pix <= hc - h_start - hbp;
        isword <= 1;
    end
    else
    begin
        rom_pix <= 0;
        rom_addr <= 0;
        isword <= 0;
    end
    end

    
    always @(posedge clk) begin   //�Ʒ�ģ��
    if(!clr || state <= 1)   //��λ������Ϸ��ʼ��ʱ���Ʒ�����
        score <= 0;
    else if(cs == 2)  //С�߳Ե�ʳ��Ʒ�+1
        score <= score + 1;
    else
        score <= score;
    end
    
    always @(posedge clk) begin  //ledģ�飬ûʵ�����ã����ڵ�ʱ���̵�debug
    case (state)
        2'd1 : led <= 8'b10000000;
        2'd2 : led <= 8'b11000000;
        2'd3 : led <= 8'b11100000;
        default: led <= 8'b11111000;
    endcase
    end

    always @(posedge clk) begin    //����ˢ��ģ��
    if(!clr || state == 1)    //��λ����Ϸ��ʼ�����������ˢ�£���ʼ����Ϊ4
    begin
        h_all[9:0] <= h_begin + length * 3;
        h_all[19:10] <= h_begin + length * 2;
        h_all[29:20] <= h_begin + length;
        h_all[39:30] <= h_begin;
        h_all[99:40] <= 60'd0;
        v_all[39:30] <= v_begin;
        v_all[29:20] <= v_begin;
        v_all[19:10] <= v_begin;
        v_all[9:0] <= v_begin;
        v_all[99:40] <= 60'd0;
    end
    else if(cs == 2)   //�Ե�ʳ���
    begin
        case (pos)   //����num�ı仯Ҫ����ͺ�Щ�������ǽ���һ��Ҫչʾ��ɫ���������ɫ�������
            2'd0: begin
                h_all[(num*10+9)-:10] <= h_all[(10*num-1)-:10] - length;   //���˶��ķ������ˢ��
                v_all[(num*10+9)-:10] <= v_all[(10*num-1)-:10];
            end
            2'd1: begin
                h_all[(num*10+9)-:10] <= h_all[(10*num-1)-:10];
                v_all[(num*10+9)-:10] <= v_all[(10*num-1)-:10] - length;
            end
            2'd2: begin
                h_all[(num*10+9)-:10] <= h_all[(10*num-1)-:10] + length;
                v_all[(num*10+9)-:10] <= v_all[(10*num-1)-:10];
            end
            2'd3: begin
                h_all[(num*10+9)-:10] <= h_all[(10*num-1)-:10];
                v_all[(num*10+9)-:10] <= v_all[(10*num-1)-:10] + length;
            end
        endcase      
    end
    else if(DIR == 1)   //DIR�����أ���ʼ�����ˢ��
    begin
        if(num >= 10)   //���ȸ���num��ֵ������ˢ�¶���ɫ��
        begin
            h_all[99:90] = h_all[89:80];
            v_all[99:90] = v_all[89:80];
        end
        if(num >= 9)
        begin
            h_all[89:80] = h_all[79:70];
            v_all[89:80] = v_all[79:70];
        end
        if(num >= 8)
        begin
            h_all[79:70] = h_all[69:60];
            v_all[79:70] = v_all[69:60];
        end
        if(num >= 7)
        begin
            h_all[69:60] = h_all[59:50];
            v_all[69:60] = v_all[59:50];
        end
        if(num >= 6)
        begin
            h_all[59:50] = h_all[49:40];
            v_all[59:50] = v_all[49:40];
        end
        if(num >= 5)
        begin
            h_all[49:40] = h_all[39:30];
            v_all[49:40] = v_all[39:30];
        end
        if(num >= 4)
        begin
            h_all[39:30] = h_all[29:20];
            v_all[39:30] = v_all[29:20];
        end
        if(num >= 3)
        begin
            h_all[29:20] = h_all[19:10];
            v_all[29:20] = v_all[19:10];
        end
        if(num >= 2)
        begin
            h_all[19:10] = h_all[9:0];
            v_all[19:10] = v_all[9:0];
        end
        case(pos)   //���ݷ�����������һʱ����ͷ��λ��
        2'd0: h_all[9:0] <= h_all[9:0] + length;
        2'd1: v_all[9:0] <= v_all[9:0] + length;
        2'd2: begin
            if(h_all[9:0] == 0)   //�����ʱ��ͷλ���б�Ե������һ��������Ե���������
                ishit1 <= 1;   //�ж�Ϊײǽ
            else
            begin   //��������½�����������ˢ��
                h_all[9:0] <= h_all[9:0] - length;
                ishit1 <= 0;
            end
        end
        2'd3: begin   //ͬ��
            if(v_all[9:0] == 0)
                ishit1 <= 1;
            else
            begin
                v_all[9:0] <= v_all[9:0] - length;
                ishit1 <= 0;
            end
        end
        endcase
    end
    else
    begin
        h_all <= h_all;
        v_all <= v_all;
        ishit1 <= 0;
    end
    end

    always @(*) begin    //�ж�ʳ���ˢ��λ���Ƿ�͵�ǰС�������ص����ص�������ˢ��λ��
    if((food_x == h_all[9:0]) && (food_y == v_all[9:0])&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[19:10]) && (food_y == v_all[19:10])&&(num >= 2)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[29:20]) && (food_y == v_all[29:20])&&(num >= 3)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[39:30]) && (food_y == v_all[39:30]) && (num >= 4)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[49:40]) && (food_y == v_all[49:40]) && (num >= 5)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[59:50]) && (food_y == v_all[59:50]) && (num >= 6)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[69:60]) && (food_y == v_all[69:60]) && (num >= 7)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[79:70]) && (food_y == v_all[79:70]) && (num >= 8)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[89:80]) && (food_y == v_all[89:80]) && (num >= 9)&&(state == 2))
        eat <= 1;
    else if((food_x == h_all[99:90]) && (food_y == v_all[99:90]) && (num >= 10)&&(state == 2))
        eat <= 1;
    else
        eat <= 0; 
    end
    
    always @(posedge clk or negedge clr) begin   //����ɳ�ģ��
    if(!clr || state == 1)   //��λ����Ϸ��ʼ�������峤����Ϊ4
        num = 4;   
    else if(cs == 2)   //�߳ٵ�ʳ��
    begin
        num = num + 1;   //���峤��+1
        if(num == 11)  
            num = 10;   //�ﵽ��󳤶Ⱥ󣬽�����
        else
            num = num;
    end
    else
        num = num;
    end
    //����Ϊ���������ģ�飬ԭ�������ü�������һֱˢ��rand_x��rand_y����ʳ��Ҫˢ��ʱȡ��ǰ��rand_x��rand_yֵ
    //��������˵��������һ��ʱ�̳ٵ�ʳ����ԾͲ����������Ч��
    //x
    always@(posedge clk or negedge clr) begin 
    if (!clr)
        rand_x <= 0;
    else
        begin
            if (rand_x == 31)
                rand_x <= 0;
            else
                rand_x <= rand_x+1;
        end    
    end
    //y
    always@(posedge clk or negedge clr) begin
    if (!clr)
        rand_y <= 0;
    else
        begin
            if (rand_y == 23 && rand_x == 31)
                rand_y <= 0;
            else if (rand_x == 31)
                rand_y <= rand_y+1;
            else
                rand_y <= rand_y;  
        end
    end

    always @(posedge clk) begin   //ʳ��ˢ��ģ��
    if(foodflag == 0)   //foodflagΪ0����ʾʳ����Ҫ����ˢ��
    begin
        food_x <= rand_x * length;   //����rand_x�õ�ʳ���������
        food_y <= rand_y * length;   //����rand_y�õ�ʳ��ĳ�����
        foodflag <= 1;   //ˢ�������1
    end
    else if(eat == 1)   //��ʳ��������ص�
        foodflag <= 0;   //���㣬��ʾ��Ҫ����ˢ��ʳ��
    else   //��������±��ֲ���
    begin
        foodflag <= foodflag;
        food_x <= food_x;
        food_y <= food_y;
    end   
    end

    always @(*) begin    //ʳ������ˢ��ģ��
    if((hc >= food_x + hbp)&&(hc < hbp + food_x + length)&&(vc >= food_y + vbp)&&(vc < food_y +vbp + length)&&(state != 0))
        isfood = 1;    //�жϵ�ǰ�����Ƿ�Ϊʳ��Ĳ��֣�����һ��������
    else
        isfood = 0;
    end

    always @(*) begin   //ͼ��ˢ��ģ��
    red = 0;   //����������������������
    blue = 0;
    green = 0;
    if(vidon == 1 && isbody == 1)   //�����ʱΪ����λ������
    begin
        case (color)   //����colorֵȥˢ�²�ͬ����ɫ
            2'd0 : begin   //��ɫ
                red = 4'b1111;
                green = 4'b1111;
                blue = 4'b1111; 
            end
            2'd1 : begin   //��ɫ
                red = 4'b0000;
                green = 4'b1111;
                blue = 4'b0000; 
            end
            2'd2 : begin   //��ɫ
                red = 4'b0000;
                green = 4'b0000;
                blue = 4'b1111; 
            end
            2'd3 : begin   //��ɫ
                red = 4'b1111;
                green = 4'b0000;
                blue = 4'b0000; 
            end
            default: begin
                red = 4'b00001;
                green = 4'b0000;
                blue = 4'b0000; 
            end
        endcase
    end
    else if(vidon && isfood == 1)   //�����ʱΪʳ��λ������
    begin
        red = 4'b0000;
        green = 4'b1111;   //ʳ��Ϊ��ɫ
        blue = 4'b0000;
    end
    else if(vidon == 1 && isword == 1)   ////�����ʱΪ����λ������
    begin
        if(state == 3)   //״̬3������Ϊ"��Ϸ����"��������M�Ĵ�����
        begin
            R = M[rom_pix];
            G = M[rom_pix];
            B = M[rom_pix];
            red = {R,R,R,R};
            green = {G,G,G,G};
            blue = {B,B,B,B};
        end 
        else  //״̬0������Ϊ"��ѡ���Ѷ�"��������M1�Ĵ�����
        begin
            R = M1[rom_pix];
            G = M1[rom_pix];
            B = M1[rom_pix];
            red = {R,R,R,R};
            green = {G,G,G,G};
            blue = {B,B,B,B};
        end
    end
    end

endmodule