module adder8bits_v2(A,B,Cin,Cout,Sum);
	input  [7:0] A,B;
	input        Cin;
	output [7:0] Sum;
	output       Cout;
	wire         Carry;
	wire   [3:0] Sum1;
	wire   [3:0] Sum2;
	wire         Cout1;
	wire         Cout2;
	
	adder4bits u1(.A(A[3:0]), .B(B[3:0]), .Cin(Cin) , .Cout(Carry), .Sum(Sum[3:0]));
	adder4bits u2(.A(A[7:4]), .B(B[7:4]), .Cin(1'b1), .Cout(Cout1) , .Sum(Sum1));
	adder4bits u3(.A(A[7:4]), .B(B[7:4]), .Cin(1'b0), .Cout(Cout2) , .Sum(Sum2));
	
	assign Cout      = (Carry == 1'b1)?  Cout1:Cout2;
	assign Sum[7:4]  = (Carry == 1'b1)?  Sum1 :Sum2;
endmodule 