module lab11_1(clock,reset,set,green,yellow,red);

	input clock;
	input reset;
	input set;

	output green;
	output yellow;
	output red;

	reg [1:0]   state,next_state;
	reg         green,yellow,red;
	reg [4:0]   count;

	always @(posedge clock) begin
		state <= next_state;
	end

	always @(state or reset or set or count) begin
		if(reset == 1'b1)
			next_state = 2'd0;
		else begin
			case(state)
				2'd0:
					if(set == 1'b1)
						next_state = 2'd1;
					else
						next_state = 2'd0;
				2'd1:
					if(count == 5'd3)
						next_state = 2'd2;
					else
						next_state = 2'd1;
				2'd2:
					if(count == 5'd7)
						next_state = 2'd0;
					else
						next_state = 2'd2;
				default:next_state = 2'd0;
			endcase 
		end
	end

	always @(state) begin
		case(state)
			2'd0: begin
				green = 1'b1;
				yellow = 1'b0;
				red = 1'b0;
			end
			2'd1: begin
				green = 1'b0;
				yellow = 1'b1;
				red = 1'b0;
			end
			2'd2: begin
				green = 1'b0;
				yellow = 1'b0;
				red = 1'b1;
			end
			default: begin
				green = 1'b0;
				yellow = 1'b0;
				red = 1'b0;
			end
		endcase
	end

	always @(posedge clock) begin
		if(state != next_state)
			count <= 5'd0;
		else
			count <= count + 5'd1;
	end

endmodule