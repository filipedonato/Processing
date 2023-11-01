/* Demonstra o controle dos pinos digitais de uma placa Arduino com o firmware
Firmata.
Clique nos quadrados para ativar o pino digital correspondente do Arduino.  
HIGH (5 volts) e LOW (0 volts)

Lembrando antes de carregar o exemplo StandardFirmata 
para a sua placa Arduino e observe a lista de portas seriais impressa na
área de mensagem abaixo ou no Gerenciador de Dispositivos */

import processing.serial.*;
import javax.swing.JOptionPane;
import cc.arduino.*;

Arduino arduino;

color off = color(4, 79, 111);
color on = color(84, 145, 158);

int[] values = { Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW,
 Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW, Arduino.LOW };
 
//-----------------------------------------------------------
String showInputDialog(String message) {
  String input = "";
  while (input.equals("")) {
    input = JOptionPane.showInputDialog(null, message);
  }
  return input;
}
//-----------------------------------------------------------

void setup() {
  size(470, 200);   //Tamanho da janela

  int portaCOM = 0;
  
  while (true) {
    String input = showInputDialog("Digite o número da COM que o Arduino está conectado:");
    
    try {
      portaCOM = int(input);
      arduino = new Arduino(this, "COM" + portaCOM, 57600);
      break; // Saia do loop se a porta serial for aberta com sucesso
    } catch (RuntimeException e) {
      input = showInputDialog("ERRO DE PORTA! Certifique-se de que o Arduino está conectado e a porta é válida.");
    }
  }
  
  // Defina os pinos digitais do Arduino como saídas.
  for (int i = 0; i <= 13; i++)
    arduino.pinMode(i, Arduino.OUTPUT);
}

void draw() {
  background(off);
  stroke(on);
  
  for (int i = 0; i <= 13; i++) {
    if (values[i] == Arduino.HIGH)
      fill(on);
    else
      fill(off);
      
    rect(420 - i * 30, 30, 20, 20);
  }
}

void mousePressed() {
  int pin = (450 - mouseX) / 30;
  
  // Ativa o pino correspondente ao quadrado clicado.
  if (values[pin] == Arduino.LOW) {
    arduino.digitalWrite(pin, Arduino.HIGH);
    values[pin] = Arduino.HIGH;
  } else {
    arduino.digitalWrite(pin, Arduino.LOW);
    values[pin] = Arduino.LOW;
  }
}
