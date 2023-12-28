`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:47:34 04/06/2019 
// Design Name: 
// Module Name:    ControlledIncrementor 
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
module ControlledIncrementor(
    A, Z, Out
    );
	 
    input A;
    input [7:0] Z;
    output [7:0] Out;

wire [7:0]w;
wire [7:0]Cin;

assign w =(A==1'b1)?1:0;

HalfAdder H(Z[0],w[0],Out[0],Cin[0]);


FullAdder F1_1(Z[1], w[1], Cin[0], Out[1], Cin[1]);
FullAdder F1_2(Z[2], w[2], Cin[1], Out[2], Cin[2]);
FullAdder F1_3(Z[3], w[3], Cin[2], Out[3], Cin[3]);
FullAdder F1_4(Z[4], w[4], Cin[3], Out[4], Cin[4]);
FullAdder F1_5(Z[5], w[5], Cin[4], Out[5], Cin[5]);
FullAdder F1_6(Z[6], w[6], Cin[5], Out[6], Cin[6]);
FullAdder F1_7(Z[7], w[7], Cin[6], Out[7], Cin[7]);

/*
genvar j;
generate 
 begin
  for(j=1;j<8;j=j+1)
   begin
   FullAdder F1(Z[j],w[j],Cin[j-1],Out[j],Cin[j]);
   end
 end
endgenerate
*/

endmodule  
