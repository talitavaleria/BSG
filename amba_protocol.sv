/*
*  @file amba_protocol.svh
*  @data March 2017
*  @brief Implementa o protocolo de comunicacao
**/

module protocol #(int DATA_WIDTH = 8)(
input logic G_CLK_TX,
input logic rst,
input logic WRITE_ENABLE,
input logic [DATA_WIDTH-1:0] ADDR_IN,
input logic [DATA_WIDTH-1:0] DATA_IN,
output logic [DATA_WIDTH-1:0] DATA_OUT
);
  
  encoder enconder_instance ( .G_CLK_TX(G_CLK_TX), .rst(rst), .q(DATA_OUT) );
  
  logic [DATA_WIDTH-1:0] BSG_CONTROL;
  logic [DATA_WIDTH-1:0] BSG_DATA_0;
  logic [DATA_WIDTH-1:0] BSG_DATA_1;
  
  
always @(posedge G_CLK_TX or negedge rst)
begin
      
	if(~rst)
	begin
		BSG_CONTROL <= 'd0;
		BSG_DATA_0 <= 'd0;
		BSG_DATA_1 <= 'd0;
		DATA_OUT <= 'd0;
	end
	else if(WRITE_ENABLE == 1)
		case (ADDR_IN)
			8'h10: 
				  DATA_OUT <= BSG_CONTROL;
			8'h11:
				  DATA_OUT <= BSG_DATA_0;
			8'h12:
				  DATA_OUT <= BSG_DATA_1;
			/*default: Nao pode ter esse default, porque o endereço eh compartilhado com a TPU e o BD
					DATA_OUT <= 'd0;*/
		endcase
	else
	  case (ADDR_IN)
			8'h10: 
				  BSG_CONTROL <= DATA_IN;
			8'h11:
				  BSG_DATA_0 <= DATA_IN;
			8'h12:
				  BSG_DATA_1 <= DATA_IN;
			/*default: Nao pode ter esse default, porque o endereço eh compartilhado com a TPU e o BD
				begin
					BSG_CONTROL <= 'd0;
					BSG_DATA_0  <= 'd0;
					BSG_DATA_1  <= 'd0;
				end*/
	endcase
		
end
	 
endmodule


 
