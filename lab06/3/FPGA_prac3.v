module SecenSeg(dout, din, clk);
    input      [3:0]din;
    input           clk;
    output reg [6:0]dout;

    always@(din) begin
       case (din)
           4'b1111:dout = 7'b1000_000; 
           4'b1110:dout = 7'b1111_001; 
           4'b1101:dout = 7'b0100_100; 
           4'b1100:dout = 7'b0110_000; 
           
           4'b1011:dout = 7'b0011_001;
           4'b1010:dout = 7'b0010_010;
           4'b1001:dout = 7'b0000_010;
           4'b1000:dout = 7'b1111_000;
           
           4'b0111:dout = 7'b0000_000;
           4'b0110:dout = 7'b0010_000;
           4'b0101:dout = 7'b0001_000;
           4'b0100:dout = 7'b0000_011;
           
           4'b0011:dout = 7'b1000_110;
           4'b0010:dout = 7'b0100_001;
           4'b0001:dout = 7'b0000_110;
           4'b0000:dout = 7'b0001_110;
		   
           default:dout = 7'b1111_111;
       endcase 
    end
endmodule
