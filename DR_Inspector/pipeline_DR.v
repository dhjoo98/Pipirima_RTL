//NNZ/row prediction inspector

module DR_insp(offset1, offset2, in_prediction, col1, col2, in_prediction_col, out_prediction, out_prediction_col, flush, clk, rst);

    input [31:0] offset1;
    input [31:0] offset2;
    input [31:0] in_prediction;
    input [15:0] col1;
    input [15:0] col2;
    input [15:0] in_prediction_col;
    input clk;
    input rst;

    output [31:0] out_prediction;
    output [15:0] out_prediction_col;
    output flush;

    //stage 1
    wire [31:0] nnz;
    assign nnz = offset1 - offset2;

    wire [15:0] colidx;
    assign colidx = col1-col2;

    wire [31:0] stage2_prediction;
    wire [31:0] stage2_nnz;
    D_FF_32 D1(stage2_prediction, in_prediction, clk, rst);
    D_FF_32 D2(stage2_nnz, nnz, clk, rst);

    wire [15:0] stage2_prediction_col;
    wire [15:0] stage2_colidx;
    D_FF_16 D1_(stage2_prediction_col, in_prediction_col, clk, rst);
    D_FF_16 D2_(stage2_colidx, colidx, clk, rst);

    //stage 2
    wire comparator;
    assign comparator = (stage2_nnz == stage2_prediction);

    wire comparator_;
    assign comparator_ = (stage2_colidx == stage2_prediction_col);

    wire [31:0] stage3_prediction;
    wire stage3_comparator;
    D_FF_32 D3(stage3_prediction, stage2_prediction, clk, rst);
    D_FF_1 D4(stage3_comparator, comparator, clk, rst); 

    wire [15:0] stage3_prediction_col;
    wire stage3_comparator_;
    D_FF_16 D3_(stage3_prediction_col, stage2_prediction_col, clk, rst);
    D_FF_1 D4_(stage3_comparator_, comparator_, clk, rst); 


    //stage 3
    assign out_prediction = stage3_prediction;
    assign out_prediction_col = stage2_prediction_col;

    assign flush = stage3_comparator || stage3_comparator_;

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

module D_FF_16(q, in, clk, reset); //32bit delay for inputs
  	output [15:0] q;
  	input [15:0] in;
  	input clk, reset;

  	reg [15:0] q;

    	always @ (posedge clk)
  	  begin
      	   if(!reset)
             q <= 16'b0;
            else
             q <= in;
      end
endmodule

module D_FF_1(q, in, clk, reset); //32bit delay for inputs
  	output q;
  	input in;
  	input clk, reset;

  	reg q;

    	always @ (posedge clk)
  	  begin
      	   if(!reset)
             q <= 1'b0;
            else
             q <= in;
      end
endmodule