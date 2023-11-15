boolean isClicked1 = false;
boolean isClicked2 = false;
boolean isClicked3 = false;


int botoes(){
  textSize(30);
  text("Tensão Máxima", 20, 400);
  
  textSize(22);
  fill(isClicked1 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 430, 35, 35);
  text("150 KV ------- RM=280 MΩ", 60, 440);
  
  fill(isClicked2 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 480, 35, 35);
  text("300 kV ---- 2*RM=560 MΩ", 60, 490);
  
  fill(isClicked3 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 530, 35, 35);
  text("450 kV ---- 3*RM=840 MΩ", 60, 540);
  
 
  
 return selecionado;
} 

  void mousePressed() {
  if (dist(mouseX, mouseY, 30, 430) < 20) {
    isClicked1 = true; // Marca o botão 1 como clicado
    selecionado = 1;
    isClicked2 = false; isClicked3 = false; 
  } else if (dist(mouseX, mouseY, 30, 480) < 20) {
    isClicked2 = true; // Marca o botão 2 como clicado
    selecionado = 2;
    isClicked1 = false; isClicked3 = false;  
  }else if (dist(mouseX, mouseY, 30, 530) < 20) {
    isClicked3 = true; // Marca o botão 2 como clicado
    selecionado = 3;
    isClicked1 = false; isClicked2 = false; 
}
  }
