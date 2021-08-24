module FPGA_practice(led0,led1,led2,led3,in0,in1);
    input in0,in1;
    output led0,led1,led2,led3;

    assign led0 = {in0,in1} == 2'b11 ? 1'b0 : 1'b1;
    assign led1 = {in1,in0} == 2'b10 ? 1'b0 : 1'b1;
    assign led2 = {in1,in0} == 2'b01 ? 1'b0 : 1'b1;
    assign led3 = {in1,in0} == 2'b00 ? 1'b0 : 1'b1;
endmodule