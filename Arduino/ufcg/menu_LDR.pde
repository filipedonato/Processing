int pinoLDR = 0;       //Pino que vai estar conectado (A0=0)
float val_LDR = 0;     //Valor inicial

void menu_LDR() {
   arduino.pinMode(pinoLDR, Arduino.INPUT); 
   //O valor abaixo pode aparecer decrescente
   val_LDR = arduino.analogRead(pinoLDR); 
   delay(20);
   println(val_LDR, "     ");
  
//LDR MENU---------------------------------------------
 fill(0);                         // Cor de Preenchimento preto
 text("Sensor de Luz", 0,270);    //Escreve o texto nessa posição
 text("Luminosidade = ", 0, 300); //Escreve o texto nessa posição
 fill(0, 0, 255, 20);            // Cor do objeto abaixo
 rect(0,272,270,40);             // Desenha um retângulo
 fill(0,210,0);                  // Cor do que vem abaixo
 text(val_LDR, 150, 300);        // Exibe na tela o valor do LDR
 text("Lm", 240, 300);           // Unidade
}

 
 
