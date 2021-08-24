module lab9_3(clock,reset,din,dout_digit);
    input        clock,reset,din;
    output [6:0] dout_digit;
    wire   [3:0] value;
    wire         clock_1HZ;
	
    clock_div clk_div(
                    .clk_48MHZ (clock),
                    .clk_1HZ   (clock_1HZ)
                    );
    t_ff    t_ff(
                    .clock  (clock_1HZ),
                    .reset  (reset),
                    .din_t  (din),
                    .dout_q (value[0]),
					.dout_nq ()
                    );
	assign value[3:1] = 3'b000;
    
	SevenSeg    SevenSeg(
                    .din    (value[3:0]),
                    .dout   (dout_digit)
                    );
endmodule