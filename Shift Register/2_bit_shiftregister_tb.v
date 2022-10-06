`include "2_bit_shiftregister.v"

module top2;

reg [1:0]in;
reg clk; 
reg leftshift; 
reg rightshift; 
reg sync_reset;
reg [1:0]sel;    

wire [1:0]out;
    
    	two_bit_shiftregister tbsr(out, in, sel, clk, sync_reset, rightshift, leftshift);

    	initial
    	begin
        	clk = 1'b1;
        	sync_reset = 1'b0;
        	rightshift = 1'b1;
        	leftshift = 1'b1;
        	sel = 2'b00;

        	#10;
        	sync_reset = 1'b1;

        	#10;
        	in = 2'b10;
        	sync_reset = 1'b0;

        	#10;
        	$display("\t\tParallel Load");
        	sel <= 2'b11;

        	#10;
        	$display("\t\tShift Right");
        	sel <= 2'b10;

        	#10;
        	sel <= 2'b11;

        	#10;
        	$display("\t\tShift Left");
        	sel <= 2'b01;

        	#10;
        	sel <= 2'b11;

        	#10;
        	$display("\t\tNo Change");
        	sel <= 2'b00;

        	#10;
        	sel <= 2'b11;
    	end

    	always #5 clk <= ~clk;

    	initial
        	#110 $finish;

    	initial
        	$monitor ($time, "   select = %b; input = %b; output = %b rightshift = %b; leftshift = %b", sel, in, out, rightshift, leftshift);
    
endmodule
