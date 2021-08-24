module lab10_1(clk,reset,up,down,left,right,R,C);
    input clk;
    input reset;
    input up,down,left,right;
	
    output reg [7:0] R,C;
    reg[7:0] R_t,C_t;
    wire up_oneshot,down_oneshot,left_oneshot,right_oneshot;
	
	//de-bounce logic
    oneshot u_oneshot1(clk,up,   up_oneshot);
    oneshot u_oneshot2(clk,down, down_oneshot);
    oneshot u_oneshot3(clk,left, left_oneshot);
    oneshot u_oneshot4(clk,right,right_oneshot);

	//8*8 LED row & column control
    always@(posedge clk or posedge reset) begin
        if(reset) begin
			R <= 8'b00000001;
			C <= 8'b00000001;
		end
		
        else begin
			R <= R_t;
			C <= C_t;
		end
    end
	
    always@(*) begin
		//row
        if(down_oneshot) begin
            R_t[7:1] = R[6:0];
            R_t[0] = R[7];
        end
		
        else if(up_oneshot) begin
            R_t[6:0] = R[7:1];
            R_t[7] = R[0];
        end
		
        else
            R_t = R;
    end
	
	always@(*) begin
		//column
		if(right_oneshot) begin
            C_t[7:1] = C[6:0];
            C_t[0] = C[7];
        end
		
        else if(left_oneshot) begin
            C_t[6:0] = C[7:1];
            C_t[7] = C[0];
        end
		
        else
			C_t = C;
	end
	
endmodule