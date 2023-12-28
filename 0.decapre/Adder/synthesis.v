`timescale 1ns/10ps


module IMU_synth
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
    FloatingPointAdder FP1(value_w, row_w, data_w);
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