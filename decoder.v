module decoder(enderecoReg,interruptores);
  input[2:0] enderecoReg;
  output [7:0]interruptores;
  wire [7:0]temporario = 1;
  assign interruptores = temporario<<enderecoReg; 
   
endmodule