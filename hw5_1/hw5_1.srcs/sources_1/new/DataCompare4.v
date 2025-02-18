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