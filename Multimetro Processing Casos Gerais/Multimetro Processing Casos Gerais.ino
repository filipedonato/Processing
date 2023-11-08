#include "esp_wifi.h"     //serve só pra desativar o wifi
#include "esp_bt.h"       //serve só pra desativar o BT
#include "esp_bt_main.h"  //serve só pra desativar o BT

//const serve para prevenir de mudar a variavel pelo código
const int porta1 = 34; //porta do ADC1
const int porta2 = 27; //porta do ADC2

int porta1ValorAnalogico;
int porta1ValorMilivolts;
int porta2ValorAnalogico;
int porta2ValorMilivolts;

void setup() {
  Serial.begin(9600); //Inicializa e define a velocidade da serial
  analogReadResolution(12); //Define a resolução para 12 bits (0-4095) 
  analogSetWidth(12);
  analogSetAttenuation(ADC_11db); //Define a tensão de leitura em e 3.1V

  esp_wifi_stop();            //serve só pra desativar o wifi
  esp_bluedroid_disable();    //serve só pra desativar o BT
  esp_bt_controller_disable();//serve só pra desativar o BT
  pinMode(2,OUTPUT);          //serve para ativar o LED
}

void loop() {
  porta1ValorAnalogico = analogRead(porta1);          //Ler em analogico
  porta1ValorMilivolts = analogRead(porta1)*3150/4095;//Ler em milivolts
  porta2ValorAnalogico = analogRead(porta2);          //Ler em analogico
  porta2ValorMilivolts = analogRead(porta2)*3150/4095;//Ler em milivolts
  delay(100);
  //Indicativo que chegou no fundo da escala
  if (porta1ValorAnalogico >= 4095) {
    digitalWrite(2, HIGH); // Acende o LED
  } else {
    digitalWrite(2, LOW); // Apaga o LED
  }

  //Calcula a média das leituras pra melhorar a linearidade
  float mediaMilivolts = ((porta1ValorMilivolts + porta2ValorMilivolts) / 2.0);

  // Imprime a média na serial
  Serial.printf("Media dos dois conversores AD em mV =");
  Serial.println(mediaMilivolts);
  Serial.printf("ADC1 Valor = %d \n",porta1ValorAnalogico);
  Serial.printf("ADC2 Valor = %d \n",porta2ValorAnalogico);
  uint8_t freq = ESP.getCpuFreqMHz(); //serve só pra ver o clock da cpu do ESP32
  Serial.printf("Clock do ESP = %d \n", freq); //Em MHz
  Serial.printf("\n");

  
}
