module testbench ();
    reg A, B;
    wire carry, sum;
    halfadder N1(A,B, carry, sum);

    initial begin
		//--將halfaddr的訊號寫到.vcd檔--
			$dumpfile("halfadder.vcd");
			$dumpvars(0, N1);
		//----------------------------
			A = 0; B = 0;
		#1  A = 1; B = 0;
		#1  A = 0; B = 1;
		#1  A = 1; B = 1;
		#1  $finish;        
    end
	
endmodule

