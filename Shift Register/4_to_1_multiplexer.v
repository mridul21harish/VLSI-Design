module four_to_one_multiplexer(out, sel0, sel1, in0, in1, in2, in3);

input sel0; 
input sel1;
input in0;
input in1;
input in2;
input in3;

output reg out;

always@(sel0, sel1, in0, in1, in2, in3)
	begin
		if(sel0 == 0 && sel1 == 0)
        	    out = in0;
        	else if(sel0 == 0 && sel1 == 1)
        	    out = in1;
        	else if(sel0 == 1 && sel1 == 0)
        	    out = in2;
        	else if(sel0 == 1 && sel1 == 1)
        	    out = in3;
	end
endmodule
