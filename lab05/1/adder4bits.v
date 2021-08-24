module adder4bits(A, B, Cin, Cout, Sum);
	input  [3:0] A, B;
	input        Cin;
	output [3:0] Sum;
	output       Cout;
	wire   [3:0] Carry;
	
	fulladder b1(A[0], B[0], Cin     , Carry[0], Sum[0]);
	fulladder b2(A[1], B[1], Carry[0], Carry[1], Sum[1]);
	fulladder b3(A[2], B[2], Carry[1], Carry[2], Sum[2]);
	fulladder b4(A[3], B[3], Carry[2], Cout    , Sum[3]);
endmodule
