`timescale 1ns/10ps
module three_tb;
	reg   A,B,C;
	wire  D;
	three three(.A(A),.B(B),.C(C),.D(D));
	integer i;
  
	initial begin
	A = 0;B = 0;C = 0;
	for (i = 0; i < 8; i = i + 1) begin
	#10 {A, B, C} = i;
	end
	#10 $finish;
	end

endmodule
