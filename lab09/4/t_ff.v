module t_ff(clock,reset,din_t,dout_q,dout_nq);
    input clock;
    input reset;
    input din_t;
    output dout_q;
    output dout_nq;
    reg data;

    always@(posedge clock or posedge reset) begin
		if(reset)
			data <= 1'b0;
		else begin 
			if(din_t)
				data <= ~data;
			else
				data <= data;
		end
    end

	assign dout_q = data;
	assign dout_nq = ~data;
endmodule

// T flip-flip truth table 
// +----+---+-------+
// | CK | T | Q_n+1 |
// +====+===+=======+
// | 0  | X |  Q_n  |
// +----+---+-------+
// | 1  | 0 |  Q_n  |
// +----+---+-------+
// | 1  | 1 |  Q_n' |
// +----+---+-------+
//(trasform of JK flip flip and T stands for Toggle)