`timescale 1ps/1ps
module Timer(
    input clk,
    input key,
    output led
);

reg [31:0] timecount;
initial timecount = 0;
reg led_r;
always @(posedge clk) begin
    if(key) begin
        led_r = 0;
        timecount <= timecount + 1;
    end
    else begin
        if(timecount > 0) begin
            led_r = 1;
            timecount <= timecount-1;
        end
        else
        begin
            led_r = 0;
        end
    end
end
assign led =led_r;
endmodule