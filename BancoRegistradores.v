module BancoRegistradores(Read1,Read2,WriteReg,WriteData,RegWrite,Data1,Data2,clock,incr_pc);
  
  input [2:0] Read1,Read2,WriteReg; // os números dos registradores para leitura e escrita (3 bits)
  input [15:0] WriteData; // dados para escrever (16 bits)
  input RegWrite /*O controle de escrita*/, clock, incr_pc;/*Contador de programa*/
  output [15:0] Data1, Data2;  // os valores dos registradores lidos (16 bits)
  
  wire [7:0] interruptores; // mostra qual é o registrador a ser escrito       
  wire [15:0] register [7:0]; // 8 registradores de 16 bits
  
  decoder seleciona(WriteReg,interruptores); 
  register16bits register0(WriteData, interruptores[0],RegWrite,clock,register[0]);
  register16bits register1(WriteData, interruptores[1],RegWrite,clock,register[1]);
  register16bits register2(WriteData, interruptores[2],RegWrite,clock,register[2]);
  register16bits register3(WriteData, interruptores[3],RegWrite,clock,register[3]);
  register16bits register4(WriteData, interruptores[4],RegWrite,clock,register[4]);
  register16bits register5(WriteData, interruptores[5],RegWrite,clock,register[5]);
  register16bits register6(WriteData, interruptores[6],RegWrite,clock,register[6]);
  PC_reg7 marginalxl_4567sfd(WriteData, interruptores[7],RegWrite,incr_pc,clock,register[7]);
    
  assign Data1 = register[Read1]; //Rs
  assign Data2 = register[Read2]; //Rt
  
endmodule  input [15:0]dadoEntrada,valorAtual;
  input habilita_escrita,incrementaPC,Clock;
  output reg [15:0] dadoSaida;
  
  always@(posedge Clock)begin
    if(habilita_escrita == 1)
      dadoSaida = dadoEntrada;
    else if(incrementaPC == 1)
      dadoSaida = valorAtual + 1;
  end
endmodule