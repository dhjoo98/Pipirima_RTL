//a single element adder, so Ubaid can multiply it by the number inside CBB + of the MAC adder.

module FP_Adder (sum, a, b);

    input [31:0] a; // Input operand A in IEEE 754 single-precision format
    input [31:0] b; // Input operand B in IEEE 754 single-precision format
    output [31:0] sum; // Result of floating-point addition in IEEE 754 single-precision format

    // Extracting components of operand A
    wire sign_a;
    wire [7:0] exponent_a;
    wire [22:0] fraction_a;

    assign sign_a = a[31];
    assign exponent_a = a[30:23];
    assign fraction_a = a[22:0];

    // Extracting components of operand B
    wire sign_b;
    wire [7:0] exponent_b;
    wire [22:0] fraction_b;

    assign sign_b = b[31];
    assign exponent_b = b[30:23];
    assign fraction_b = b[22:0];

    // Perform floating-point addition
    wire sign_sum;
    wire [7:0] exponent_sum;
    wire [22:0] fraction_sum;

    // Adder logic for the fraction part
    // (Note: This is a simplified example and does not handle rounding or special cases)
    assign fraction_sum = (sign_a == sign_b) ? (fraction_a + fraction_b) : (fraction_a - fraction_b);

    // Determine the new exponent
    // (Note: This is a simplified example and does not handle exponent underflow or overflow)
    wire [8:0] exponent_diff;
    assign exponent_diff = (exponent_a > exponent_b) ? (exponent_a - exponent_b) : (exponent_b - exponent_a);
    assign exponent_sum = (exponent_a > exponent_b) ? exponent_a : exponent_b;

    // Normalize the result
    wire [23:0] fraction_sum_normalized;
    wire [32:0] placeholder;
    assign placeholder = {1'b0, exponent_sum, fraction_sum} >> exponent_diff;
    assign fraction_sum_normalized = placeholder[23:0];
    assign exponent_sum = placeholder[31:24];

    // Determine the sign of the result
    assign sign_sum = (exponent_a > exponent_b) ? sign_a : sign_b;

    // Combine the components to form the result
    assign sum = {sign_sum, exponent_sum, fraction_sum_normalized};

endmodule
