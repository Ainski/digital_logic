`timescale 1ns / 1ps
module ram2 (
 input clk, //存储器时钟信号，上升沿时向 ram 内部写入数据
 input ena, //存储器有效信号，高电平时存储器才运行，否则输出 z
 input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与ena 同时有效时才可对存储器进行读写
 input [4:0] addr, //输入地址，指定数据读写的地址
 inout [31:0] data //存储器数据线，可传输存储器读出或写入的数据。写入的数据在 clk 上升沿时被写入
);

    reg [31:0] ram [0:31]; //存储器的存储单元，共 16 个，每个单元 32 位
    initial begin //初始化存储器内容
        $readmemh("C:\\Users\\86182\\Downloads\\input10.txt", ram); //从文件 ram.txt 读取存储器内容到 ram 数组中
    end

    reg [31:0] data_reg; //存储器读出的数据的暂存器，用于同步输出
	wire data_wire; //输出数据线，与 data_reg 同步输出
	assign data_wire=data_reg;
	assign data_wire=data;
    always @(posedge clk) //时钟上升沿触发
	begin
    	if (ena) //如果 ena 有效，则运行存储器
    	begin
    	    if (wena) //如果 wena 有效，则写入数据
        	begin
        	    ram[addr] <= data_reg; //写入数据到指定地址
        	end
        	else //否则读取数据
        	begin
        	    data_reg <= ram[addr]; //从指定地址读取数据
        	end
    	end
    	else //否则输出 z
    	begin
    	    data_reg <= 32'bz; //输出 0
    	end
	end

endmodule