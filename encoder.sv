/*
*  @file encoder.svh
*  @data March 2017
*  @brief Implementa um codificador Gray
**/

module encoder( 
input logic G_CLK_TX,
input logic rst,
output logic q
);
  
  
  always @(posedge clock or negedge reset)
  begin 
  if (~reset)
    q <= 0;
  else
    case (q) 
      4'b0000:  q <= 4'b0000;
      4'b0001:  q <= 4'b0001;
      4'b0010:  q <= 4'b0011;
      4'b0011:  q <= 4'b0010;
      4'b0100:  q <= 4'b0110;
      4'b0101:  q <= 4'b0111;
      4'b0110:  q <= 4'b0101;
      4'b0111:  q <= 4'b0100;
      4'b1000:  q <= 4'b1100;
      4'b1001:  q <= 4'b1101;
      4'b1010:  q <= 4'b1111;
      4'b1011:  q <= 4'b1110;
      4'b1100:  q <= 4'b1010;
      4'b1101:  q <= 4'b1011;
      4'b1110:  q <= 4'b1001;
      4'b1111:  q <= 4'b1000;
      default: q <= 4'bx;
    endcase
  end
endmodule