module three(A, B, C, D);
	input A,B,C;
	output D;

	assign D=~((~(A&~B)&(B|~C))|(~A^C));
endmodule