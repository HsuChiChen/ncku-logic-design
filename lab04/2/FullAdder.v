module FullAdder(A,B,Cin,S,Cout);
	input A,B,Cin;
	output S,Cout;
	wire X,Y,Z;

	xor (X,A,B);
	and (Z,A,B);
	and (Y,X,Cin);
	xor (S,X,Cin);
	or (Cout,Y,Z);
endmodule
