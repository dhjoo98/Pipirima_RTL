`timescale 1ns/10ps


module DR_synth(offset1, offset2, in_prediction, col1, col2, in_prediction_col, out_prediction, out_prediction_col, flush, clk, rst);

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

    wire [31:0] offset1_w;
    wire [31:0] offset2_w;
    wire [15:0] col1_w;
    wire [15:0] col2_w;
    wire [31:0] in_prediction_w;
    wire [15:0] in_prediction_col_w;
    wire [15:0] out_prediction_col_w;
    wire [31:0] out_prediction_w;
    wire flush_w;

    D_FF_32 DF1(offset1_w, offset1, clk, rst);
    D_FF_32 DF2(offset2_w, offset2, clk, rst);
    D_FF_16 DF1_(col1_w, col1, clk, rst);
    D_FF_16 DF2_(col2_w, col2, clk, rst);
    D_FF_32 DF3(in_prediction_w, in_prediction, clk, rst);
    D_FF_16 DF3_(in_prediction_col_w, in_prediction_col, clk, rst);
    DR_insp DR_insp(offset1_w, offset2_w, in_prediction_w, col1_w, col2_w, in_prediction_col_w, out_prediction_w, out_prediction_col_w, flush_w, clk, rst);
    D_FF_32 DF4(out_prediction, out_prediction_w, clk, rst);
    D_FF_16 DF4_(out_prediction_col, out_prediction_col_w, clk, rst);
    D_FF_1 DF5(flush, flush_w, clk, rst);

endmodule



