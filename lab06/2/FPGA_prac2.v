module FPGA_practice2(led0,led1,in0,in1,in2);
    input in0,in1,in2;
    output led0,led1;

    assign led0 = ~in2 | (in2 & in1 & ~in0);
    assign led1 = ~in2 | (in2 & ~in1);
endmodule