`timescale 1ns/10ps
module testbench;
	reg A, B;
	wire carry, sum;

	Halfadder Halfadder(A, B, carry, sum);

	initial begin
		A = 0; B = 0;
		#10 A = 1; B = 0;
		#10 A = 0; B = 1;
		#10 A = 1; B = 1;
		#10 $finish;
	end
endmodule