module adder4bits(A, B, Carry, Sum);
	input [3:0] A, B;
	output Carry;
	output [3:0] Sum;
	wire [4:0] result;
	
    assign result = A + B;
    assign Carry = result[4];
    assign Sum = result[3:0];
endmodule