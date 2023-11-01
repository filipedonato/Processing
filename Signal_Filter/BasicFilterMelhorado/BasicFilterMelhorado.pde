import signal.library.*; // Adicione a biblioteca ao esboço
import javax.swing.JOptionPane;  //Serve para exibir caixas de diálogo

SignalFilter meuFiltro;   // Criando o Filtro SIGNAL FILTER

// Principais parâmetros do filtro OneEuro
float minCorte = 0.05; // diminuir isso para se livrar do jitter de velocidade lenta
float beta = 4.0;  // Aumente isso para se livrar do atraso de alta velocidade

float xPos = 0;
char X;            //Opção a ser Escolhida
String X_escolhido;  //Pra exibir na tela o que foi escolhido depois
float desvioPadrao = 0.1; // Ajuste o desvio padrão do ruído gaussiano aqui

float sinalFonte, sinalFonteAnterior;
float sinalRuidoso, sinalRuidosoAnterior;
float sinalFiltrado, sinalFiltradoAnterior;

int selectedWaveform = 0; // 0: Senoidal, 1: Triangular, 2: Dente de Serra, 3: Quadrado
int selectedNoise = 0; // 0: Ruído de Perlin, 1: Ruído Gaussiano

//-----------------------------------------------------------
String showInputDialog(String message) {
  String input = "";
  while (input.equals("")) {
    input = JOptionPane.showInputDialog(null, message);
  }
  return input;
}
//--------------------------------------------------------------

void setup() {
  size(512, 700);
  background(180);
  meuFiltro = new SignalFilter(this);   // Inicializando o Filtro
  String userInput = showInputDialog("Digite P para ruído Perlin ou G para ruído Gaussiano");
  X = userInput.charAt(0); // Obtém o primeiro caractere da entrada do usuário
}

void draw() {
  // Passando os parâmetros que definimos anteriormente para o filtro
  meuFiltro.setMinCutoff(minCorte);
  meuFiltro.setBeta(beta);

  // Salvando valores anteriores (necessário para desenhar as linhas)
  sinalFonteAnterior = sinalFonte;
  sinalFiltradoAnterior = sinalFiltrado;
  sinalRuidosoAnterior = sinalRuidoso;

  // Selecionando a forma de onda com base na entrada do teclado
  if (keyPressed) {
    if (key == '1') {
      senoidal();
    } else if (key == '2') {
      triangular();
    } else if (key == '3') {
      dente_de_sera();
    } else if (key == '4') {
      quadrada();
    } else if (key == '5') {
      aleatorio();
    } 
  }
 
  if(X == 'p' || X == 'P') {
    sinalRuidoso = sinalFonte + (noise(frameCount) - 0.5) / 10.0;
    X_escolhido = "Perlim";
  }
  if (X == 'g' || X == 'G') {
  sinalRuidoso = sinalFonte + randomGaussian() * desvioPadrao;
  X_escolhido = "Gaussiano";
  }
  
 // Agora a aplicação do filtro One Euro abaixo
  // Filtrando o sinal, aplica o filtro no sinalRuidoso
  sinalFiltrado = meuFiltro.filterUnitFloat(sinalRuidoso);
  
  //----------------------------------------------------------------------
  // As linhas abaixo servem para exibir graficamente
  // O sinal original, o sinal com ruído e o sinal filtrado
  float alturaTexto = 30;
  color corFundoTexto = color(150);
  // Calcular as posições x para desenhar a linha
  float x1 = xPos-0.1;
  float x2 = xPos;  
  
  float tamanhoSecao = height / 4.0;

  // Desenhando o sinal original
  textSize(20);
  noStroke();
  fill(255);
  float yFonte1 = map(sinalFonteAnterior, 0.0, 1.0, alturaTexto, tamanhoSecao);
  float yFonte2 = map(sinalFonte, 0.0, 1.0, alturaTexto, tamanhoSecao);
  stroke(255);
  line(x1, yFonte1, x2, yFonte2);
  noStroke();
  fill(corFundoTexto);
  rect(0, 0, width, alturaTexto );
  fill(255);
  text( "Sinal Original", 10, 20 );

  // Desenhando o sinal somado com o ruído criado
  pushMatrix();
  translate(0, tamanhoSecao);
  noStroke();
  fill(255);
  float yRuidoso1 = map(sinalRuidosoAnterior, 0.0, 1.0, alturaTexto, tamanhoSecao);
  float yRuidoso2 = map(sinalRuidoso, 0.0, 1.0, alturaTexto, tamanhoSecao);
  stroke(255);
  line(x1, yRuidoso1, x2, yRuidoso2);
  noStroke();
  fill(corFundoTexto);
  rect(0, 0, width, alturaTexto );
  fill(255);
  text( "Sinal com Ruído", 10, 20 );
  popMatrix();

  // Finalmente desenhando o sinal filtrado
  pushMatrix();
  translate(0, tamanhoSecao * 2.0);
  noStroke();
  float yFiltrado1 = map(sinalFiltradoAnterior, 0.0, 1.0, alturaTexto, tamanhoSecao);
  float yFiltrado2 = map(sinalFiltrado, 0.0, 1.0, alturaTexto, tamanhoSecao);
  stroke(255);
  line(x1, yFiltrado1, x2, yFiltrado2);
  noStroke();
  fill(corFundoTexto);
  rect(0, 0, width, alturaTexto );
  fill(255);
  text( "Sinal Filtrado", 10, 20 );
  popMatrix();

  //Agora vem a Legenda
  pushMatrix();
  translate(0, tamanhoSecao * 3.0);
  noStroke();
  noStroke();
  fill(corFundoTexto);
  rect(0, 0, width, 180 );
  fill(255);
  text( "LEGENDA - APERTE UM NÚMERO DE 1 A 5 E SEGURE", 10, 20 );
  text( "1 - Para sinal Senoidal", 10, 50 );
  text( "2 - Para sinal Triangular", 10, 70 );
  text( "3 - Para sinal Dente de Serra", 10, 90 );
  text( "4 - Para sinal Quadrado", 10, 110 );
  text( "5 - Para sinal Aleatório", 10, 130 );
  text( "Ruído Escolhido: " + X_escolhido, 10, 160 );
  popMatrix();
  

  // Produza os valores para o console para depuração
  println( " " );
  println( "Sinal   = " + sinalFonte );
  println( "Ruído    = " + sinalRuidoso );
  println( "Pós Filtro = " + sinalFiltrado );
  
  // Mova o cabeçalho para a direita
  xPos += 1;

  // Ao final do gráfico vamos fazer
  if ( xPos > width ) {
    background(180); // Limpar a tela
    xPos = 0.0;      // Voltar para o início (esquerda)
  }
}
