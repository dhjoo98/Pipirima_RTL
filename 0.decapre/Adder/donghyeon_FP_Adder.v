module  FloatingPointAdder(  A, B, Out);
    input [31:0] A;
    input [31:0] B;
    output [31:0] Out;

    wire [22:0]MA; 
    wire [22:0]MB; 
    wire [7:0]EA; 
    wire [7:0]EB;

    assign MA[22:0]=A[22:0];
    assign MB[22:0]=B[22:0];
    assign EA = A[30:23];
    assign EB = B[30:23];
    
    //calculate the difference between exponents
    wire [8:0]exp_diff; // 1b sign + 8b magnitude
    
    always @(*) begin  
        if (a >=b) begin 
            result = a-b;
        end else begin 
            result = b-a;
            result[8] = 1'b1;
        end
    end

    wire [22:0]MA_shifted;
    wire [22:0]MB_shifted;
    wire [7:0]shift_amount;
    
    //shift first, 
    always @(*) begin
        if (!result[8]) begin
            MA_shifted = MA;
            MB_shifted = MB >> shift_amount;
        end else begin
            MA_shifted = MA >> shift_amount;
            MB_shifted = MB;
        end
    end

    // darn, this different sign addition is quite tricky; 
    // where:     Shift the mantissa left until the high bit is set,  has to be done. 
    // one possible approach is: https://people.ece.cornell.edu/land/courses/ece5760/StudentWork/mje56/FPmath.v 
        //extending this into fp32. 


    //if exponential difference is larger than 22, just output the larger input.
    always @(*) begin
        if (result[7:0]>22) begin 
            Out = result[8]?A:B;
        end else begin 
            //the other assignment
        end
    end

endmodule