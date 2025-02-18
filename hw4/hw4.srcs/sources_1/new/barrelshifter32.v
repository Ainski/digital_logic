`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/12 15:49:20
// Design Name: 
// Module Name: barrelshifter32
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module barrelshifter32(
    input [31:0] a,
    input [4:0] b,
    input [1:0] aluc,
    output reg [31:0] c
    );
    
    reg [31:0]t1=32'b00000000000000000000000000000000;
    reg [31:0]t2=32'b00000000000000000000000000000000;
    reg [31:0]t3=32'b00000000000000000000000000000000;
    reg [31:0]t4=32'b00000000000000000000000000000000;
    reg [31:0]t5=32'b00000000000000000000000000000000;
    
    always @ (b,aluc)
    begin
        case(b[4])
            1'b1:
            begin
                case(aluc)
                 2'b00: begin t1={{(31){a[31]}},a}>>5'b10000; end
                 2'b10: begin t1=a>>5'b10000; end
                 default: begin t1=a<<5'b10000; end
                endcase
            end
            1'b0: begin t1=a; end
        endcase
        case(b[3])
            1'b1:
            begin
                case(aluc)
                 2'b00: begin t2={{(31){t1[31]}},t1}>>4'b1000; end
                 2'b10: begin t2=t1>>4'b1000; end
                 2'b11: begin t2=t1<<4'b1000; end
                 2'b01: begin t2=t1<<4'b1000; end
                endcase
            end
            1'b0: begin t2=t1; end
        endcase
        case(b[2])
            1'b1:
            begin
                case(aluc)
                 2'b00: begin t3={{(31){t2[31]}},t2}>>3'b100; end
                 2'b10: begin t3=t2>>3'b100; end
                 2'b11: begin t3=t2<<3'b100; end
                 2'b01: begin t3=t2<<3'b100; end
                endcase
            end
            1'b0: begin t3=t2; end
        endcase
        case(b[1])
            1'b1:
            begin
                case(aluc)
                 2'b00: begin t4={{(31){t3[31]}},t3}>>2'b10; end
                 2'b10: begin t4=t3>>2'b10; end
                 2'b11: begin t4=t3<<2'b10; end
                 2'b01: begin t4=t3<<2'b10; end
                endcase
            end
            1'b0: begin t4=t3; end
        endcase
        case(b[0])
            1'b1:
            begin
                case(aluc)
                 2'b00: begin t5={{(31){t4[31]}},t4}>>1'b1; end
                 2'b10: begin t5=t4>>1'b1; end
                 2'b11: begin t5=t4<<1'b1; end
                 2'b01: begin t5=t4<<1'b1; end
                endcase
            end
            1'b0: begin t5=t4; end
        endcase
        c=t5;
    end
endmodule
