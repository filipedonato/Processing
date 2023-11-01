/* Demonstra a leitura de pinos digitais e analógicos de uma placa Arduino
   executando o firmware StandardFirmata.
    Para usar:
    Usando o software Arduino, faça o upload do exemplo StandardFirmata (localizado
    em Exemplos > Firmata > StandardFirmata) na sua placa Arduino.
    Execute este sketch e observe a lista de portas seriais impressa na
    área de mensagens abaixo. 
    Anote o índice da porta correspondente à sua placa Arduino 
    Modifique a linha "arduino = new Arduino(...)" abaixo, alterando o número
    em Arduino.list()[0] para o número correspondente à porta serial da
    sua placa Arduino. Alternativamente, você pode substituir Arduino.list()[0]
    pelo nome da porta serial, entre aspas duplas, por exemplo, "COM5" no Windows.
    Execute este sketch. Os quadrados mostram os valores das entradas digitais (pinos ALTOS
    estão preenchidos, pinos BAIXOS não estão). Os círculos mostram os valores das
    entradas analógicas (quanto maior o círculo, maior a leitura no
    pino de entrada analógica correspondente). Os pinos são dispostos como se o Arduino
    estivesse com o logotipo para cima (ou seja, o pino 13 está no canto superior esquerdo).
    Observe que as leituras dos pinos não conectados flutuarão aleatoriamente.
*/

import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

void setup() {
  size(470, 280);
  // Imprime as portas seriais disponíveis.
  println(Arduino.list());
  
  // Modifica esta linha, mudando o "0" para o índice da porta série
  // porta serial correspondente à sua placa Arduino (como ela aparece na lista
  // impressa pela linha acima).
  //arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino = new Arduino(this, "COM4", 57600);
  
  
  // Defina os pinos digitais do Arduino como entradas.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.INPUT);
}

void draw() {
  background(0,255,255);
  stroke(on);
  
  // Desenhe uma caixa preenchida para cada pino digital que seja ALTO (5 volts).
  for (int i = 0; i <= 13; i++) {
    if (arduino.digitalRead(i) == Arduino.HIGH)
      fill(on);
    else
      fill(off);
      
    rect(420 - i * 30, 30, 20, 20);
  }

  // Desenhe um círculo cujo tamanho corresponde ao valor de uma entrada analógica.
  noFill();
  for (int i = 0; i <= 5; i++) {
    ellipse(280 + i * 30, 240, arduino.analogRead(i) / 16, arduino.analogRead(i) / 16);
  }
}
