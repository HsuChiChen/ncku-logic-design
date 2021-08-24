`timescale 1ns/10ps
module testbench();
	reg  [7:0]A,B;
	reg       Cin;
	wire [7:0]Sum;
	wire      Cout;
	
	adder8bits_v2 n1(.A(A), .B(B), .Cin(Cin), .Sum(Sum), .Cout(Cout));
	
	initial begin
		    A=15; B=16; Cin=1;
		#10 A=25; B=30; Cin=0;
		#10 A=31; B=12; Cin=1;
		#10 A= 0; B= 0; Cin=0;
		#10 $finish;
	end
endmodule