module fulladder(A, B, C, Carry, Sum);
	input A, B, C;
	output Carry, Sum;
	
	assign Carry = (((A ^ B) & C) | (A & B));
	assign Sum = A ^ B ^ C;

endmodule
