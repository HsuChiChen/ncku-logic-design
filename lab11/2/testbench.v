`timescale 100ms / 1ms
`define CYC 2.5
module testbench ();

    reg clock;
    reg reset;
    reg set;
    wire green,yellow,red;
    integer counter = 0;

    always #(`CYC/2) clock = ~clock;
    initial clock = 1'b1;

    lab11_1 lb11_1(clock,reset,set,green,yellow,red);

    always @(posedge clock) begin
        counter <= counter + 1;
    end

    initial begin
        $dumpfile("trafficlight.vcd");
        $dumpvars(0,testbench);
        reset = 1 ;
        set = 0;
        #(`CYC) reset = 0;
        #(`CYC) begin
            set = 1;
            //counter = -1;
        end
        #(`CYC) set = 0;     
        #(17*`CYC) set = 1;
        #(3*`CYC) set = 0;
        #(5*`CYC) reset = 1;
        #(5*`CYC) $finish;
    end

    always@(posedge clock) begin
        if(green == 1'b1)
            $display("(%d/4)s:GREEN",counter);
        else if(yellow == 1'b1)
            $display("(%d/4)s:YELLOW",counter);
        else if(red == 1'b1)
            $display("(%d/4)s:RED",counter);
        else 
            $display("(%d/4)s:NO LIGHT",counter);
    end
    
endmodule