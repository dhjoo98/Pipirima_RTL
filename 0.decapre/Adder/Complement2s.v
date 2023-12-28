`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:35:52 04/06/2019 
// Design Name: 
// Module Name:    Complement2s 
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
module Complement2s(
   A, Out
    );
	
 input [7:0] A;
    output [7:0] Out;

wire [7:0]w;

Mux M_0(1'b1, 1'b0, A[0], w[0]);
Mux M_1(1'b1, 1'b0, A[1], w[1]);
Mux M_2(1'b1, 1'b0, A[2], w[2]);
Mux M_3(1'b1, 1'b0, A[3], w[3]);
Mux M_4(1'b1, 1'b0, A[4], w[4]);
Mux M_5(1'b1, 1'b0, A[5], w[5]);
Mux M_6(1'b1, 1'b0, A[6], w[6]);
Mux M_7(1'b1, 1'b0, A[7], w[7]);


/*
genvar j;

 generate
  begin
   for(j=0;j<8;j=j+1)
    begin
     Mux M(1'b1,1'b0,A[j],w[j]);
    end
  end
endgenerate
*/

wire [7:0]c;
HalfAdder H1(w[0],1'b1,Out[0],c[0]);


FullAdder F1_1(w[1], 1'b0, c[0], Out[1], c[1]);
FullAdder F1_2(w[2], 1'b0, c[1], Out[2], c[2]);
FullAdder F1_3(w[3], 1'b0, c[2], Out[3], c[3]);
FullAdder F1_4(w[4], 1'b0, c[3], Out[4], c[4]);
FullAdder F1_5(w[5], 1'b0, c[4], Out[5], c[5]);
FullAdder F1_6(w[6], 1'b0, c[5], Out[6], c[6]);
FullAdder F1_7(w[7], 1'b0, c[6], Out[7], c[7]);

/*
genvar i;

	generate
		begin
			for(i=1;i<8;i=i+1)
			  begin
			    FullAdder F1(w[i],1'b0,c[i-1],Out[i],c[i]);
			  end
		end
	endgenerate
*/

endmodule
