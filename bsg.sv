/*
*  @file modulator.svh
*  @data March 2017
*  @brief Implementa bsg TOP LEVEL
**/
module bsg(
input SYS_CLK, G_CLK_TX, rst, valid,
input [DATA_WIDTH-1:0] addr_in,
input [DATA_WIDTH-1:0] data_in,
output logic ready,
output logic [DATA_WIDTH-1:0] amba_data_out
);

registers REG_CORE();

amba_protocol AMBA();

encoder ENC();

bsg_control_core BSG_CONTROL();
  
endmodule
