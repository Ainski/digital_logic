module scoring (
    input wire clk,
    input wire clr,
    input wire [6:0] score,
    output reg [0:7] seg_cs,   //数码管位选
    output reg [0:7] seg_data0    //前四个数码管
);
    
    reg [1:0] cnt_wz = 0; //数码管状态
    reg [0:17] cnt_500Hz;   //500Hz扫描
    reg [0:3] num; //中间变量
    reg DIR2 = 0;

    always@(posedge clk) begin   //数码管扫描计时
    if(cnt_500Hz >= 18'd200000)  //500Hz
    begin
        cnt_500Hz <= 0;
        DIR2 <= 1'b1;   //产生一个上升沿
    end
    else
    begin
        cnt_500Hz <= cnt_500Hz +1;
        DIR2 <= 1'b0;
    end   
    end

    always @(posedge DIR2) begin
    if(cnt_wz == 2'd2)
        cnt_wz <= 0;
    else
        cnt_wz <= cnt_wz + 1;
    end

    always @(posedge clk) begin
    case (cnt_wz)
        2'd0 : begin  num = score / 100; seg_cs <= 8'b10000000; end   //百位
        2'd1 : begin  num = (score / 10) % 10; seg_cs <= 8'b01000000; end   //十位
        2'd2 : begin  num = score % 10; seg_cs <= 8'b00100000; end   //个位
        default: begin num <= 0; seg_cs <= 8'b00000000; end
    endcase
    end

    always @(posedge clk) begin
    case (num)   //根据num的值去输出相应的段码
        4'd0: seg_data0 <= 8'b11111100;
        4'd1: seg_data0 <= 8'b01100000;
        4'd2: seg_data0 <= 8'b11011010;
        4'd3: seg_data0 <= 8'b11110010;
        4'd4: seg_data0 <= 8'b01100110;
        4'd5: seg_data0 <= 8'b10110110;
        4'd6: seg_data0 <= 8'b10111110;
        4'd7: seg_data0 <= 8'b11100000;
        4'd8: seg_data0 <= 8'b11111110;
        4'd9: seg_data0 <= 8'b11110110;
        default: seg_data0 <= 8'b00000000;
    endcase
    end

endmodule