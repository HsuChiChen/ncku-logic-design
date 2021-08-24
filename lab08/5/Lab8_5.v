module Lab8_5 (din_high,din_low,dout_digit1,dout_digit2,dp1,dp2,clk);
    input        clk;
    input  [3:0] din_high;
    input  [3:0] din_low;
    output       dp1,dp2;
    output [6:0] dout_digit1;
    output [6:0] dout_digit2;
	wire   [6:0] low, high;
	
	SevenSeg u_digit1(high,dout_digit1);
    SevenSeg u_digit2(low ,dout_digit2);
	
	assign low      = (din_high > din_low)? din_low : din_high;
	assign high     = (din_high > din_low)? din_high : din_low;
	assign dp1 = (din_high < din_low)? 1'b1 : 1'b0;
    assign dp2 = (din_high == din_low)? 1'b1 : 1'b0;
endmodule