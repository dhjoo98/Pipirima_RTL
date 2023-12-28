`timescale 1ns/1ps

module testbench;

wire [31:0] data;
//wire CBB_valid;
reg [31:0] value;
reg [31:0] row;
reg clk;
reg rst;

wire out_bit_sign;
wire [7:0] out_bit_exponent;
wire [22:0] out_bit_mantissa;

assign out_bit_sign = data[31];
assign out_bit_exponent = data[30:23];
assign out_bit_mantissa = data[22:0];

initial
begin 
    clk <= 1;
    rst <= 1;
    #10 
    rst <=0;
end

always #5 clk <= ~clk;

IMU_fp test_fp(data, value, row);


initial 
begin 
    #20
    value <= {1'b0, 8'b10000000, 23'b0}; // 2
    row <= 32'd0;  //  0
    // expect output 0 
    
    #10
    
    value <= {1'b0, 8'b10000000, 23'b0};    // 2
    row <= {1'b0, 8'b01111101, 23'b0};  // 0.5 
    // expect output 1 

    #100
    $finish;
end

endmodule
