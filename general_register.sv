/*
*  @file general_register.sv
*  @data March 2017
*  @brief Implementa registradores de uso geral, cada resgitrador salvara o dado referente ao seu endereço
**/

module general_register #(parameter DATA_WIDTH = 8)(
input SYS_CLK,
input rst,
input read_flag,
input write_flag,
input [DATA_WIDTH-1:0] reg_addr,
input [DATA_WIDTH-1:0] amba_addr,
input [DATA_WIDTH-1:0] data_in,
output logic [DATA_WIDTH-1:0] data_out
);
  
logic [DATA_WIDTH-1:0] data;
  
always @(posedge SYS_CLK or posedge rst)
begin      
	if(rst)
	  data = 'h0;
	
	if(reg_addr == amba_addr)
	begin
		if(read_flag)
		  data_out <= data;
		else if(write_flag)
			 data <= data_in;
	end
end

endmodule
