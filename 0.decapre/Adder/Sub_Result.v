module Sub_Result(
A, B, Out, b
    );


    input [7:0] A;
    input [7:0] B;
    output [7:0] Out; // either positive or negative
	 output b; // shows which input is bigger

wire [7:0]d;
wire [7:0]d1;

Subtractor_8Bit S(A,B,d,b);
Complement2s C(d, d1);
assign Out=(b == 1'b1)?d1:d;
endmodule

module Subtractor_8Bit(
A, B, D, Bout

    );

    input [7:0] A;
    input [7:0] B;
    output [7:0] D;
    output Bout;

wire [7:0] w;

HalfSubtractor H1(A[0],B[0],D[0],w[0]);
FullSubtractor F1(A[1],B[1],w[0],D[1],w[1]);
FullSubtractor F2(A[2],B[2],w[1],D[2],w[2]);
FullSubtractor F3(A[3],B[3],w[2],D[3],w[3]);
FullSubtractor F4(A[4],B[4],w[3],D[4],w[4]);
FullSubtractor F5(A[5],B[5],w[4],D[5],w[5]);
FullSubtractor F6(A[6],B[6],w[5],D[6],w[6]);
FullSubtractor F7(A[7],B[7],w[6],D[7],w[7]);

assign Bout=w[7];

endmodule

module HalfSubtractor(
 A, B, D, Bout
    );
	     input A;
    input B;
    output D;
    output Bout;

xor(D,A,B);
and(Bout,~A,B);

endmodule

module FullSubtractor(
  A, B, Bin, D, Bout
    );

      input A;
    input B;
    input Bin;
    output D;
    output Bout;
	 
wire w1,w2,w3,w4, w5;

xor(w1,A,B);
xor(D,w1,Bin);

and(w2,~A,~B,Bin);
and(w3,A,~B,~Bin);
and(w4,~A,B,~Bin);
and(w5,A,B,Bin);

or(Bout,w2,w3,w4,w5);

endmodule