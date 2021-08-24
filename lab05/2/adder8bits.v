module adder8bits(A,B,Cin,Cout,Sum);
	input  [7:0] A,B;
	input        Cin;
	output [7:0] Sum;
	output       Cout;
	wire         Carry;
	
	adder4bits u1(.A(A[3:0]), .B(B[3:0]), .Cin(Cin)  , .Cout(Carry), .Sum(Sum[3:0]));
	adder4bits u2(.A(A[7:4]), .B(B[7:4]), .Cin(Carry), .Cout(Cout) , .Sum(Sum[7:4]));
endmodule 