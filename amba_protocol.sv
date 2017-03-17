/*
*  @file amba_protocol.svh
*  @data March 2017
*  @brief Implementa o protocolo AMBA
**/

module amba_protocol #(parameter DATA_WIDTH=8)(
input SYS_CLK,
input rst,
input valid,
input [DATA_WIDTH-1:0] addr_in,
input [DATA_WIDTH-1:0] data_in,
output logic ready,
output logic [DATA_WIDTH-1:0] data_out
);
 
//logic [DATA_WIDTH-1:0] address;
logic [DATA_WIDTH-1:0] BSG_CONTROL;
logic [DATA_WIDTH-1:0] BSG_DATA_0;
logic [DATA_WIDTH-1:0] BSG_DATA_1;
  
  
always @(posedge SYS_CLK or negedge rst)
begin
	if(~rst)
	  begin
			BSG_CONTROL <= 'd0;
			BSG_DATA_0 <= 'd0;
			BSG_DATA_1 <= 'd0;
	  end
	else if(valid == 1'b1 && ready == 1'b1)  // Quando o host for enviar algum dado
	begin
		//address <= addr_in;
		ready <= 0;
		
		// Define o registrador que recebera o dado
		case (addr_in)
			8'h10: 
				BSG_CONTROL <= data_in;
			8'h11:
				BSG_DATA_0 <= data_in;
			8'h12:
				BSG_DATA_1 <= data_in;
		endcase
	end
end

always @(negedge valid)
begin
	ready <= 1;
end

// Envia para data_out o valor do registrado de acordo com address
always_comb
begin
	case (addr_in)
		8'h10: 
			data_out <= BSG_CONTROL & 8'h0C; // usa uma mascara pra o host ter acesso apenas aos bits 2 e 3
		8'h11:
			data_out <= BSG_DATA_0;
		8'h12:
			data_out <= BSG_DATA_1;
	endcase
end

endmodule
