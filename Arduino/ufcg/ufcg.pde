//DECLARAÇÕES DE BILIOTECAS E VARIAVEIS
import processing.serial.*; // Carrega a biblioteca Serial na pasta Libraries do Processing
import cc.arduino.*;        // Carrega a biblioteca Arduino na pasta desse projeto
Arduino arduino;            //Criou esse objeto para poder utilizar as funções da biblioteca do arduino
Table tabela;
PImage ufcg_logo, powerON, powerOFF, click, clickON; //serve para as imagens
PFont fonte; //serve para mudar a fonte do programa
PrintWriter output1, output2;

void setup() {
  size(600,500);  //Tamanho da Janela
  smooth();       // Habilita o anti-aliasing

  ufcg_logo  = loadImage("ufcg_logo.png"); //Foto da ufcg carregou o arquivo
  powerON    = loadImage("powerON.png");
  powerOFF   = loadImage("powerOFF.png");
  click      = loadImage("click.png");
  clickON    = loadImage("clickON.png");
  fonte      = loadFont("Cambria-16.vlw");
  output1     = createWriter("data/dados_1.txt"); 
  output2     = createWriter("data/dados_2.txt"); 

arduino = new Arduino(this, "COM4", 9600);  // Comunicacao com Arduino na velocidade

arduino.pinMode(0, Arduino.INPUT);           // Define o pino 0 como entrada para o LDR
arduino.pinMode(1, Arduino.INPUT);           // não utilizado
arduino.pinMode(2, Arduino.INPUT);           // Define o pino 2 como entrada para o LM35
arduino.pinMode(3, Arduino.INPUT);          // não utilizado
arduino.pinMode(4, Arduino.INPUT);          // não utilizado
arduino.pinMode(5, Arduino.INPUT);          // não utilizado
}

void draw() {
  background(250); //Cor do fundo da tela
  cabecalho(); 
  menu_LDR();
  lm_35();
  mouse_interacao();
  // Foi tudo feito em funções nas abas, daí é só chamar cada uma delas mantendo a organização
}
