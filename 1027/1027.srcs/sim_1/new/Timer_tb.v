`timescale 1ps/1ps
module Timer_tb;

reg clk;
reg key;
wire led;

Timer timer(.clk(clk),.key(key),.led(led));
initial begin
    clk = 0;
    forever begin
        #10 clk = ~clk;
    end
end

initial begin
    key = 0;
    #100 key = 1;
    #100 key = 0;
    #300 key = 1;
    #300 key = 0;
    #300 key = 0;
    $finish;
end

endmodule