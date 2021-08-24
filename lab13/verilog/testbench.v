`timescale 1ns/10ps
`define CYCLE      25.0          	  // Modify your clock period here
`define End_CYCLE  20                 // Modify cycle times once your design need more cycle times!  
`include "sq_detector.v"
module testbench;
    
    // declare the needed regs and wires (the right hand side varibles inside the initail and always block)
    reg clk,reset;
    reg in_data;
    reg mem_i [18:0];
    reg golden [18:0];
    reg mem_o [18:0];
    wire out_data;
    // integer is for collecting the information which is irrelevant with hardwares
    integer i,j;
    integer error;
    
    // the hardware you want to verification
    SQD sq(
        .clk(clk),
        .rst(reset),
        .in_data(in_data),
        .out_data(out_data)
    );

    always begin  #(`CYCLE/2) clk = ~clk; end // let the clk be opposite every half cycle

    // every initial block start with the time zero

    // this initial block do some preperation, such as generating vcd file, read the input file, print some information
    initial begin
        $dumpfile("trafficlight.vcd");                                          // time = 0
        $dumpvars(0,testbench);                                                 // time = 0
        $readmemh("../others/input.dat",mem_i);                                 // time = 0
        $readmemh("../others/golden.dat",golden);                               // time = 0
        $display("-----------------------------------------------------");      // time = 0
        $display("START!!! Simulation Start .....");                            // time = 0
        $display("-----------------------------------------------------");      // time = 0
    end

    // this initial block initiate the value of some signals
	initial begin
        clk = 1'b0;                         // time = 0
        reset = 1'b1;                       // time = 0
        in_data = 1'b0;                     // time = 0
        error = 0;                          // time = 0
        #30 reset = 1'b0;                   // time = a cycle
        #(`CYCLE*`End_CYCLE) $finish;       // time = a cycle(above) + End_CYCLE*CYCLE
    end

    // this initial block run the task(case1)
    initial begin
        case1;      //start at time = 0;
    end
	
	initial begin
        case1_test;      //start at time = 0;
    end


    // task block ack like a function in software, it will run squentially inside the block
    task case1; begin
        wait(reset==0);             // stall here untill reset become '0' (correspond to line 47)
		
        for(i=0;i<19;i=i+1) begin
            in_data = mem_i[i];
			# 25;
        end
	end endtask
	
	
	task case1_test; begin
		#(`CYCLE*3/2);
		#3;
		for(j=0;j<19;j=j+1) begin
			if(out_data==golden[j]) begin
				$display("input= %d, out data equal to %d",in_data,golden[j]);
			end
			else begin
				$display("input= %d, out data is %d but golden is %d",in_data,out_data,golden[j]);
				error = 1;
			end
			#(`CYCLE);
		end
			
        if(error) begin
            $display("-----------------------------------------------------");
            $display("Simulation END, there are some errors.....");
            $display("-----------------------------------------------------");
        end
        else begin
            $display("-----------------------------------------------------");
            $display("Simulation END, SUCCESS!!!");
            $display("-----------------------------------------------------");
        end
    end endtask

endmodule
    