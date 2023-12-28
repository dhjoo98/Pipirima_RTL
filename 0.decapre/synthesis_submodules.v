
module D_FF_32(q, in, clk, reset); //32bit delay for inputs
  	output [31:0] q;
  	input [31:0] in;
  	input clk, reset;

  	reg [31:0] q;

    	always @ (posedge clk)
  	  begin
      	   if(!reset)
             q <= 2'b0;
            else
             q <= in;
      end
endmodule