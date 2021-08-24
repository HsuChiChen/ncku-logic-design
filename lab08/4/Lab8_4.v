module Lab8_4 (din_high,din_low,dout_digit1,dout_digit2,dout_dp1,dout_dp2,clk);
    input       clk;
    input [3:0] din_high;
    input [3:0] din_low;
    
    output [6:0] dout_digit1;
    output [6:0] dout_digit2;
    output  dout_dp1;
    output  dout_dp2;

    SevenSeg u_digit1(din_high,dout_digit1);
    SevenSeg u_digit2(din_low,dout_digit2);

    assign dout_dp1 = (din_high > din_low)? 1'b1 : 1'b0;
    assign dout_dp2 = (din_high < din_low)? 1'b1 : 1'b0;
endmodule