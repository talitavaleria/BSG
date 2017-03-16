/*
*  @file modulator.svh
*  @data March 2017
*  @brief Implementa modulador msk
**/
module modulator(
  input g_clk_tx,
  input reset, enable,
  input [7:0] data_in,
  output logic[7:0] data_out
);

logic [7:0] addr;
logic phase, to_send;
logic [3:0] bit_to_send;
logic [4:0] cont_bits;
  
always_ff @( posedge g_clk_tx or negedge reset )
begin  
  
	if(~reset)
	begin
		bit_to_send = 1'b0;
		phase = 1'b0;
		cont_bits = 5'b0;
		to_send = 1'b0;
	end  
	 /* Define o endereco inicial a ser enviado */
	else if(enable) begin
		if(to_send == 1'b0 && bit_to_send < 8) begin    //se nenhum dado estiver sendo modulo
			
			/**  Define a fase do sinal a ser enviado*/
			if(bit_to_send > 0) begin
				if(data_in[bit_to_send-1] == 1'b1 && data_in[bit_to_send] == 1'b0 || data_in[bit_to_send-1] == 1'b1 && data_in[bit_to_send] == 1'b1)
					phase = ~phase;
			end
			
			/** Define o endereço inicial do envio da modulaçao **/
			if( phase == 1'b0 ) begin 	// Indica que o bit atual enviara um seno com fase = 0
				if( data_in[bit_to_send] == 1'b0 )
					addr = 8'b0;
				else if( data_in[bit_to_send] == 1'b1 )
					addr = 8'd32;

			end
			else if (phase == 1'b1) begin // Indica que o bit atual enviara um seno com fase = pi
				if( data_in[bit_to_send] == 1'b0 )
					addr = 8'd64;
				else if( data_in[bit_to_send] == 1'b1 )
					addr = 8'd96;
			end
			/** FIM - Definiçao de endereço **/
			
			to_send = 1'b1;
			
		end
		// Se houver algum dado a ser enviado
		if(to_send == 1'b1 )begin
			case(addr)
				// bit = 0, fase = 0
				0 : data_out = 128;
				1 : data_out = 154;
				2 : data_out = 178;
				3 : data_out = 201;
				4 : data_out = 220;
				5 : data_out = 236;
				6 : data_out = 247;
				7 : data_out = 254;
				8 : data_out = 255;
				9 : data_out = 251;
				10 : data_out = 242;
				11 : data_out = 228;
				12 : data_out = 211;
				13 : data_out = 190;
				14 : data_out = 166;
				15 : data_out = 141;
				16 : data_out = 115;
				17 : data_out = 90;
				18 : data_out = 66;
				19 : data_out = 45;
				20 : data_out = 28;
				21 : data_out = 14;
				22 : data_out = 5;
				23 : data_out = 1;
				24 : data_out = 2;
				25 : data_out = 9;
				26 : data_out = 20;
				27 : data_out = 35;
				28 : data_out = 55;
				29 : data_out = 78;
				30 : data_out = 102;
				31 : data_out = 128;
				
				
				//dado = 1, fase = 0
				32 : data_out = 128;
				33 : data_out = 141;
				34 : data_out = 154;
				35 : data_out = 166;
				36 : data_out = 178;
				37 : data_out = 190;
				38 : data_out = 200;
				39 : data_out = 211;
				40 : data_out = 220;
				41 : data_out = 228;
				42 : data_out = 236;
				43 : data_out = 242;
				44 : data_out = 247;
				45 : data_out = 251;
				46 : data_out = 254;
				47 : data_out = 255;
				48 : data_out = 255;
				49 : data_out = 254;
				50 : data_out = 251;
				51 : data_out = 247;
				52 : data_out = 242;
				53 : data_out = 236;
				54 : data_out = 228;
				55 : data_out = 220;
				56 : data_out = 211;
				57 : data_out = 201;
				58 : data_out = 190;
				59 : data_out = 178;
				60 : data_out = 166;
				61 : data_out = 154;
				62 : data_out = 141;
				63 : data_out = 128;
				
				//dado = 0, fase = pi
				64 : data_out = 128;
				65 : data_out = 102;
				66 : data_out = 78;
				67 : data_out = 55;
				68 : data_out = 36;
				69 : data_out = 20;
				70 : data_out = 9;
				71 : data_out = 2;
				72 : data_out = 1;
				73 : data_out = 5;
				74 : data_out = 14;
				75 : data_out = 28;
				76 : data_out = 45;
				77 : data_out = 66;
				78 : data_out = 90;
				79 : data_out = 115;
				80 : data_out = 141;
				81 : data_out = 166;
				82 : data_out = 190;
				83 : data_out = 211;
				84 : data_out = 228;
				85 : data_out = 242;
				86 : data_out = 251;
				87 : data_out = 255;
				88 : data_out = 253;
				89 : data_out = 247;
				90 : data_out = 236;
				91 : data_out = 220;
				92 : data_out = 200;
				93 : data_out = 178;
				94 : data_out = 153;
				95 : data_out = 128;
				
				//dado = 1, fase = pi
				96 : data_out = 128;
				97 : data_out = 115;
				98 : data_out = 102;
				99 : data_out = 90;
				100 : data_out = 77;
				101 : data_out = 66;
				102 : data_out = 55;
				103 : data_out = 45;
				104 : data_out = 36;
				105 : data_out = 28;
				106 : data_out = 20;
				107 : data_out = 14;
				108 : data_out = 9;
				109 : data_out = 5;
				110 : data_out = 2;
				111 : data_out = 1;
				112 : data_out = 1;
				113 : data_out = 2;
				114 : data_out = 5;
				115 : data_out = 9;
				116 : data_out = 14;
				117 : data_out = 20;
				118 : data_out = 28;
				119 : data_out = 36;
				120 : data_out = 45;
				121 : data_out = 55;
				122 : data_out = 66;
				123 : data_out = 77;
				124 : data_out = 90;
				125 : data_out = 102;
				126 : data_out = 115;
				127 : data_out = 128;
				
			endcase
			if(cont_bits + 1'b1 <= 31) begin
				cont_bits += 5'b1;
				addr += 5'b1;
			end
			else if(bit_to_send < 4'd8)begin
				cont_bits = 5'b0;
				addr = 5'b0;
				to_send = 1'b0;
				bit_to_send += 1'b1;
			end
		end	
	end

end

  
endmodule
