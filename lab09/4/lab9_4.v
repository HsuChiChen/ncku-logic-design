module lab9_4(clock,reset,dout_digit);
    input clock,reset;
    output[6:0] dout_digit;
    wire[3:0]   value;
    wire    clock_1HZ;

    clock_div clock_div(
                        .clk_48MHZ  (clock),
                        .clk_1HZ    (clock_1HZ)
                        );

    asyn_counter ac(
                        .clock      (clock_1HZ),
                        .reset      (reset),
                        .dout_q     (value)
    );
    //assign vlaue[3:1] = 3'b000;
    SevenSeg    SevenSeg(
                        .din    (value),
                        .dout   (dout_digit)
                    );
endmodule