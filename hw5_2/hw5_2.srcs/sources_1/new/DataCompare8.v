`timescale 1ns / 1ps
module DataCompare4(input [3:0] iData_a, input [3:0] iData_b, input [2:0]iData,output [2:0]oData);
reg [2:0]oData_r;
always @(*) begin
    if(iData_a[3]&~iData_b[3]) begin oData_r[2:0]=3'b100;end
    else if(iData_a[3]<iData_b[3]) begin  oData_r[2:0]=3'b010;end
    else if(iData_a[2]>iData_b[2]) begin oData_r[2:0]=3'b100;end
    else if(iData_a[2]<iData_b[2]) begin oData_r[2:0]=3'b010;end
    else if(iData_a[1]>iData_b[1]) begin  oData_r[2:0]=3'b100;end
    else if(iData_a[1]<iData_b[1]) begin oData_r[2:0]=3'b010;end
    else if(iData_a[0]>iData_b[0]) begin oData_r[2:0]=3'b100;end
    else if(iData_a[0]<iData_b[0]) begin oData_r[2:0]=3'b010;end
    else  oData_r=iData;
end
assign oData=oData_r;


endmodule 
module DataCompare8(
    input [7:0] iData_a,
    input [7:0] iData_b,
    output [2:0] oData
    );
    wire [2:0] oData_r;
    reg [2:0] src0=3'b001;

    DataCompare4 dcmp4_0(.iData_a(iData_a[3:0]),.iData_b(iData_b[3:0]),.iData(src0),.oData(oData_r[2:0]));
    DataCompare4 dcmp4_1(.iData_a(iData_a[7:4]),.iData_b(iData_b[7:4]),.iData(oData_r[2:0]),.oData(oData));
    
endmodule