/*
*  @file registers.sv
*  @data March 2017
*  @brief Banco de registradores do BSG
**/

module registers #(parameter DATA_WIDTH = 8)(
input SYS_CLK,
input rst,
input read_flag,
input write_flag,
input [DATA_WIDTH-1:0] amba_addr,
input [DATA_WIDTH-1:0] data_in,
output logic [DATA_WIDTH-1:0] data_out
);

general_register BSG_CONTROL( .SYS_CLK(SYS_CLK), .rst(rst), .read_flag(read_flag), .write_flag(write_flag), .reg_addr(8'h10), .amba_addr(amba_addr), .data_in(data_in), .data_out(data_out) );

general_register BSG_DATA_0( .SYS_CLK(SYS_CLK), .rst(rst), .read_flag(read_flag), .write_flag(write_flag), .reg_addr(8'h11), .amba_addr(amba_addr), .data_in(data_in), .data_out(data_out) );

general_register BSG_DATA_1( .SYS_CLK(SYS_CLK), .rst(rst), .read_flag(read_flag), .write_flag(write_flag), .reg_addr(8'h12), .amba_addr(amba_addr), .data_in(data_in), .data_out(data_out) );

endmodule
