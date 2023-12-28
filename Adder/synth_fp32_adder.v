/**************************************************************************
 * Floating Point Adder                                                   *
 * 2-stage pipeline    
 *extended into 32b by donghyeon Joo                                      *
 *************************************************************************/


`timescale 1ns/10ps


module fp_adder_synth
                                (data, // MU_valid, 
                                //CBB_valid, 
                                value, row, clk, rst);

    output [31:0] data;
    
    input [31:0] value;
    input [31:0] row;
   
    input clk;
    input rst;

    wire [31:0] value_w;
    wire [31:0] row_w;
    wire [31:0] data_w;

    D_FF_32 DF1(row_w, row, clk, rst);
    D_FF_32 DF2(value_w, value, clk, rst);
    FpAdd FP1(value_w, row_w, data_w);
    D_FF_32 DF3(data, data_w, clk, rst);

endmodule




module D_FF_32(q, in, clk, reset); //32bit delay for inputs
  	output [31:0] q;
  	input [31:0] in;
  	input clk, reset;

  	reg [31:0] q;

    	always @ (posedge clk)
  	  begin
      	   if(!reset)
             q <= 32'b0;
            else
             q <= in;
      end
endmodule


module FpAdd (
    input      [31:0] iA,
    input      [31:0] iB,
    output     [31:0] oSum
);

    // Extract fields of A and B.
    wire        A_s;
    wire [7:0]  A_e;
    wire [22:0] A_f; 
    wire        B_s;
    wire [7:0]  B_e;
    wire [22:0] B_f;
    assign A_s = iA[31];
    assign A_e = iA[30:23];
    assign A_f = {1'b1, iA[22:1]}; //where's the zero'th bit?
    assign B_s = iB[31];
    assign B_e = iB[30:23];
    assign B_f = {1'b1, iB[22:1]};
    wire A_larger;

    // Shift fractions of A and B so that they align.
    wire [7:0]  exp_diff_A;
    wire [7:0]  exp_diff_B;
    wire [7:0]  larger_exp;
    wire [46:0] A_f_shifted; // originally, 18b + 19 = 37b, //thus 23b + 24 = 47.
    wire [46:0] B_f_shifted;

    assign exp_diff_A = B_e - A_e; // if B bigger
    assign exp_diff_B = A_e - B_e; // if A bigger

    assign larger_exp = (B_e > A_e) ? B_e : A_e;

    assign A_f_shifted = A_larger             ? {1'b0,  A_f, 23'b0} :
                         (exp_diff_A > 9'd45) ? 37'b0 :
                         ({1'b0, A_f, 23'b0} >> exp_diff_A);
    assign B_f_shifted = ~A_larger            ? {1'b0,  B_f, 23'b0} : //perform bit extension at LSB-side.
                         (exp_diff_B > 9'd45) ? 37'b0 :
                         ({1'b0, B_f, 23'b0} >> exp_diff_B);

    // Determine which of A, B is larger
    assign A_larger =    (A_e > B_e)                   ? 1'b1  :
                         ((A_e == B_e) && (A_f > B_f)) ? 1'b1  :
                         1'b0;

    // Calculate sum or difference of shifted fractions.
    wire [46:0] pre_sum;
    assign pre_sum = ((A_s^B_s) &  A_larger) ? A_f_shifted - B_f_shifted :
                     ((A_s^B_s) & ~A_larger) ? B_f_shifted - A_f_shifted :
                     A_f_shifted + B_f_shifted;

    
    /*
    // buffer midway results
    reg  [36:0] buf_pre_sum;
    reg  [7:0]  buf_larger_exp;
    reg         buf_A_e_zero;
    reg         buf_B_e_zero;
    reg  [26:0] buf_A;
    reg  [26:0] buf_B;
    reg         buf_oSum_s;
    always @(posedge iCLK) begin
        buf_pre_sum    <= pre_sum;
        buf_larger_exp <= larger_exp;
        buf_A_e_zero   <= (A_e == 8'b0);
        buf_B_e_zero   <= (B_e == 8'b0);
        buf_A          <= iA;
        buf_B          <= iB;
        buf_oSum_s     <= A_larger ? A_s : B_s;
    end
    */

    //bypass buffer
    wire  [46:0] buf_pre_sum;
    wire  [7:0]  buf_larger_exp;
    wire         buf_A_e_zero;
    wire         buf_B_e_zero;
    wire  [31:0] buf_A;
    wire  [31:0] buf_B;
    wire        buf_oSum_s;
    assign    buf_pre_sum  = pre_sum;
    assign    buf_larger_exp = larger_exp;
    assign    buf_A_e_zero   = (A_e == 8'b0);
    assign    buf_B_e_zero   = (B_e == 8'b0);
    assign    buf_A          = iA;
    assign    buf_B          = iB;
    assign    buf_oSum_s     = A_larger ? A_s : B_s;
    

    // Convert to positive fraction and a sign bit.
    wire [46:0] pre_frac;
    assign pre_frac = buf_pre_sum;

    // Determine output fraction and exponent change with position of first 1.
    wire [22:0] oSum_f;
    wire [7:0]  shft_amt;
    assign shft_amt = pre_frac[46] ? 8'd0  : pre_frac[45] ? 8'd1  :
                      pre_frac[44] ? 8'd2  : pre_frac[43] ? 8'd3  :
                      pre_frac[42] ? 8'd4  : pre_frac[41] ? 8'd5  :
                      pre_frac[40] ? 8'd6  : pre_frac[39] ? 8'd7  :
                      pre_frac[38] ? 8'd8  : pre_frac[37] ? 8'd9  :
                      pre_frac[36] ? 8'd10 : pre_frac[35] ? 8'd11 :
                      pre_frac[34] ? 8'd12 : pre_frac[33] ? 8'd13 :
                      pre_frac[32] ? 8'd14 : pre_frac[31] ? 8'd15 :
                      pre_frac[30] ? 8'd16 : pre_frac[29] ? 8'd17 :
                      pre_frac[28] ? 8'd18 : pre_frac[27] ? 8'd19 :
                      pre_frac[26] ? 8'd20 : pre_frac[25] ? 8'd21 :
                      pre_frac[24] ? 8'd22 : pre_frac[23] ? 8'd23 :
                      pre_frac[22] ? 8'd24 : pre_frac[21] ? 8'd25 :
                      pre_frac[20] ? 8'd26 : pre_frac[19] ? 8'd27 :
                      pre_frac[18] ? 8'd28 : pre_frac[17] ? 8'd29 :
                      pre_frac[16] ? 8'd30 : pre_frac[15] ? 8'd31 :
                      pre_frac[14] ? 8'd32 : pre_frac[13] ? 8'd33 :
                      pre_frac[12] ? 8'd34 : pre_frac[11] ? 8'd35 :
                      pre_frac[10] ? 8'd36 : pre_frac[9] ? 8'd37 :
                      pre_frac[8] ? 8'd38  : pre_frac[7] ? 8'd39  :
                      pre_frac[6] ? 8'd40  : pre_frac[5] ? 8'd41  :
                      pre_frac[4] ? 8'd42  : pre_frac[3] ? 8'd43  :
                      pre_frac[2] ? 8'd44  : pre_frac[1] ? 8'd45  :
                      pre_frac[0] ? 8'd46  : 8'd47; 

                      

    wire [63:0] pre_frac_shft;
    assign pre_frac_shft = {pre_frac, 17'b0} << (shft_amt+1);
    assign oSum_f = pre_frac_shft[63:36];

    wire [7:0] oSum_e;
    assign oSum_e = buf_larger_exp - shft_amt + 8'b1;

    // Detect underflow
    wire underflow;
    assign underflow = ~oSum_e[7] && buf_larger_exp[7] && (shft_amt != 8'b0);

    assign oSum = (buf_A_e_zero && buf_B_e_zero)    ? 32'b0 :
                  buf_A_e_zero                     ? buf_B :
                  buf_B_e_zero                     ? buf_A :
                  underflow                        ? 32'b0 :
                  (pre_frac == 0)                  ? 32'b0 :
                  {buf_oSum_s, oSum_e, oSum_f};

endmodule