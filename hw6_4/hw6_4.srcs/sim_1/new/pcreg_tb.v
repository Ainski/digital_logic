`timescale 1ns/1ps

module pcreg_tb;
    reg clk ;
    reg rst;
    reg ena;
    reg [31:0] data_in;
    wire [31:0] data_out;

    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end
    initial begin
        rst = 1;
        #10 rst = 0;
        #10 rst = 0;
        #10 rst = 0;
        #10 rst=1;
        
        #100 rst =0;
        
    end 
    initial begin
        ena =1;
        # 50 ena =0;

    end
    initial begin
        data_in = 0;
        #10 data_in=8'b10101010;
        #10 data_in=8'b01010101;
        #10 data_in=8'b11111111;
        #10 data_in=8'b00000000;
        #10 data_in=8'b10101010;
    end 

    pcreg pcreg_inst(
       .clk(clk),
       .rst(rst),
       .ena(ena),
       .data_in(data_in),
       .data_out(data_out)
    );

endmodule