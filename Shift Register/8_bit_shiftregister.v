`include "4_bit_shiftregister.v"

module eight_bit_shiftregister(out, in, sel, clk, sync_reset, rightshift, leftshift);

input [7:0]in;
input clk;
input rightshift;
input leftshift; 
input sync_reset;
input [1:0]sel;

output [7:0]out;

    	four_bit_shiftregister fbsr_1(out[3:0], in[3:0], sel, clk, sync_reset, out[4], leftshift);
   
   	four_bit_shiftregister fbsr_2(out[7:4], in[7:4], sel, clk, sync_reset, rightshift, out[3]);
    
endmodule
