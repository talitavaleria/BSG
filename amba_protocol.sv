/*
*  @file amba_protocol.svh
*  @data March 2017
*  @brief Implementa o protocolo AMBA
**/

module amba_protocol #(int DATA_WIDTH = 8)(
input logic G_CLK_TX,
input logic rst,
input logic VALID_IN,
input logic [DATA_WIDTH-1:0] ADDR_IN,
input logic [DATA_WIDTH-1:0] DATA_IN,
output logic READY_OUT,
output logic VALID_OUT,
output logic [DATA_WIDTH-1:0] DATA_OUT
);
  
  logic FLAG_ADDR;
  logic READY_IN;
  logic [DATA_WIDTH-1:0] ADDRESS;
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
        end
    end
  
  always @(posedge VALID_IN)
    begin
      
      if(FLAG_ADDR == 0)
      begin
        ADDRESS <= ADDR_IN;
        READY_IN <= 0;
        FLAG_ADDR <= 1;
      end
      else
        begin  
        FLAG_ADDR <= 0;
        READY_IN <= 0; 
        case (ADDRESS)
        	8'h10: 
        	  BSG_CONTROL <= DATA_IN;
        	8'h11:
          	  BSG_DATA_0 <= DATA_IN;
        	8'h12:
          	  BSG_DATA_1 <= DATA_IN;
        		default:
              	begin
            		BSG_CONTROL <= 'd0;
        			BSG_DATA_0 <= 'd0;
        			BSG_DATA_1 <= 'd0;
              	end
      	endcase
      end
      
    end
      
  always @(negedge VALID_IN)
    begin
      
       READY_IN <= 1;
      
    end

  
endmodule