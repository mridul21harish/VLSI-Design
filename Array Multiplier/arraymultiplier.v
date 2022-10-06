`timescale 1ns / 1ps
`include "halfadder.v"
`include "fulladder.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:03 10/16/2020 
// Design Name: 
// Module Name:    arraymultiplier 
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
module arraymultiplier(
   input [15:0] A,
   input [15:0] B,
   output [31:0] Product
   );

	wire [15:0] PP [15:0];
   wire [31:0] row [15:0];
   wire [31:0] temp [15:0];

   // Partial Product Generation
   genvar i,j;

   generate
   for(i=0; i<16; i=i+1)
   begin: partial_product_row
      for(j=0; j<16; j=j+1)
      begin : partial_product_column
         assign PP[i][j] = A[j] & B[i];
      end 
   end
   endgenerate

   //Left Shift Operation
   for(i=0; i<16; i=i+1)
   begin: left_shift
      assign temp[i] = {{16{1'b0}}, PP[i]};
      assign row[i] = temp[i] << i;
   end

   //intermediate stages sum computation

   //Initial Stage
   wire [15:1] sum1;
   wire [15:1] carry1;
   assign Product[0] = row[0][0];
   halfadder HA_0[15:1] (row[0][15:1], row[1][15:1], sum1[15:1], carry1[15:1]);
    
   //Second Stage
   wire [16:2] sum2;
   wire [16:2] carry2;
   assign Product[1] = sum1[1];
   fulladder FA_0[16:2] ({row[1][16], sum1[15:2]}, row[2][16:2], carry1[15:1], sum2[16:2], carry2[16:2]);

   //Third Stage
   wire [17:3] sum3;
   wire [17:3] carry3;
   assign Product[2] = sum2[2];
   fulladder FA_1[17:3] ({row[2][17], sum2[16:3]}, row[3][17:3], carry2[16:2], sum3[17:3], carry3[17:3]);

   //Fourth Stage
   wire [18:4] sum4;
   wire [18:4] carry4;
   assign Product[3] = sum3[3];
   fulladder FA_2[18:4] ({row[3][18], sum3[17:4]}, row[4][18:4], carry3[17:3], sum4[18:4], carry4[18:4]);

   //Fifth Stage
   wire [19:5] sum5;
   wire [19:5] carry5;
   assign Product[4] = sum4[4];
   fulladder FA_3[19:5] ({row[4][19], sum4[18:5]}, row[5][19:5], carry4[18:4], sum5[19:5], carry5[19:5]);

   //Sixth Stage
   wire [20:6] sum6;
   wire [20:6] carry6;
   assign Product[5] = sum5[5];
   fulladder FA_5[20:6] ({row[5][20], sum5[19:6]}, row[6][20:6], carry5[19:5], sum6[20:6], carry6[20:6]);

   //Seventh Stage
   wire [21:7] sum7;
   wire [21:7] carry7;
   assign Product[6] = sum6[6];
   fulladder FA_6[21:7] ({row[6][21], sum6[20:7]}, row[7][21:7], carry6[20:6], sum7[21:7], carry7[21:7]);

   //Eighth Stage
   wire [22:8] sum8;
   wire [22:8] carry8;
   assign Product[7] = sum7[7];
   fulladder FA_7[22:8] ({row[7][22], sum7[21:8]}, row[8][22:8], carry7[21:7], sum8[22:8], carry8[22:8]);

   //Nineth Stage
   wire [23:9] sum9;
   wire [23:9] carry9;
   assign Product[8] = sum8[8];
   fulladder FA_8[23:9] ({row[8][23], sum8[22:9]}, row[9][23:9], carry8[22:8], sum9[23:9], carry9[23:9]);

   //Tenth Stage
   wire [24:10] sum10;
   wire [24:10] carry10;
   assign Product[9] = sum9[9];
   fulladder FA_9[24:10] ({row[9][24], sum9[23:10]}, row[10][24:10], carry9[23:9], sum10[24:10], carry10[24:10]);

   //Eleventh Stage
   wire [25:11] sum11;
   wire [25:11] carry11;
   assign Product[10] = sum10[10];
   fulladder FA_10[25:11] ({row[10][25], sum10[24:11]}, row[11][25:11], carry10[24:10], sum11[25:11], carry11[25:11]);

   //Twelfth Stage
   wire [26:12] sum12;
   wire [26:12] carry12;
   assign Product[11] = sum11[11];
   fulladder FA_11[26:12] ({row[11][26], sum11[25:12]}, row[12][26:12], carry11[25:11], sum12[26:12], carry12[26:12]);

   //Thirteenth Stage
   wire [27:13] sum13;
   wire [27:13] carry13;
   assign Product[12] = sum12[12];
   fulladder FA_12[27:13] ({row[12][27], sum12[26:13]}, row[13][27:13], carry12[26:12], sum13[27:13], carry13[27:13]);

   //Fourteenth Stage
   wire [28:14] sum14;
   wire [28:14] carry14;
   assign Product[13] = sum13[13];
   fulladder FA_13[28:14] ({row[13][28], sum13[27:14]}, row[14][28:14], carry13[27:13], sum14[28:14], carry14[28:14]);

   //Fifteenth Stage
   wire [29:15] sum15;
   wire [29:15] carry15;
   assign Product[14] = sum14[14];
   fulladder FA_14[29:15] ({row[14][29], sum14[28:15]}, row[15][29:15], carry14[28:14], sum15[29:15], carry15[29:15]);

   //Sixteenth Stage - Final
   wire [30:16] carry16;
   assign Product[15] = sum15[15];
   halfadder HA_1(sum15[16], carry15[15], Product[16], carry16[16]);
   fulladder FA_15[30:17] ({row[15][30], sum15[29:17]}, carry16[29:16], carry15[29:16], Product[30:17], carry16[30:17]);
   assign Product[31] = carry16[30];

endmodule
