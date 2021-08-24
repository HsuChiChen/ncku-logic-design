`timescale  100ms/1ms
module testbench();
	reg clk;
	reg rst_n;

	reg a_in, b_in;
	wire blk_a_out, blk_b_out;
	wire  non_blk_a_out, non_blk_b_out;

	cnt_blk blk1(clk, rst_n, a_in, b_in, blk_a_out, blk_b_out);
	cnt_nonblk nonblk1(clk, rst_n, a_in, b_in, non_blk_a_out, non_blk_b_out);
	localparam CLK_PERIOD = 10;
	always #(CLK_PERIOD/2) clk=~clk;

	initial begin
		$dumpfile("testbench.vcd");
		$dumpvars(0, testbench);
	end

	initial begin
		#1 rst_n<=1'bx;clk<=1'bx; a_in =1'bx; b_in = 1'bx;
		#(CLK_PERIOD*3) rst_n<=1;
		#(CLK_PERIOD*3) rst_n<=0;clk<=0;a_in = 0; b_in = 1;
		repeat(5) @(posedge clk);
		rst_n<=1;
		#(CLK_PERIOD*6)
		#(CLK_PERIOD/2) rst_n<=0;a_in = 1; b_in = 0;
		#(CLK_PERIOD/4) rst_n<=1;
		#(CLK_PERIOD*5) $finish;
	end

endmodule
