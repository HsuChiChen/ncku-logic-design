module adder4bits(A, B, Cin, Cout, Sum);
	input  [3:0] A, B;
	input        Cin;
	output [3:0] Sum;
	output       Cout;
	wire   [3:0] Carry;
	
	fulladder b1(.A(A[0]), .B(B[0]), .C(Cin)     , .Carry(Carry[0]), .Sum(Sum[0]));
	fulladder b2(.A(A[1]), .B(B[1]), .C(Carry[0]), .Carry(Carry[1]), .Sum(Sum[1]));
	fulladder b3(.A(A[2]), .B(B[2]), .C(Carry[1]), .Carry(Carry[2]), .Sum(Sum[2]));
	fulladder b4(.A(A[3]), .B(B[3]), .C(Carry[2]), .Carry(Cout)    , .Sum(Sum[3]));
endmodule
