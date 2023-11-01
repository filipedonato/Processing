int pino_lm35 = 2;       //Pino que vai estar conectado
float val_leitura = 0;

void lm_35() {
  arduino.pinMode(pino_lm35, Arduino.INPUT);       
  // Valor da temperatura convertido ou ajustado
  val_leitura = arduino.analogRead(pino_lm35)*(0.48); 
  delay(100);
  
 //LM35 MENU---------------------------------------------
 fill(0);                        // Cor de Preenchimento preto
 text("Sensor LM35", 0,380);  //Escreve o texto nessa posição
 text("Temperatura = ", 0, 405);   
 fill(0, 0, 255, 20);            // Cor do objeto abaixo
 rect(0,382,240,40);            // Desenha um retângulo
 fill(0,210,0);                  // Cor do que vem abaixo
 text(val_leitura, 140, 405);         // Exibe na tela o valor do Potenciômetro 2
 text("°C", 215, 405);        // Texto nessa posição
}

  
