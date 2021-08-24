module cnt_blk(clk, rst, a_in, b_in, a_out, b_out);

    input clk, rst, a_in, b_in;
    output a_out, b_out;
    reg a, b;

    assign a_out = a;
    assign b_out = b;

    always@(posedge clk or negedge rst)begin
        if(~rst) begin
            a = a_in;
            b = b_in;
        end
        else begin
           a = b;
           b = a; 
        end
    end

endmodule