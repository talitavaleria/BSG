/*
*  @file modulator.svh
*  @data March 2017
*  @brief Implementa bsg TOP LEVEL
**/
module bsg(
input logic G_CLK_TX,
input logic rst,
input logic WRITE_ENABLE,
input logic [DATA_WIDTH-1:0] ADDR_IN,
input logic [DATA_WIDTH-1:0] DATA_IN,
output logic [DATA_WIDTH-1:0] DATA_OUT
);
  
  input rst, enable,
  input [7:0] data_in,
  output logic[7:0] data_out
  
input logic G_CLK_TX,
input logic rst,
output logic q





module protocol #(int DATA_WIDTH = 8)(
input logic G_CLK_TX,
input logic rst,
input logic WRITE_ENABLE,
input logic [DATA_WIDTH-1:0] ADDR_IN,
input logic [DATA_WIDTH-1:0] DATA_IN,
output logic [DATA_WIDTH-1:0] DATA_OUT
);

module encoder( clock, reset, q );

module modulator(
  input g_clk_tx,
  input reset, enable,
  input [7:0] data_in,
  output logic[7:0] data_out
);
  

  modulator DUT( .g_clk_tx(clk), .reset(rst), .enable(enable), .data_in(data_in), .data_out(data_out) );

endmodule
 /*ESCREVER AQUI O TRATAMENTO DO REGISTRADOR BSG_CONTROL*/