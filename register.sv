/*
*  @file register.svh
*  @data March 2017
*  @brief 
**/

module register #(parameter DATA_WIDTH = 8)(
input SYS_CLK,
input rst,
input read_flag,
input write_flag,
input reg [DATA_WIDTH-1:0] data_in,
output reg [DATA_WIDTH-1:0] data_out
);
  
logic data [DATA_WIDTH-1:0];
  
always @(posedge SYS_CLK or posedge rst)
begin      
	if(rst)
	  data <= 0;
	
	if(read_flag)
	  data_out <= data;
	else if(write_flag)
		 data <= data_in;
end
endmodule

