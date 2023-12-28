//`include "parameters.v"

//If-Mul Units (IMU) [units inside DSMU and RSMU]
    // a condition using a multiplexer, which would
    // check if the values from DDM are non-zero or not. If it is
    // equal to zero, it is sent to CBB, else to the multiplication unit

//module IMU #(parameter bit_width = `bit_width, tile_width = `tile_width) 
module IMU    
            // currently fixed point 32b. 
            // performs value x row(4 elements)
                                (data, // MU_valid, 
                                CBB_valid, value, row, clk, rst);

    //output [bit_width-1:0] data [0:tile_width-1]; 
    output reg [127:0] data;
    // output MU_valid;
    output reg CBB_valid;

    input [31:0] value;
    //input [bit_width-1:0] row [0:tile_width-1];
    input [127:0] row;
    input clk;
    input rst;

    wire check_zero;
    wire total_bit;

    //reg 

    assign check_zero = (value == 32'b0); 
    
    always @(clk)
        begin
            if (!check_zero && !rst)
                begin
                //send to multiplication unit
                //MU_valid = 1'b0;
                CBB_valid <= 1'b1;
                //no 'generate' statement inside sequential.
                data[31:0] <= value * row[31:0];  // 1 cycle multiplication
                data[63:32] <= value * row[63:32];
                data[95:64] <= value * row[95:64];
                data[127:96] <= value * row[127:96];
                //do accmulate inside here as well? 
                end               
            else if (!rst)
                begin
                //send to CBB
                //MU_valid = 1'b0;
                CBB_valid <= 1'b1;
                data <= 128'b0;
                end
        end
endmodule


//Diagonally Sparse Multiplier Unit 
    //in case of diagonal prediction
    //values[i] vs DMM[i][:]
    //no adders needed
    //result directly stored into output buffers
    //n IMUs to allow coarse-grain parallelism
    //Each MU(IMU?) responsible for one scalar-vector multiplication

//Randomly Sparse Multiplier Unit
    //there can be multiple non-zero values per row
    //number of non-zero values are already known by NNZ/row predictor
    //RSMU reads that number of non-zero values and allocate each to IMU. 
    //each IMU does values[i]xDDM[i][:] and stores result in the corresponding block in CBB.
    //promote fine-grain parallelism - each IMU do TILE.B number of multiplication operation at a time

    //for both DSMU and RSMU, harness fine-grain parallelism by each IMU do TILE.B number of multiplication operation at a time

// Adder 


// Pipeline