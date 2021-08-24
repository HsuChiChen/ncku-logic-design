module d_ff(clock,reset,din_d,dout_q,dout_nq);
	input clock;
	input reset;
	input din_d;    //D
	output dout_q;  //Q_n
	output dout_nq; //Q_n+1
	reg data;

	always@(posedge clock or posedge reset) begin
		if(reset) //reset
		data <= 1'b0;
		else begin
			if(din_d) //D==1
				data <= 1'b1; //Q_n+1=1
			else      //D==0
				data <= 1'b0; //Q_n+1=0
		end
	end

	assign dout_q = data;
	assign dout_nq = ~data;
endmodule

// D flip-flip truth table 
// +----+---+-------+
// | CK | D | Q_n+1 |
// +----+---+-------+
// | 0  | X |  Q_n  |
// +----+---+-------+
// | 1  | 0 |   0   |
// +----+---+-------+
// | 1  | 1 |   1   |
// +----+---+-------+
//(trasform of SR flip flip and D stands for Data)