`timescale 1ns/10ps
module FullAdder_tb;
	reg   A,B,Cin;
	wire  S,Cout;
	FullAdder FullAdder(.A(A),.B(B),.Cin(Cin),.S(S),.Cout(Cout));
	integer i;
	 
	initial begin
		A = 0;B = 0;Cin = 0;
		for (i = 0; i < 8; i = i + 1) begin
			#10 {A, B, Cin} = i;
		end
		#10 $finish;
	end
endmodule
