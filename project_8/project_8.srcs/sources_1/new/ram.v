`timescale 1ps/1ps

module ram (
    input clk, //存储器时钟信号，上升沿时向 ram 内部写入数据
    input ena, //存储器有效信号，高电平时存储器才运行，否则输出 z
    input wena, //存储器读写有效信号，高电平为写有效，低电平为读有效，与 ena同时有效时才可对存储器进行读写
    input [4:0] addr, //输入地址，指定数据读写的地址
    input [31:0] data_in, //存储器写入的数据，在 clk 上升沿时被写入
    output [31:0] data_out //存储器读出的数据
);

    reg [31:0] ram [0:31]; //存储器的存储单元，32个 32位寄存器
    initial begin //初始化存储器内容
    $readmemh("C:\\Users\\86182\\Downloads\\input10.txt", ram); //从文件 ram.txt 读取存储器内容到 ram 数组中
    end

    reg [31:0] data_out_reg; //存储器读出的数据的暂存器，用于同步输出
    assign data_out = data_out_reg; //输出同步的读出数据
    always @ (posedge clk) begin
        if (ena) begin
            if (wena) begin
                ram[addr] <= data_in; //写入数据
                data_out_reg<= data_in; //读出数据
            end
            else begin
                data_out_reg <= ram[addr]; //读出数据
            end 

        end
        else begin
            data_out_reg <= 32'bz; //输出 z
        end
    end
    
endmodule