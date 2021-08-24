module SevenSeg(dout,din,clk);
	input  [3:0] din;
	input        clk;
	output [6:0] dout;
	reg    [6:0] dout;

	always@(din) begin
		case(din)
		4'b0000:dout = 7'b0111111; 
		4'b0001:dout = 7'b0000110; 
		4'b0010:dout = 7'b1011011; 
		4'b0011:dout = 7'b1001111; 
		4'b0100:dout = 7'b1100110; 
		4'b0101:dout = 7'b1101101; 
		4'b0110:dout = 7'b1111101; 
		4'b0111:dout = 7'b0000111; 
		4'b1000:dout = 7'b1111111; 
		4'b1001:dout = 7'b1101111; 
		4'b1010:dout = 7'b1110111; 
		4'b1011:dout = 7'b1111100; 
		4'b1100:dout = 7'b0111001; 
		4'b1101:dout = 7'b1011110; 
		4'b1110:dout = 7'b1111001; 
		4'b1111:dout = 7'b1110001; 
		default:dout = 7'b0000000;
		endcase
	end
endmodule