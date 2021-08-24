module clock_div(clk_48MHZ, clk_1HZ); //reduce clock frequency
    input clk_48MHZ;
    output reg clk_1HZ;
    reg[31:0] counter_1HZ;

    always@(posedge clk_48MHZ) begin
		if(counter_1HZ == 32'd48000_000)
			counter_1HZ <= 32'd0; //return to 0
        else
			counter_1HZ <= counter_1HZ + 32'b1; //plus 1 repeatedly
        
		if(counter_1HZ < 32'd24000_000)
			clk_1HZ <= 1'd1;
		else
			clk_1HZ <= 1'd0; 
    end

endmodule