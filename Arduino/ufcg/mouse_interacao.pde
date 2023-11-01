boolean clicado2 = false;
boolean clicado3 = false;


void mouse_interacao() {
  
// Menu de aquisição de dados--------------------------------------------
 image(clicado2? click : clickON, 450,245, width/12, height/9); //posição a exibir e tamanho redimensionado
 textSize(22);                      // Define o tamanho da fonte
 fill(0);                           // Cor de preenchimento preta
 text("Gravar Dados\n Luz:", 300,270);       // Escreve o texto
 
 if (mousePressed && mouseX>450 && mouseX<520 && mouseY>254 && mouseY<292) {
  clicado2 = true;
  output1.println(val_LDR + "\n");   //Exemplo que ele vai gravar o valor do potenciômetro 2 para a turma A
  output1.flush();
  //output.close();
  delay(50);
 }
 else { 
      clicado2=false;
      image(click, 450,245, width/12, height/9);
 }

 
 image(clicado3? click : clickON, 450,350, width/12, height/9); //posição a exibir e tamanho redimensionado
 textSize(22);                      // Define o tamanho da fonte
 fill(0);                           // Cor de preenchimento preta
 text("Gravar Dados\n Temperatura:", 300,380);       // Escreve o texto
 if (mousePressed && mouseX>450 && mouseX<520 && mouseY>360 && mouseY<400) {
  clicado3 = true;
  output2.println(val_leitura + "\n"); //Exemplo que ele vai gravar o valor da temp do lm35 para a turma B
  output2.flush();
  delay(50);
 }
 else { 
      clicado3=false;
      image(click, 450,350, width/12, height/9);
 }
}
 
 
