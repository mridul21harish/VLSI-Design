`include "2_bit_shiftregister.v"

module four_bit_shiftregister(out, in, sel, clk, sync_reset, rightshift, leftshift);

input [3:0]in;
input clk; 
input rightshift;
input leftshift; 
input sync_reset;
input [1:0]sel;

output [3:0]out;

    	two_bit_shiftregister tbsr_1(out[1:0], in[1:0], sel, clk, sync_reset, out[2], leftshift);
    
    	two_bit_shiftregister tbsr_2(out[3:2], in[3:2], sel, clk, sync_reset, rightshift, out[1]);
    
endmodule
