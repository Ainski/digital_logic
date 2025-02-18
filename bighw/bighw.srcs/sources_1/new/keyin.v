module keyin (
    input wire clk,
    input wire [7:0] key,
    output reg [2:0] key_out
);

    parameter xd = 21'd2000000;   //20ms

    reg [0:20] cnt_xd = 0;    //消抖计时


    always@(posedge clk) begin    //消抖计时
    if(key == 5'b00000)    //抖动即重新开始
        cnt_xd <= 0;
    else if(cnt_xd == xd)
        cnt_xd <= xd;
    else
        cnt_xd <= cnt_xd + 1;
    end

    always@(posedge clk) begin
    if(cnt_xd == 0)
        key_out <= 0;
    else if(cnt_xd == (xd - 21'b1))    //产生1个时间单位的按键信号
        case(key)     //根据键入得到对应的值
        5'b10000: key_out <= 1;    //右
        5'b01000: key_out <= 2;    //下
        5'b00010: key_out <= 3;    //左
        5'b00001: key_out <= 4;    //上
        5'b00100: key_out <= 5;    //暂停或重新开始游戏
        endcase
    else
       key_out <= 0;   //0表示无按键按下
    end

endmodule