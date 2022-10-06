`include "1_bit_shiftregister.v"

module two_bit_shiftregister(out, in, sel, clk, sync_reset, rightshift, leftshift);

input [1:0]in;
input clk;
input rightshift; 
input leftshift; 
input sync_reset;
input [1:0]sel;

output [1:0]out;

	one_bit_shiftregister obsr_1(out[0], in[0], sel, clk, sync_reset, out[1], leftshift);
    	
    	one_bit_shiftregister obsr_2(out[1], in[1], sel, clk, sync_reset, rightshift, out[0]);
    	
endmodule
