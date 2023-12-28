`timescale 1ns/10ps


module NNZ_synth(offset1, offset2, in_prediction, out_prediction, flush, clk, rst);
                                
    input [31:0] offset1;
    input [31:0] offset2;
    input [31:0] in_prediction;
    input clk;
    input rst;

    output [31:0] out_prediction;
    output flush;

    wire [31:0] offset1_w;
    wire [31:0] offset2_w;
    wire [31:0] in_prediction_w;
    wire [31:0] out_prediction_w;
    wire flush_w;

    D_FF_32 DF1(offset1_w, offset1, clk, rst);
    D_FF_32 DF2(offset2_w, offset2, clk, rst);
    D_FF_32 DF3(in_prediction_w, in_prediction, clk, rst);
    NNZ_insp nnz_insp(offset1_w, offset2_w, in_prediction_w, out_prediction_w, flush_w, clk, rst);
    D_FF_32 DF4(out_prediction, out_prediction_w, clk, rst);
    D_FF_1 DF5(flush, flush_w, clk, rst);

endmodule



