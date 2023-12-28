`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:28 04/06/2019 
// Design Name: 
// Module Name:    BarrelShifter 
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
module BarrelShifter(
  In, Out, Shift
    );

  input [23:0] In;
    output [23:0] Out;
    input [4:0] Shift;

 wire [23:0]a;
 
 Mux M_0(In[0], In[1], Shift[0], a[0]);
Mux M_1(In[1], In[2], Shift[0], a[1]);
Mux M_2(In[2], In[3], Shift[0], a[2]);
Mux M_3(In[3], In[4], Shift[0], a[3]);
Mux M_4(In[4], In[5], Shift[0], a[4]);
Mux M_5(In[5], In[6], Shift[0], a[5]);
Mux M_6(In[6], In[7], Shift[0], a[6]);
Mux M_7(In[7], In[8], Shift[0], a[7]);
Mux M_8(In[8], In[9], Shift[0], a[8]);
Mux M_9(In[9], In[10], Shift[0], a[9]);
Mux M_10(In[10], In[11], Shift[0], a[10]);
Mux M_11(In[11], In[12], Shift[0], a[11]);
Mux M_12(In[12], In[13], Shift[0], a[12]);
Mux M_13(In[13], In[14], Shift[0], a[13]);
Mux M_14(In[14], In[15], Shift[0], a[14]);
Mux M_15(In[15], In[16], Shift[0], a[15]);
Mux M_16(In[16], In[17], Shift[0], a[16]);
Mux M_17(In[17], In[18], Shift[0], a[17]);
Mux M_18(In[18], In[19], Shift[0], a[18]);
Mux M_19(In[19], In[20], Shift[0], a[19]);
Mux M_20(In[20], In[21], Shift[0], a[20]);
Mux M_21(In[21], In[22], Shift[0], a[21]);
Mux M_22(In[22], In[23], Shift[0], a[22]);
Mux M_23(In[23], 1'b0, Shift[0], a[23]);

 /*
 genvar i;
 
 generate
	begin:b1
		for(i=0;i<23;i=i+1)
			begin:b2
			Mux M(In[i] , In[i+1] , Shift[0] , a[i]);
			end
	 Mux M1(In[23] , 1'b0 , Shift[0] , a[23]);
	end
endgenerate
*/
wire [23:0]a1;

// Unrolling the first loop for Mux M2
Mux M2_0(a[0], a[2], Shift[1], a1[0]);
Mux M2_1(a[1], a[3], Shift[1], a1[1]);
Mux M2_2(a[2], a[4], Shift[1], a1[2]);
Mux M2_3(a[3], a[5], Shift[1], a1[3]);
Mux M2_4(a[4], a[6], Shift[1], a1[4]);
Mux M2_5(a[5], a[7], Shift[1], a1[5]);
Mux M2_6(a[6], a[8], Shift[1], a1[6]);
Mux M2_7(a[7], a[9], Shift[1], a1[7]);
Mux M2_8(a[8], a[10], Shift[1], a1[8]);
Mux M2_9(a[9], a[11], Shift[1], a1[9]);
Mux M2_10(a[10], a[12], Shift[1], a1[10]);
Mux M2_11(a[11], a[13], Shift[1], a1[11]);
Mux M2_12(a[12], a[14], Shift[1], a1[12]);
Mux M2_13(a[13], a[15], Shift[1], a1[13]);
Mux M2_14(a[14], a[16], Shift[1], a1[14]);
Mux M2_15(a[15], a[17], Shift[1], a1[15]);
Mux M2_16(a[16], a[18], Shift[1], a1[16]);
Mux M2_17(a[17], a[19], Shift[1], a1[17]);
Mux M2_18(a[18], a[20], Shift[1], a1[18]);
Mux M2_19(a[19], a[21], Shift[1], a1[19]);
Mux M2_20(a[20], a[22], Shift[1], a1[20]);
Mux M2_21(a[21], a[23], Shift[1], a1[21]);

// Unrolling the second loop for Mux M3
Mux M3_22(a[22], 1'b0, Shift[1], a1[22]);
Mux M3_23(a[23], 1'b0, Shift[1], a1[23]);

/*
genvar j , k;

generate
	begin:b3
		for(j=0;j<22;j=j+1)
			begin:b4
		    	Mux M2(a[j] , a[j+2] , Shift[1] , a1[j]);
			end
	    for(k=22;k<24;k=k+1)
			begin:b5
			   Mux M3(a[k] , 1'b0 , Shift[1] , a1[k]);
			end
	end
endgenerate
*/

wire [23:0]a2;

// Unrolling the first loop for Mux M4
Mux M4_0(a1[0], a1[4], Shift[2], a2[0]);
Mux M4_1(a1[1], a1[5], Shift[2], a2[1]);
Mux M4_2(a1[2], a1[6], Shift[2], a2[2]);
Mux M4_3(a1[3], a1[7], Shift[2], a2[3]);
Mux M4_4(a1[4], a1[8], Shift[2], a2[4]);
Mux M4_5(a1[5], a1[9], Shift[2], a2[5]);
Mux M4_6(a1[6], a1[10], Shift[2], a2[6]);
Mux M4_7(a1[7], a1[11], Shift[2], a2[7]);
Mux M4_8(a1[8], a1[12], Shift[2], a2[8]);
Mux M4_9(a1[9], a1[13], Shift[2], a2[9]);
Mux M4_10(a1[10], a1[14], Shift[2], a2[10]);
Mux M4_11(a1[11], a1[15], Shift[2], a2[11]);
Mux M4_12(a1[12], a1[16], Shift[2], a2[12]);
Mux M4_13(a1[13], a1[17], Shift[2], a2[13]);
Mux M4_14(a1[14], a1[18], Shift[2], a2[14]);
Mux M4_15(a1[15], a1[19], Shift[2], a2[15]);
Mux M4_16(a1[16], a1[20], Shift[2], a2[16]);
Mux M4_17(a1[17], a1[21], Shift[2], a2[17]);
Mux M4_18(a1[18], a1[22], Shift[2], a2[18]);
Mux M4_19(a1[19], a1[23], Shift[2], a2[19]);

// Unrolling the second loop for Mux M5
Mux M5_20(a1[20], 1'b0, Shift[2], a2[20]);
Mux M5_21(a1[21], 1'b0, Shift[2], a2[21]);
Mux M5_22(a1[22], 1'b0, Shift[2], a2[22]);
Mux M5_23(a1[23], 1'b0, Shift[2], a2[23]);

/*
genvar p , q;
generate
	begin:b6
		for(p=0;p<20;p=p+1)
			begin:b7
			 Mux M4(a1[p] , a1[p+4] , Shift[2] , a2[p]);
			end
		for(k=20;k<24;k=k+1)
			begin:b8
			 Mux M5(a1[k] , 1'b0 , Shift[2] , a2[k]);
			end
	end
endgenerate
*/

wire [23:0]a3;

// Unrolling the first loop for Mux M6
Mux M6_0(a2[0], a2[8], Shift[3], a3[0]);
Mux M6_1(a2[1], a2[9], Shift[3], a3[1]);
Mux M6_2(a2[2], a2[10], Shift[3], a3[2]);
Mux M6_3(a2[3], a2[11], Shift[3], a3[3]);
Mux M6_4(a2[4], a2[12], Shift[3], a3[4]);
Mux M6_5(a2[5], a2[13], Shift[3], a3[5]);
Mux M6_6(a2[6], a2[14], Shift[3], a3[6]);
Mux M6_7(a2[7], a2[15], Shift[3], a3[7]);
Mux M6_8(a2[8], a2[16], Shift[3], a3[8]);
Mux M6_9(a2[9], a2[17], Shift[3], a3[9]);
Mux M6_10(a2[10], a2[18], Shift[3], a3[10]);
Mux M6_11(a2[11], a2[19], Shift[3], a3[11]);
Mux M6_12(a2[12], a2[20], Shift[3], a3[12]);
Mux M6_13(a2[13], a2[21], Shift[3], a3[13]);
Mux M6_14(a2[14], a2[22], Shift[3], a3[14]);
Mux M6_15(a2[15], a2[23], Shift[3], a3[15]);

// Unrolling the second loop for Mux M7
Mux M7_16(a2[16], 1'b0, Shift[3], a3[16]);
Mux M7_17(a2[17], 1'b0, Shift[3], a3[17]);
Mux M7_18(a2[18], 1'b0, Shift[3], a3[18]);
Mux M7_19(a2[19], 1'b0, Shift[3], a3[19]);
Mux M7_20(a2[20], 1'b0, Shift[3], a3[20]);
Mux M7_21(a2[21], 1'b0, Shift[3], a3[21]);
Mux M7_22(a2[22], 1'b0, Shift[3], a3[22]);
Mux M7_23(a2[23], 1'b0, Shift[3], a3[23]);


/*
genvar x , y;
generate
	begin
		for(x=0;x<16;x=x+1)
		 begin:b9
		  Mux M6(a2[x] , a2[x+8] , Shift[3] , a3[x]);
		 end
		for(y=16;y<24;y=y+1)
		 begin:b10
		  Mux M7(a2[y] , 1'b0 , Shift[3] , a3[y]);
		 end
	end
endgenerate
*/

wire [23:0]a4;

// Unrolling the first loop for Mux M8
Mux M8_0(a3[0], a3[4], Shift[4], a4[0]);
Mux M8_1(a3[1], a3[5], Shift[4], a4[1]);
Mux M8_2(a3[2], a3[6], Shift[4], a4[2]);
Mux M8_3(a3[3], a3[7], Shift[4], a4[3]);
Mux M8_4(a3[4], a3[8], Shift[4], a4[4]);
Mux M8_5(a3[5], a3[9], Shift[4], a4[5]);
Mux M8_6(a3[6], a3[10], Shift[4], a4[6]);
Mux M8_7(a3[7], a3[11], Shift[4], a4[7]);

// Unrolling the second loop for Mux M9
Mux M9_8(a3[8], 1'b0, Shift[4], a4[8]);
Mux M9_9(a3[9], 1'b0, Shift[4], a4[9]);
Mux M9_10(a3[10], 1'b0, Shift[4], a4[10]);
Mux M9_11(a3[11], 1'b0, Shift[4], a4[11]);
Mux M9_12(a3[12], 1'b0, Shift[4], a4[12]);
Mux M9_13(a3[13], 1'b0, Shift[4], a4[13]);
Mux M9_14(a3[14], 1'b0, Shift[4], a4[14]);
Mux M9_15(a3[15], 1'b0, Shift[4], a4[15]);
Mux M9_16(a3[16], 1'b0, Shift[4], a4[16]);
Mux M9_17(a3[17], 1'b0, Shift[4], a4[17]);
Mux M9_18(a3[18], 1'b0, Shift[4], a4[18]);
Mux M9_19(a3[19], 1'b0, Shift[4], a4[19]);
Mux M9_20(a3[20], 1'b0, Shift[4], a4[20]);
Mux M9_21(a3[21], 1'b0, Shift[4], a4[21]);
Mux M9_22(a3[22], 1'b0, Shift[4], a4[22]);
Mux M9_23(a3[23], 1'b0, Shift[4], a4[23]);



/*
genvar s , t;
generate
	begin:b11
	for(s=0;s<8;s=s+1)
		begin:b12
		 Mux M8(a3[s] , a3[s+4] , Shift[4] , a4[s]);
		end
	for(t=8;t<24;t=t+1)
		begin:b13
		 Mux M9(a3[t] , 1'b0 , Shift[4] , a4[t]);
		end
	end
endgenerate
*/

assign Out = a4;

endmodule


