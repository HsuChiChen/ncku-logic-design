module Lab8_3 (din,dout_digit,clk);
    input        clk;
    input  [7:0] din;
    output [6:0] dout_digit;
    reg [3:0] value;

    always@(din) begin
		case (din)
			8'b10000000: value = 4'b0001;
			8'b01000000: value = 4'b0010;
			8'b00100000: value = 4'b0011;
			8'b00010000: value = 4'b0100;
			8'b00001000: value = 4'b0101;
			8'b00000100: value = 4'b0110;
			8'b00000010: value = 4'b0111;
			8'b00000001: value = 4'b1000;
			default: value = 4'b0000;
		endcase 
    end
	
    SevenSeg u_digit(value,dout_digit);
endmodule