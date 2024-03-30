module Serie_Serie_Register(
	input Data_In, Clk, Rst, Ena, LeRi,
	output reg Data_Out
);
	reg[3:0] Data_Reg;

	always @*
		if(LeRi)
			Data_Out <= Data_Reg[3];
		else
			Data_Out <= Data_Reg[0];
	
	always @(negedge Rst or posedge Clk)
		if(~Rst)
			Data_Reg <= 4'b0;
		else if(Ena)
			if(LeRi)
				Data_Reg <= {Data_Reg[2:0], Data_In};
			else
				Data_Reg <= {Data_In, Data_Reg[3:1]};
		else
			Data_Reg <= Data_Reg;
endmodule
