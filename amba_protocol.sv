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
  
logic flag_addr;
logic ready_in;
logic [DATA_WIDTH-1:0] address;
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
	else if(valid == 1'b1) //sincronizar o valid com o SYS_CLK
	begin
		if(ready == 1'b1)
		begin
			address <= addr_in;
			ready <= 0;
		end
	end
end
  
  
/*always @(posedge valid_in)
begin      
	if(ready == 1'b1)
	begin
	  address <= addr_in;
	  ready <= 0;
	end
	else
	  begin
	  
	  flag_addr <= 0;
	  ready_in <= 0; 
	  
	  case (address)
		8'h10: 
			BSG_CONTROL <= data_in;
		8'h11:
			BSG_DATA_0 <= data_in;
		8'h12:
			BSG_DATA_1 <= data_in;
		default:
			begin
				BSG_CONTROL <= 'd0;
				BSG_DATA_0 <= 'd0;
				BSG_DATA_1 <= 'd0;
			end
		endcase
	end
		
end  */
      
/*always @(negedge valid)
begin
	ready_in <= 1;
end*/


always_comb
begin
	case (address)
		8'h10: 
			data_out <= BSG_CONTROL;
		8'h11:
			data_out <= BSG_DATA_0;
		8'h12:
			data_out <= BSG_DATA_1;
		default:
			data_out = 8'b0;
		endcase

end

endmodule
