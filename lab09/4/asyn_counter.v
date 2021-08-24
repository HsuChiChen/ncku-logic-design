module asyn_counter(clock,reset,dout_q);
    input clock,reset;
    output [3:0]dout_q;
    wire q0,q1,q2,q3;
    wire nq0,nq1,nq2;

    t_ff diff_b0(
                .clock      (clock),
                .reset      (reset),
                .din_t      (1'b1),
                .dout_q     (q0),
                .dout_nq    (nq0)    
                );
    t_ff diff_b1(
                .clock      (nq0),
                .reset      (reset),
                .din_t      (1'b1),
                .dout_q     (q1),
                .dout_nq    (nq1)    
                );
    t_ff diff_b2(
                .clock      (nq1),
                .reset      (reset),
                .din_t      (1'b1),
                .dout_q     (q2),
                .dout_nq    (nq2)    
                );
    t_ff diff_b3(
                .clock      (nq2),
                .reset      (reset),
                .din_t      (1'b1),
                .dout_q     (q3),
                .dout_nq    () //unused   
                );
    assign dout_q = {q3,q2,q1,q0};
endmodule