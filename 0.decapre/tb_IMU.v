`timescale 1ns/1ps

module testbench;

wire [127:0] data;
wire CBB_valid;
reg [31:0] value;
reg [127:0] row;
reg clk;
reg rst;

wire [31:0] data1;
wire [31:0] data2;
wire [31:0] data3;
wire [31:0] data4;

assign data1 = data[32:0];
assign data2 = data[63:32];
assign data3 = data[95:64];
assign data4 = data[127:96];

initial
begin 
    clk <= 1;
    rst <= 1;
    #10 
    rst <=0;
end

always #5 clk <= ~clk;

IMU test_IMU(data, CBB_valid, value, row, clk, rst);


initial 
begin 
    value <= 32'd5;
    row[31:0] <= 32'd0;
    row[63:32] <= 32'd1;
    row[95:64] <= 32'd2;
    row[127:96] <= 32'd3;
    #500
    $finish;
end

endmodule

