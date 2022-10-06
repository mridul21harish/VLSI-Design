timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:22 10/07/2020 
// Design Name: 
// Module Name:    paritygenerator 
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
module paritygenerator(
    input bit0,
    input bit1,
    input bit2,
    input bit3,
    input bit4,
    input bit5,
    input bit6,
    input bit7,
    inout out0,
    inout out1,
    inout out2,
    inout out3,
    inout out4,
    inout out5,
    output evenparity,
    output oddparity
    );

xor xor_0 (out0, bit0, bit1);
xor xor_1 (out1, bit2, bit3);
xor xor_2 (out2, bit4, bit5);
xor xor_3 (out3, bit6, bit7);
xor xor_4 (out4, out0, out1);
xor xor_5 (out5, out2, out3);
xor xor_6 (evenparity, out4, out5);

not not_0 (oddparity, evenparity);

endmodule
