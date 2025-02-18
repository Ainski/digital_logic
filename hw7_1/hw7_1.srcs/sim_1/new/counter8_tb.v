`timescale 1ns/1ps
module Counter8_tb;
reg CLK,rst_n;
wire [2:0]oQ;
wire [6:0]oDisplay;


initial begin
    CLK = 0;
    forever #5 CLK = ~CLK;
end

initial begin
    rst_n = 0;
    #10 rst_n = 1;
    #10 rst_n = 0;
    #10 rst_n = 1;
end

Counter8 dut(
    .CLK(CLK),
    .rst_n(rst_n),
    .oQ(oQ),
    .oDisplay(oDisplay)
);

endmodule