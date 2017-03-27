/*
*  @file modulator.svh
*  @data March 2017
*  @brief Implementa bsg TOP LEVEL
**/
module bsg #(parameter DATA_WIDTH = 8)(
input logic G_CLK_TX,
input logic rst,
input logic WRITE_ENABLE,
input logic [DATA_WIDTH-1:0] addr_in,
input logic [DATA_WIDTH-1:0] data_in,
output logic [DATA_WIDTH-1:0] data_out
);
  
logic enable, q;

//module encoder( clock, reset, q );

modulator DUT( .G_CLK_TX(G_CLK_TX), .reset(rst), .enable(enable), .data_in(data_in), .data_out(data_out) );

endmodule
 /*ESCREVER AQUI O TRATAMENTO DO REGISTRADOR BSG_CONTROL*/