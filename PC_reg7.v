module PC_reg7(dadoEntrada,habilita_escrita_local,habilita_escrita_geral,incrementaPC,Clock,dadoSaida);
  input [15:0]dadoEntrada;
  input habilita_escrita_local,habilita_escrita_geral,incrementaPC,Clock;
  output reg [15:0] dadoSaida;
  
  wire habilita = habilita_escrita_local&habilita_escrita_geral;
  
  always@(posedge Clock)begin
    if(incrementaPC & (~habilita))
      dadoSaida = dadoSaida + 1;
    else if(habilita)
      dadoSaida = dadoEntrada;
  end
endmodule