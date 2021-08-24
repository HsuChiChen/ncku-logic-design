module dec4bits(dout_hi,dout_lo,din,clk);
    input   [3:0] din;
    input         clk;
    output  [6:0]   dout_hi, dout_lo;

    wire    [6:0]   din_hi, din_lo;
    
    SevenSeg u1(dout_hi,din_hi,clk);
    SevenSeg u2(dout_lo,din_lo,clk);

    assign din_hi = din / 10;
    assign din_lo = din % 10;

endmodule
