void desenhaVoltimetro_9() {
  float valor_convertido = valVolts * (8000.0/3.3);
  fill(0);
  textSize(30);
  text("VOLTÍMETRO DIGITAL", 300, 210);
  textSize(22);
  text("0  0.8k  1.8k  3k    4k     5k    6k    7k    8k", 255, 245);
  textSize(30);
  text("Tensão = " + nf(valor_convertido/1000, 0, 3) + " KV", 300, 320);
  fill(0,200,200,100); //cor rgb e transparencia
  rect(250, 165, 348, 180, 10); //Retangulo com posição, tamanho e borda
  
  //Desenhar o Voltimetro
  float voltagemMaxima = 3.3; // Defina a voltagem máxima que o voltímetro pode mostrar
  float comprimentoVoltimetro = map(valVolts, 0, voltagemMaxima, 0, 330); // Mapeia o valor da voltagem para o comprimento do voltímetro
  desenharVoltimetro9(260, 250, comprimentoVoltimetro, 30);
  
  //Menu de aquisição de dados-----------------------------------------------------------------------
  boolean clicado = false;
  image(clicado ? click : clickON, 440,425, width/8, height/8); //posição a exibir e tamanho redimensionado
  textSize(22);                      // Define o tamanho da fonte
  fill(0);                           // Cor de preenchimento preta
  text("Gravar Dados:", 300,470);       // Escreve o texto
  if (mousePressed && mouseX>440 && mouseX<500 && mouseY>430 && mouseY<485) {
  clicado = true;
  output1.println(valor_convertido + "\n");   //Exemplo que ele vai gravar o valor da tensão
  output1.flush();
  delay(10);
  }
  else { 
      clicado=false;
      image(click, 440,427, width/8, height/8);
  } 
  //-------------------------------------------------------------------------------------------------
}
  
  void desenharVoltimetro9(float x, float y, float comprimento, float altura) {
  fill(150); //Desenha a base do voltímetro
  rect(x, y, 330, altura);
  fill(255, 0, 0); //cor vermelha para o ponteiro
  rect(x, y, comprimento, altura); //Desenha o ponteiro do voltímetro
}
