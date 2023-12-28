module IMU_fp    
            // currently fixed point 32b. 
            // performs value x an element of row
                                (out_data, // MU_valid, 
                                //CBB_valid, 
                                value, row_data); //combinatorial, no clk or reset

    output [31:0] out_data; // still terminates as reg
    //output CBB_valid;

    input [31:0] value;
    input [31:0] row_data;
    //input clk;
    //input rst;

    wire check_zero;
    wire [31:0]mult_out;
    
    assign check_zero = (row_data == 32'b0); 
    
    float32_multiplier fpmult(value, row_data, mult_out);
    
    assign out_data = mult_out & {32{~check_zero}};
    /*
    always @(*) 
        begin
            if (check_zero) begin
                assign out_data = 32'b0;
            end else begin  
                assign out_data = mult_out;
            end
        end
    */
endmodule

module float32_multiplier (
    a, b, out
);
    input [31:0] a;   // Input float 1
    input [31:0] b;   // Input float 2
    output [31:0] out; // Output float

    // Splitting inputs into sign, exponent, and mantissa
    wire sign_a = a[31];
    wire [7:0] exponent_a = a[30:23];
    wire [22:0] mantissa_a = a[22:0];

    wire sign_b = b[31];
    wire [7:0] exponent_b = b[30:23];
    wire [22:0] mantissa_b = b[22:0];

    // Calculating the sign of the result
    wire out_sign = sign_a ^ sign_b;

    // Calculating the exponent of the result
    wire [8:0] exponent_sum = {1'b0, exponent_a} + {1'b0, exponent_b} - 8'd127;

    // Adding hidden 1 to the mantissas for normalized numbers
    wire [23:0] normalized_mantissa_a = {1'b1, mantissa_a};
    wire [23:0] normalized_mantissa_b = {1'b1, mantissa_b};

    // Multiplying mantissas
    wire [47:0] mantissa_product = normalized_mantissa_a * normalized_mantissa_b;

    // Normalizing the mantissa product and adjusting the exponent
    wire [7:0] out_exponent;
    wire [22:0] out_mantissa;

    assign out_exponent = (mantissa_product[47]) ? exponent_sum[7:0] + 1 : exponent_sum[7:0];
    assign out_mantissa = (mantissa_product[47]) ? mantissa_product[46:24] : mantissa_product[45:23];

    // Constructing the output
    assign out = {out_sign, out_exponent, out_mantissa};

endmodule