module Lab8_2 (sel,din_high,din_low,dout_digit1,dout_digit2,dout_dp1,dout_dp2,clk);
    input sel,clk;
    input [3:0] din_high;
    input [3:0] din_low;

    output [6:0] dout_digit1;
    output [6:0] dout_digit2;
    output dout_dp1;
    output dout_dp2;

    wire [7:0] value_in;
    wire [7:0] value_sum;
    wire [7:0] result;

    adder4bits u1(
        .A     (din_high),
        .B     (din_low),
        .Carry (value_sum[4]),
        .Sum   (value_sum[3:0])
        );

    assign value_sum[7:5] = 3'b000;
    assign value_in = {din_high,din_low};
    assign result = (sel == 1'b0)? value_sum : value_in;

    SevenSeg u_digit1(result[7:4],dout_digit1);
    SevenSeg u_digit2(result[3:0],dout_digit2);

    assign dout_dp1 =1'b1;
    assign dout_dp2 =1'b1;
endmodule