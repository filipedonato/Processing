import javax.swing.JOptionPane;

PImage ufcg_logo, icon, fundo;
float K, Vt, fi_graus, fi, V1, i;
float Ip, Vx;
float I0, I1, I2, In;
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
  size(500, 700);
  

  icon = loadImage("icon.png");            //ícone, carregou o arquivo
  fundo = loadImage("fundo.png");
  surface.setIcon(icon);                   //Definiu o ícone do programa
  ufcg_logo  = loadImage("ufcg_logo.png"); //Logo da ufcg, carregou o arquivo
  
  background(fundo);
  image(ufcg_logo, 410,1, width/6, height/8); //posição a exibir e tamanho redimensionado
  smooth();
  fill(0);
  textSize(14);
  text("      Aluno\n Filipe Donato", 405, 102);
  
  fill(0);
  K = float(showInputDialog("Digite o valor de K (em uA/V^2):"));
  K=K*0.000001;
  Vt = float(showInputDialog("Digite o valor de Vt (em Volts):"));
  V1 = float(showInputDialog("Digite o valor de V1 (em Volts):"));
  i = float(showInputDialog("Quantas harmônicas encontrar? (max 21):"));
  fi_graus = float(showInputDialog("Digite o valor do ângulo (em graus):"));
  fi = radians(fi_graus);  //Converte pra radianos
   
//Encontra Ip-----------------------------------------------------------
  Vx = V1-Vt;
  Ip = K * sq(V1 - Vt);  // sq eleva ao quadrado na linguagem processing
  
//Formulas para encontrar as harmônicas-----------------------------------------------------------------------
//No Processing as funções sin() e cos() trabalham com valores de entrada em radianos e retornam valores em radianos.
  I0 = (Ip/PI) * (((fi) - (3*sin(2*fi)/4) + (fi*cos(2*fi)/2)) / sq(1-cos(fi)));  // sq eleva ao quadrado na linguagem processing
  I1 = (2*Ip/PI) * (((3*sin(fi)/4) + (sin(3*fi)/12) - (fi*cos(fi))) / sq(1-cos(fi)));
  I2 = (2*Ip/PI) * (((fi/4) - (sin(2*fi)/6) + (sin(4*fi)/48)) / sq(1-cos(fi)));
}

void draw() {
  
  textSize(32);
  text("Dados da questão:", 50, 25);
  textSize(22);
  text("Fi radianos = :" + fi, 50, 50);
  text("Vx = V1-Vt = " + Vx, 50, 70);
  
  textSize(32);
  text("Resultados:", 50, 120);
  textSize(22);
  text("I_pico = " + Ip, 50, 145);
  text("I0 = " + I0, 50, 170);
  text("I1 = " + I1, 50, 195);
  text("I2 = " + I2, 50, 220);
  
  
  int n;
  float x=50, y=245;
  for (n=3; n <= i; n++){
  In = (2*Ip/PI) * (((4-n*n)*sin(n*fi) + (n-1)*(n-2)*sin(n*fi)*cos(2*fi) + 3*n*sin(n-2)*fi) / ((n*n-1)*(n*n-4)*n*sq(1-cos(fi))));
  textSize(22);
  text("I"+ n + " = " + In, x, y);          //Exibe os valores da n-ésima harmonica
  y += 25;
  } 
}
