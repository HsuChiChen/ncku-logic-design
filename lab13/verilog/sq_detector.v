module SQD (clk, rst, in_data, out_data);
    input clk,rst,in_data;
    output out_data;

    reg out_data;
    reg [3:0]state,next_state;
    
    localparam S0 = 4'd0;
    localparam S1 = 4'd1;
    localparam S2 = 4'd2;
    localparam S3 = 4'd3;
    localparam S4 = 4'd4;
    localparam S5 = 4'd5;
    localparam S6 = 4'd6;
    localparam S7 = 4'd7;
    localparam S8 = 4'd8;
    localparam S9 = 4'd9;
    localparam S10= 4'd10;

always @(posedge clk,posedge rst) begin
    if(rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*) begin
    case (state)
        S0: next_state = (in_data)? S7 : S1;
        S1: next_state = (in_data)? S2 : S1;
        S2: next_state = (in_data)? S8 : S3;
        S3: next_state = (in_data)? S4 : S3;
        S4: next_state = (in_data)? S5 : S3;
        S5: next_state = (in_data)? S6 : S9;
        S6: next_state = (in_data)? S8 : S9;
        S7: next_state = (in_data)? S8 : S1;
        S8: next_state = (in_data)? S8 : S9;
        S9: next_state = (in_data)? S10: S1;
        S10:next_state = (in_data)? S8 : S3;
    endcase
end

always @(*) begin
    case (state)
        S0: out_data = 1'b0;
        S1: out_data = 1'b0;
        S2: out_data = 1'b0;
        S3: out_data = 1'b0;
        S4: out_data = 1'b0;
        S5: out_data = 1'b0;
        S6: out_data = 1'b1;
        S7: out_data = 1'b0;
        S8: out_data = 1'b0;
        S9: out_data = 1'b0;
        S10:out_data = 1'b1;
    endcase
end
    
endmodule