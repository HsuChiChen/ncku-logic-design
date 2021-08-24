module lab9_2(clock,reset,led_a,led_b);
    input        clock,reset;
    output [3:0] led_a;
    output [7:0] led_b;
    wire         clock_1HZ;
	wire         [3:0]q;
	wire         [7:0]j;
	wire		  reset;

    clock_div clock_div(
                        .clk_48MHZ  (clock),
                        .clk_1HZ    (clock_1HZ)
                        );

    johnson_counter jc(
                        .clock  (clock_1HZ),
                        .reset  (reset),
                        .dout_q (q),
                        .dout_j (j)
                        );
						
	assign led_a = q;
	assign led_b = j;
endmodule