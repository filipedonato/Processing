import processing.serial.*;
import javax.swing.JOptionPane;

Serial porta;
String val1 = "";
String val2 = "";
String val3 = "";
String val4 = "";
float valVolts, valVolts2, valVolts3, valVoltsOriginal;
PImage ufcg_logo, click, clickON;
PrintWriter output1;
int selecionado = 0;

void setup() {
  size(605, 600);
  ufcg_logo = loadImage("ufcg_logo.png"); // Foto da ufcg carregou o arquivo
  click     = loadImage("click.png");
  clickON   = loadImage("clickON.png");
  output1   = createWriter("data/DADOS_OBTIDOS.txt");
  
  printArray(Serial.list()); // imprime as portas COM disponíveis
  
  int COM = 0;
  Object[] options = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12" };
    String caixa1 = (String) JOptionPane.showInputDialog(null, "Escolha a porta COM que o Arduino está conectado:", "Informação", JOptionPane.PLAIN_MESSAGE, null, options, options[0]);
    try {
      COM = int(caixa1);
      porta = new Serial(this, "COM" + COM, 9600);  //usa a opção escolhida aqui
        } catch (RuntimeException e) {
      //Se der errado vai exibir essa mensagem abaixo
      int selectedOption = JOptionPane.showOptionDialog(null, "Porta errada! Abra o programa novamente", "Escolha novamente", JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, null, new Object[] {"OK"}, null);
      }   
  }
  
void draw() {
  background(250);
  fill(0);
  valVoltsOriginal = (((valVolts2+valVolts3)*3150/4095)/2)/1000;
  delay(250);
 
//Essas condições abaixo são para melhorar a lineariade do conversor AD baseado em porcentagens
if (valVoltsOriginal >= 0.1 && valVoltsOriginal < 0.2) {
  valVolts = valVoltsOriginal*2.2;
} else if (valVoltsOriginal >= 0.2 && valVoltsOriginal < 0.3) {
  valVolts = valVoltsOriginal*1.40;
} else if (valVoltsOriginal >= 0.3 && valVoltsOriginal < 0.4) {
  valVolts = valVoltsOriginal*1.35;
} else if (valVoltsOriginal >= 0.4 && valVoltsOriginal < 0.5) {
  valVolts = valVoltsOriginal*1.30;
} else if (valVoltsOriginal >= 0.5 && valVoltsOriginal < 0.6) {
  valVolts = valVoltsOriginal*1.25;
} else if (valVoltsOriginal >= 0.6 && valVoltsOriginal < 0.7) {
  valVolts = valVoltsOriginal*1.25;
} else if (valVoltsOriginal >= 0.7 && valVoltsOriginal < 0.8) {
  valVolts = valVoltsOriginal*1.25;
} else if (valVoltsOriginal >= 0.8 && valVoltsOriginal < 0.9) {
  valVolts = valVoltsOriginal*1.20;
} else if (valVoltsOriginal >= 0.9 && valVoltsOriginal < 1.0) {
  valVolts = valVoltsOriginal*1.17;
} else if (valVoltsOriginal >= 1.0 && valVoltsOriginal < 1.1) {
  valVolts = valVoltsOriginal*1.17;
} else if (valVoltsOriginal >= 1.1 && valVoltsOriginal < 1.2) {
  valVolts = valVoltsOriginal*1.16;
} else if (valVoltsOriginal >= 1.2 && valVoltsOriginal < 1.3) {
  valVolts = valVoltsOriginal*1.15;
} else if (valVoltsOriginal >= 1.3 && valVoltsOriginal < 1.4) {
  valVolts = valVoltsOriginal*1.14;
} else if (valVoltsOriginal >= 1.4 && valVoltsOriginal < 1.5) {
  valVolts = valVoltsOriginal*1.13;
} else if (valVoltsOriginal >= 1.5 && valVoltsOriginal < 1.6) {
  valVolts = valVoltsOriginal*1.12;
} else if (valVoltsOriginal >= 1.6 && valVoltsOriginal < 1.7) {
  valVolts = valVoltsOriginal*1.12;
} else if (valVoltsOriginal >= 1.7 && valVoltsOriginal < 1.8) {
  valVolts = valVoltsOriginal*1.11;
} else if (valVoltsOriginal >= 1.8 && valVoltsOriginal < 1.9) {
  valVolts = valVoltsOriginal*1.11;
} else if (valVoltsOriginal >= 1.9 && valVoltsOriginal < 2.0) {
  valVolts = valVoltsOriginal*1.10;
} else if (valVoltsOriginal >= 2.0 && valVoltsOriginal < 2.1) {
  valVolts = valVoltsOriginal*1.10;
} else if (valVoltsOriginal >= 2.1 && valVoltsOriginal < 2.2) {
  valVolts = valVoltsOriginal*1.09;
} else if (valVoltsOriginal >= 2.2 && valVoltsOriginal < 2.3) {
  valVolts = valVoltsOriginal*1.09;
} else if (valVoltsOriginal >= 2.3 && valVoltsOriginal < 2.4) {
  valVolts = valVoltsOriginal*1.09;
} else if (valVoltsOriginal >= 2.4 && valVoltsOriginal < 2.5) {
  valVolts = valVoltsOriginal*1.09;
} else if (valVoltsOriginal >= 2.5 && valVoltsOriginal < 2.6) {
  valVolts = valVoltsOriginal*1.09;
} else if (valVoltsOriginal >= 2.6 && valVoltsOriginal < 2.7) {
  valVolts = valVoltsOriginal*1.07;
} else if (valVoltsOriginal >= 2.7 && valVoltsOriginal < 2.8) {
  valVolts = valVoltsOriginal*1.06;
} else if (valVoltsOriginal >= 2.8 && valVoltsOriginal < 2.9) {
  valVolts = valVoltsOriginal*1.04;
} else if (valVoltsOriginal >= 2.9 && valVoltsOriginal < 3.0) {
  valVolts = valVoltsOriginal*1.02;
} else if (valVoltsOriginal >= 3.0 && valVoltsOriginal < 3.15) {
  valVolts = valVoltsOriginal*1.00;
}
//--------------------------------------------------------------------------
  //Agora chama as funções de desenho do código
  depuracao();
  cabecalho();
  botoes();
  //Agora vem um switch para selecionar cada desenho dependendo da tensão máxima escolhida
  switch (selecionado) {
    case 1:
      desenhaVoltimetro_1();
      break;
    case 2:
      desenhaVoltimetro_2();
      break;
    case 3:
      desenhaVoltimetro_3();
      break;
    default:
      desenhaVoltimetro_0(); // o índice padrão é 0
  } 
}
//--------------------------------------------------------------------

//Essa função captura o valor enviado pela serial, excluindo os textos, ficando só com números.
void serialEvent(Serial porta) {
  String inString = porta.readStringUntil('\n');
  if (inString != null) {
    inString = inString.trim();
    if (inString.startsWith("Media dos dois conversores AD em mV =")) {
      val1 = inString.substring(37);
    } else if (inString.startsWith("ADC1 Valor =")) {
      val2 = inString.substring(13);
      valVolts2 = Float.parseFloat(val2);
    } else if (inString.startsWith("ADC2 Valor =")) {
      val3 = inString.substring(13);
      valVolts3 = Float.parseFloat(val3);
    } else if (inString.startsWith("Clock do ESP =")) {
      val4 = inString.substring(15);
    }
  }
}
