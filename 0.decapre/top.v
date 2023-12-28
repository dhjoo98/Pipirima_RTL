//should it be dynamic

module top_row_wise_multiplier (clk, reset);

//If-Mul Units (IMU) [units inside DSMU and RSMU]
    // a condition using a multiplexer, which would
    // check if the values from DDM are non-zero or not. If it is
    // equal to zero, it is sent to CBB, else to the multiplication unit
    IMU imu1(MU_data, MU_valid, CBB_data, CBB_valid, read, clk, rst);
    IMU imu2(MU_data, MU_valid, CBB_data, CBB_valid, read, clk, rst);

//Contiguous Block Buffer
    // In diagonal sparse matmul, no partial outputs. (exactly one scalar-vector multiplication per one output row)
    // In non-diagonal, partial pit[its are stored, each CBB size = one set of DDM. 
    // 'each IMU in RSMU(ONLY! not for IMUs in DSMU) has a corresponding CBB' 

//**Compute Unit consists of two multiplication units

//Diagonally Sparse Multiplier Unit 
    //in case of diagonal prediction
    //values[i] vs DMM[i][:]
    //no adders needed
    //result directly stored into output buffers
    //n IMUs to allow coarse-grain parallelism
    //Each MU responsible for one scalar-vector multiplication

//Randomly Sparse Multiplier Unit
    //there can be multiple non-zero values per row
    //number of non-zero values are already known by NNZ/row predictor
    //RSMU reads that number of non-zero values and allocate each to IMU. 
    //each IMU does values[i]xDDM[i][:] and stores result in the corresponding block in CBB.
    //promote fine-grain parallelism - each IMU do TILE.B number of multiplication operation at a time

    //for both DSMU and RSMU, harness fine-grain parallelism by each IMU do TILE.B number of multiplication operation at a time

    //이 '시리얼' -> '패러럴' insight가 메인인 것 같은데.. 정확히 뭐지. 
    //  'Pipirima, informed by a prior understanding of the sparse matrix structure, 
    //  can now adeptly employs multiple IMUs concurrently'


//CBB-based Adder Tree
    // After all the multipliciation operations in IMUs, the partial outputs have been
    // transferred to the corresponding CBB.

    // partial outputs are then staged for accumulation
    // a SIGMA[REF]-like CBB-based Adder Tree (CAT), designed to accumulate results from adjacent CBBs
    // partial addition output is stored in one of the input CBBs
    // continues until we have the final output
    // contiguous placement of data within CBBs relative to the original non-zero locations in the dense matrix.
    // arrangement facilitates addition across all blocks without the need for index matching, hence streamlining the process.

    //  final output of the adder tree is the ith row of the output matrix and is moved to the output buffer

//details for dot-product
    //  above explanation of Pipirima is for SpMM kernel using row-wise product.
    // Pipirima is a versatile hardware that can be configured to implement SpMV as well as dot-product for SpMM.
    // In case of SpMM using dotproduct, the IMU does values[i]× DMM[i][0] operation and
    // accumulates the partial sum in the 0th block of CBB

    // These operations are distributed among different IMUs to get the partial outputs accorss all DDM[i][n].
    // For SpMV, DDM has 1 set of m-size blocks. Pipirima will do values[i]×DMM[0][i]
    // operation corresponding to 0th block of output vector. We can
    // parallelize this operation by a factor of BLOCKS.A.

endmodule 