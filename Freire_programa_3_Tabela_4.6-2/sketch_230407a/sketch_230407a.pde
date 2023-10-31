//Importa essa bibliote do apache commons no Processing para utilizar as funções como por exemplo resolver integrais
import org.apache.commons.math3.analysis.UnivariateFunction;
import org.apache.commons.math3.analysis.integration.SimpsonIntegrator;
import javax.swing.JOptionPane;

PImage ufcg_logo, icon, fundo;
float x;

//-----------------------------------------------------------
String showInputDialog(String message) {
  String input = "";
  while (input.equals("")) {
    input = JOptionPane.showInputDialog(null, message);
  }
  return input;
}
//--------------------------------------------------------------


void setup() {
  size(500, 700);                          //Tamanho da tela
  icon = loadImage("icon.png");            //ícone, carregou o arquivo
  fundo = loadImage("fundo.png");          //Carregou a Imagem de fundo
  surface.setIcon(icon);                   //Definiu o ícone do programa
  ufcg_logo  = loadImage("ufcg_logo.png"); //Logo da ufcg, carregou o arquivo
  background(fundo);                       //Definiu o fundo
  image(ufcg_logo, 410,1, width/6, height/8); //posição a exibir e tamanho redimensionado
  smooth();
  fill(0);
  textSize(14);
  text("      Aluno\n Filipe Donato", 405, 102);
  
  x = float(showInputDialog("Digite o valor de x:")); //Recebe o valor de X
  
 //Laço FOR que imprime na tela de n=0 até n=12 usando o valor recebido pelo usuario de X
  for (int n = 0; n <= 12; n++) {
    double result = aproximaIntegral(n, x, 2.0, 10000); //Valor de n e depois o de x
    textSize(28);
    text("I" + n + "/Ik = " + result, 10, 150 + n * 35);
  }
}

void draw() {
 textSize(32);
  text("Dados da questão:", 50, 25);
  textSize(22);
  text("X = " + x, 50, 50);
  textSize(32);
  text("Resultados:", 10, 120);
  textSize(22);
  text("Comparar com a Tabela 4.6-2 da página 117", 10, 650);  
}

//FUNÇÃO DO APACHE COMMONS QUE CALCULA----------------------------
double aproximaIntegral(int n, float x, float b, int num_pontos) {
  UnivariateFunction func = new UnivariateFunction() {
    @Override
    public double value(double o) {
      return (0.5*Math.tanh((0.5*x) * Math.cos(o))) * (Math.cos(n * o));
    }
  };
  
  SimpsonIntegrator integrator = new SimpsonIntegrator();
  double result = integrator.integrate(num_pontos, func, -Math.PI, Math.PI);
  result /= (1/Math.PI)*10;
  return result;
  
}
