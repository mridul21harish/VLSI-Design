`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:23 10/16/2020 
// Design Name: 
// Module Name:    fulladder 
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
module fulladder(
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
    );
	 
	wire w1,w2,w3,w4,w5;

   xor xor_0 (w1, A, B);
   xor xor_1 (Sum, w1, Cin);

   and and_0 (w2, A, B);
   and and_1 (w3, A, Cin);
   and and_2 (w4, B, Cin);

   or or_0 (w5, w2, w3);
   or or_1 (Cout, w4, w5);

endmodule
