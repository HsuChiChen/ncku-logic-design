module oneshot(clk,din,dout);
	input  clk,din;
	output dout;
	reg [1:0] cs;
	always@(posedge clk) begin
		case(cs)
			2'b00: begin
				if(din)
					cs <= 2'b01;
			end
			
			2'b01: cs <= 2'b10;
			2'b10: begin
				if(~din)
					cs <= 2'b00;
			end
			default: cs <=2'b00;
		endcase
	end

assign dout = cs[0];
endmodule