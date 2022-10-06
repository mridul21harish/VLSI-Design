`include "fourBitAdder.v"

module sixteenBitAdder(a, b, cin, sum, ca);
input [15:0] a, b;
input cin;

output [15:0] sum;
output ca;

wire c1,c2,c3;

fourBitAdder FBA_0(a[3:0], b[3:0], cin, sum[3:0], c1);
fourBitAdder FBA_1(a[7:4], b[7:4], c1, sum[7:4], c2);
fourBitAdder FBA_2(a[11:8], b[11:8], c2, sum[11:8], c3);
fourBitAdder FBA_3(a[15:12], b[15:12], c3, sum[15:12], ca);

endmodule
