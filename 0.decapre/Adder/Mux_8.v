`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:50:23 04/06/2019 
// Design Name: 
// Module Name:    Mux_8 
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
module Mux_8(
  A, B, C, Out
    );
	 
      input [7:0] A;
    input [7:0] B;
    input C;
    output [7:0] Out;

Mux M_0(A[0], B[0], C, Out[0]);
Mux M_1(A[1], B[1], C, Out[1]);
Mux M_2(A[2], B[2], C, Out[2]);
Mux M_3(A[3], B[3], C, Out[3]);
Mux M_4(A[4], B[4], C, Out[4]);
Mux M_5(A[5], B[5], C, Out[5]);
Mux M_6(A[6], B[6], C, Out[6]);
Mux M_7(A[7], B[7], C, Out[7]);

/*
 genvar j;
 
 generate 
  begin
   for(j=0;j<=7;j=j+1)
    begin
     Mux M(A[j],B[j],C,Out[j]);
    end
   end
endgenerate
*/

endmodule
