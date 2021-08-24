`timescale 1ns/10ps
module testbench();
	reg  [3:0] A, B;
	reg        Cin;
	wire [3:0] Sum;
	wire       Cout;
	
	adder4bits n0(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
	
	initial begin
			A = 03; B = 05; Cin = 0;
		#10	A = 10; B = 02; Cin = 0;
		#10	A = 15; B = 15; Cin = 1;
		#10	A = 00; B = 00; Cin = 0;
		#10	$finish;
	end
endmodule
