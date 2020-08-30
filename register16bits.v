module register16bits(dadoEntrada,habilita_escrita_individual,habilita_escrita_geral,Clock,dadoSaida);
  parameter n = 16;
  input [n-1:0]dadoEntrada;
  input habilita_escrita_individual,habilita_escrita_geral,Clock;
  output reg [n-1:0]dadoSaida;
  always@(posedge Clock)begin
    if(habilita_escrita_individual&habilita_escrita_geral == 1)
      dadoSaida = dadoEntrada;
  end
endmodule