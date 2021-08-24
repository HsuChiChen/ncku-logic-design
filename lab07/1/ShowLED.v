module showLED(led0,led1,led2,led3,in0,in1,clk);
    input clk,in0,in1;
    output led0,led1,led2,led3;
    reg led0,led1,led2,led3;

    always@(in0 or in1) begin
		case({in1,in0})
		2'b00:  {led3,led2,led1,led0}=4'b0001; 
		2'b01:  {led3,led2,led1,led0}=4'b0010; 
		2'b10:  {led3,led2,led1,led0}=4'b0100; 
		2'b11:  {led3,led2,led1,led0}=4'b1000;
		endcase
    end
endmodule