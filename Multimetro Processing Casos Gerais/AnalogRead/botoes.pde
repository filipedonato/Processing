boolean isClicked1 = false;
boolean isClicked2 = false;
boolean isClicked3 = false;
boolean isClicked4 = false;
boolean isClicked5 = false;
boolean isClicked6 = false;
boolean isClicked7 = false;
boolean isClicked8 = false;
boolean isClicked9 = false;
boolean isClicked10 = false;
boolean isClicked11 = false;
boolean isClicked12 = false;
boolean isClicked13 = false;
boolean isClicked14 = false;
boolean isClicked15 = false;

int botoes(){
  textSize(30);
  text("Tensão Máxima", 20, 160);
  textSize(20);
  fill(isClicked1 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 180, 25, 25);
  text("25 V -------- RM=39K Ω", 50, 188);
  
  fill(isClicked2 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 210, 25, 25);
  text("65 V -------- RM=100K Ω", 50, 218);
  
  fill(isClicked3 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 240, 25, 25);
  text("125 V ------ RM=220K Ω", 50, 248);
  
  fill(isClicked4 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 270, 25, 25);
  text("250 V ------ RM=390K Ω", 50, 278);
  
  fill(isClicked5 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 300, 25, 25);
  text("500 V ------ RM=820K Ω", 50, 308);
  
  fill(isClicked6 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 330, 25, 25);
  text("1000 V ----- RM=1.8M Ω", 50, 338);
  
  fill(isClicked7 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 360, 25, 25);
  text("2000 V ----- RM=3.3M Ω", 50, 368);
  
  fill(isClicked8 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 390, 25, 25);
  text("4000 V ----- RM=6.8M Ω", 50, 398);
  
  fill(isClicked9 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 420, 25, 25);
  text("8000 V ----- RM=14M Ω", 50, 428);
  
  fill(isClicked10 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 450, 25, 25);
  text("16000 V ---- RM=27M Ω", 50, 458);
  
  fill(isClicked11 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 480, 25, 25);
  text("32000 V ---- RM=53M Ω", 50, 488);
  
  fill(isClicked12 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 510, 25, 25);
  text("64000 V ---- RM=108M Ω", 50, 518);
  
  fill(isClicked13 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 540, 25, 25);
  text("128000 V --- RM=217M Ω", 50, 548);
  
  fill(isClicked14 ? color(255, 0, 0) : color(0, 0, 100)); // Muda a cor do botão dependendo se está clicado ou não
  ellipse(30, 570, 25, 25);
  text("150000 V --- RM=250M Ω", 50, 578);
  
 return selecionado;
} 

  void mousePressed() {
  if (dist(mouseX, mouseY, 30, 180) < 20) {
    isClicked1 = true; // Marca o botão 1 como clicado
    selecionado = 1;
    isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  } else if (dist(mouseX, mouseY, 30, 210) < 20) {
    isClicked2 = true; // Marca o botão 2 como clicado
    selecionado = 2;
    isClicked1 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 240) < 20) {
    isClicked3 = true; // Marca o botão 2 como clicado
    selecionado = 3;
    isClicked1 = false; isClicked2 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 270) < 20) {
    isClicked4 = true; // Marca o botão 2 como clicado
    selecionado = 4;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked5 = false; isClicked6 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 300) < 20) {
    isClicked5 = true; // Marca o botão 2 como clicado
    selecionado = 5;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked6 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 330) < 20) {
    isClicked6 = true; // Marca o botão 2 como clicado
    selecionado = 6;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked7 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 360) < 20) {
    isClicked7 = true; // Marca o botão 2 como clicado
    selecionado = 7;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 390) < 20) {
    isClicked8 = true; // Marca o botão 2 como clicado
    selecionado = 8;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 420) < 20) {
    isClicked9 = true; // Marca o botão 2 como clicado
    selecionado = 9;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 450) < 20) {
    isClicked10 = true; // Marca o botão 2 como clicado
    selecionado = 10;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked9 = false; isClicked11 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 480) < 20) {
    isClicked11 = true; // Marca o botão 2 como clicado
    selecionado = 11;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked12 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 510) < 20) {
    isClicked12 = true; // Marca o botão 2 como clicado
    selecionado = 12;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked13 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 540) < 20) {
    isClicked13 = true; // Marca o botão 2 como clicado
    selecionado = 13;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false;
    isClicked14 = false; isClicked15 = false; 
  }else if (dist(mouseX, mouseY, 30, 570) < 20) {
    isClicked14 = true; // Marca o botão 2 como clicado
    selecionado = 14;
    isClicked1 = false; isClicked2 = false; isClicked3 = false; isClicked4 = false; isClicked5 = false; isClicked6 = false;
    isClicked7 = false; isClicked8 = false; isClicked9 = false; isClicked10 = false; isClicked11 = false; isClicked12 = false;
    isClicked13 = false; isClicked15 = false; 
  }
}
