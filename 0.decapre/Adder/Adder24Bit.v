`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:25:47 04/06/2019 
// Design Name: 
// Module Name:    Adder24Bit 
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
module Adder_24Bit(A, B, Out, Cout);

  input [23:0] A;
    input [23:0] B;
    output [23:0] Out;
    output Cout;
    
	 
 wire [23:0] Cin;
 HalfAdder H1(A[0],B[0],Out[0],Cin[0]);
 
FullAdder F1_1(A[1], B[1], Cin[0], Out[1], Cin[1]);
FullAdder F1_2(A[2], B[2], Cin[1], Out[2], Cin[2]);
FullAdder F1_3(A[3], B[3], Cin[2], Out[3], Cin[3]);
FullAdder F1_4(A[4], B[4], Cin[3], Out[4], Cin[4]);
FullAdder F1_5(A[5], B[5], Cin[4], Out[5], Cin[5]);
FullAdder F1_6(A[6], B[6], Cin[5], Out[6], Cin[6]);
FullAdder F1_7(A[7], B[7], Cin[6], Out[7], Cin[7]);
FullAdder F1_8(A[8], B[8], Cin[7], Out[8], Cin[8]);
FullAdder F1_9(A[9], B[9], Cin[8], Out[9], Cin[9]);
FullAdder F1_10(A[10], B[10], Cin[9], Out[10], Cin[10]);
FullAdder F1_11(A[11], B[11], Cin[10], Out[11], Cin[11]);
FullAdder F1_12(A[12], B[12], Cin[11], Out[12], Cin[12]);
FullAdder F1_13(A[13], B[13], Cin[12], Out[13], Cin[13]);
FullAdder F1_14(A[14], B[14], Cin[13], Out[14], Cin[14]);
FullAdder F1_15(A[15], B[15], Cin[14], Out[15], Cin[15]);
FullAdder F1_16(A[16], B[16], Cin[15], Out[16], Cin[16]);
FullAdder F1_17(A[17], B[17], Cin[16], Out[17], Cin[17]);
FullAdder F1_18(A[18], B[18], Cin[17], Out[18], Cin[18]);
FullAdder F1_19(A[19], B[19], Cin[18], Out[19], Cin[19]);
FullAdder F1_20(A[20], B[20], Cin[19], Out[20], Cin[20]);
FullAdder F1_21(A[21], B[21], Cin[20], Out[21], Cin[21]);
FullAdder F1_22(A[22], B[22], Cin[21], Out[22], Cin[22]);
FullAdder F1_23(A[23], B[23], Cin[22], Out[23], Cin[23]);

assign Cout = Cin[23];

/*
 genvar j;
 generate 
  begin
   for(j=1;j<=23;j=j+1)
    begin
     FullAdder F1(A[j],B[j],Cin[j-1],Out[j],Cin[j]);
    end
  end
 assign Cout = Cin[23];
endgenerate
*/
endmodule
