/*
*  @file bsg_control_core.sv
*  @data March 2017
*  @brief Implementa a maquina de estados do BSG
**/

module bsg_control_core(
	input logic clk, in, reset,
	output logic[1:0]out);
	
	logic[1:0]state;
   parameter S0 = 0, S1 = 1, S2 = 2;
	
always @ (state) begin
case (state)
S0:
   out = 2'b01;
S1:
   out = 2'b10;
S2:
   out = 2'b11;
default:
   out = 2'b00;
endcase
end

always @ (posedge clk or posedge reset) begin
if (reset)
state <= S0;
else
case (state)
   S0:
      state <= S1;
   S1:
      if (in)
         state <= S2;
      else
         state <= S1;
   S2:
      if (in)
         state <= S0;
      else
         state <= S1;
endcase
end

endmodule
