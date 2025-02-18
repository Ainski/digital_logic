module snake_top (
    input wire clk,   //100Mhz时钟
    input wire rst,   //复位键
    input wire [0:4] key,   //开发板按键
    input wire PS2C,PS2D,   //PS/2协议
    output wire [0:7] led,   //LED灯
    output wire hsync,vsync,  //VGA行和场信号
    output wire [3:0] red,green,blue,  //输出像素
    output wire [0:7] seg_cs,seg_data0   //数码管显示模块
);

    wire clk25,clr,vidon;
    wire [9:0] hc,vc;    //当前行和场的值
    wire [2:0] key_out,kb_out;  //两个按键输入，key_out是开发板上的按键，kb_out是键盘上的按键
    wire [6:0] score;   //得分
    wire [0:127] M;   //保存"游戏结束"字符内容
    wire [0:159] M1;  //保存"请选择难度"字符内容
    wire [4:0] rom_addr;   //寻位指针

    assign clr = rst;   //用clr来代替rst

    clkdiv U1(.clk(clk),    //时钟模块，参数25MHz分频，用于屏幕的刷新
              .clk25(clk25));
    
    vga U2(.clk25(clk25),   //vga信号输出模块
           .hsync(hsync),
           .vsync(vsync),
           .hc(hc),
           .vc(vc),
           .vidon(vidon));
           
    snake U3(.clk(clk),    //蛇的核心逻辑部分模块
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

    keyin U4(.clk(clk),    //开发板按键输入模块
            .key(key),
            .key_out(key_out));

    keyboard U5(.clk(clk),    //键盘按键输入模块
            .clr(clr),
            .PS2C(PS2C),
            .PS2D(PS2D),
            .kb_out(kb_out));

    scoring U6(.clk(clk),   //数码管显示得分模块
            .score(score),
            .seg_cs(seg_cs),
            .seg_data0(seg_data0));

    word U7(.rom_addr(rom_addr),   //保存"游戏结束"模块
            .M(M));

    word1 U8(.rom_addr(rom_addr),    //保存"请选择难度"模块
            .M1(M1));

endmodule