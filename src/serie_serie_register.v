module serie_serie_register(
	input data_in, clk, rst, ena, leri,
	output reg data_out
);
	reg[3:0] data_reg;

	always @*
		if(leri)
			data_out <= data_reg[3];
		else
			data_out <= data_reg[0];
	
	always @(negedge rst or posedge clk)
		if(~rst)
			data_reg <= 4'b0;
		else if(ena)
			if(leri)
				data_reg <= {data_reg[2:0], data_in};
			else
				data_reg <= {data_in, data_reg[3:1]};
		else
			data_reg <= data_reg;
endmodule
