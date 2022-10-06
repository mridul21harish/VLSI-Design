`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:25:45 10/26/2020 
// Design Name: 
// Module Name:    imadeadd 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module imageadd(clk, data1, data2, reset, out1, out2, out3);

input clk;
input reset;
input [7:0] data1;
input [7:0] data2;

output [7:0] out1;
output [7:0] out2;
output [7:0] out3;
reg mode = 1'b1;

reg [5:0] addr;

reg [5:0] addr3;

blk_mem2 b1(clk, 1'b0, addr, data1, out1); 
blk_mem2 b2(clk, 1'b0, addr, data2, out2);

blk_mem2 b3(clk, 1'b1, addr3, out1 + out2, out3);
  
always@(posedge clk)
begin
	if(reset == 0)
		addr = 6'b0;
	else
		addr = addr + 1;
end 

always @(posedge clk)

begin
	if (mode==1'b1)
		addr3 = addr-1;
	else
		addr3 = addr;
end

endmodule

