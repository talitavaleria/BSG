module tb();

logic clk, rst, enable;
logic [7:0] data_in;
logic [7:0] data_out;

modulator DUT( .g_clk_tx(clk), .reset(rst), .enable(enable), .data_in(data_in), .data_out(data_out) );

initial begin
	clk=1'b0;
	rst=1'b1;
	enable = 1'b1;
	#50 rst = 1'b0;
	#50 rst = 1'b1;
	//#50 $finish;
	data_in = 8'b10101010;
end

always
	#50 clk = ~clk;

endmodule
