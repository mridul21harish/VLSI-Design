`include "d_flip_flop.v"
`include "4_to_1_multiplexer.v"

module one_bit_shiftregister(out, in, sel, clk, sync_reset, rightshift, leftshift);

input in;
input clk; 
input rightshift;
input leftshift;  
input sync_reset;
input [1:0] sel;

wire w;

output out;

	four_to_one_multiplexer mux(w, sel[0], sel[1], out, rightshift, leftshift, in);

	d_flip_flop dff(w, clk, sync_reset, out);
    
endmodule
