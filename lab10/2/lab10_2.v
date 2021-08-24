module lab10_2(clk,reset,pb,R,C);
	input clk;
	input reset;
	input pb;
	output reg [7:0] R;
	output reg [7:0] C;

	reg [7:0] C1,C2,C3,C4,C5;
	reg [2:0] display;
	reg [2:0] counter;

	wire pb_oneshot;
	wire reset_oneshot;
	wire clk_1000HZ;
	
	//de-bounce logic
	oneshot u_oneshot1(clk,pb,pb_oneshot);
	oneshot u_oneshot2(clk,reset,reset_oneshot);
	
	//reduce clock frequency
	clock_div u_clock_div(clk,clk_1000HZ);

	always@(posedge clk_1000HZ or posedge reset_oneshot) begin
		if(reset_oneshot) 
			counter <= 3'b0;
		else
			counter <= counter + 3'b1;
	end
	//L
	always@(counter) begin
		case(counter)
			3'd0: C1 = 8'b00000000;
			3'd1: C1 = 8'b00000100;
			3'd2: C1 = 8'b00000100;
			3'd3: C1 = 8'b00000100;
			3'd4: C1 = 8'b00000100;
			3'd5: C1 = 8'b00111100;
			3'd6: C1 = 8'b00000000;
			3'd7: C1 = 8'b00000000;
		endcase
	end

	//O
	always@(counter) begin
		case(counter)
			3'd0: C2 = 8'b00000000;
			3'd1: C2 = 8'b00111100;
			3'd2: C2 = 8'b00100100;
			3'd3: C2 = 8'b00100100;
			3'd4: C2 = 8'b00100100;
			3'd5: C2 = 8'b00111100;
			3'd6: C2 = 8'b00000000;
			3'd7: C2 = 8'b00000000;
		endcase
	end
	
	//G
	always@(counter) begin
		case(counter)
			3'd0: C3 = 8'b00000000;
			3'd1: C3 = 8'b01110000;
			3'd2: C3 = 8'b00001000;
			3'd3: C3 = 8'b00000100;
			3'd4: C3 = 8'b01100100;
			3'd5: C3 = 8'b01011000;
			3'd6: C3 = 8'b01110000;
			3'd7: C3 = 8'b00000000;
		endcase
	end
	
	//I
	always@(counter) begin
		case(counter)
			3'd0: C4 = 8'b00000000;
			3'd1: C4 = 8'b00011100;
			3'd2: C4 = 8'b00001000;
			3'd3: C4 = 8'b00001000;
			3'd4: C4 = 8'b00001000;
			3'd5: C4 = 8'b00011100;
			3'd6: C4 = 8'b00000000;
			3'd7: C4 = 8'b00000000;
		endcase
	end
	
	//C
	always@(counter) begin
		case(counter)
			3'd0: C5 = 8'b00000000;
			3'd1: C5 = 8'b01110000;
			3'd2: C5 = 8'b00001000;
			3'd3: C5 = 8'b00000100;
			3'd4: C5 = 8'b00000100;
			3'd5: C5 = 8'b00001000;
			3'd6: C5 = 8'b01110000;
			3'd7: C5 = 8'b00000000;
		endcase
	end
	
	//display = display + 1
	//If reset_oneshot == 1 or display == 4, display will return 0
	always@(posedge pb_oneshot or posedge reset_oneshot) begin
		if(reset_oneshot)
			display <= 3'd0;
		else if(display == 3'd4)
			display <= 3'd0;
		else
			display <= display + 3'd1;
	end
	
	//To choose display which alphabet is 
	always@(*) begin
		case(display)
			3'd0: C = C1; 
			3'd1: C = C2;
			3'd2: C = C3; 
			3'd3: C = C4; 
			3'd4: C = C5; 
			default: C = C1;
		endcase
	end
	
	//scan row one by one by clock
	//R[X]=1 will make the value in that row valid 
	always@(posedge clk_1000HZ or posedge reset_oneshot) begin
		if(reset_oneshot)
			R <= 8'b00000001;
		else begin
			R[7:1] <= R[6:0];
			R[0] <= R[7];
		end 
	end
	
endmodule

