//Importa essa bibliote do apache commons no Processing para utilizar as funções como por exemplo resolver integrais
import org.apache.commons.math3.analysis.UnivariateFunction;
import org.apache.commons.math3.analysis.integration.SimpsonIntegrator;
import javax.swing.JOptionPane;

PImage ufcg_logo, icon, fundo;
float x;
double i0;

//------------------------------------------------------------------------
String showInputDialog(String message) {
  String input = "";
  while (input.equals("")) {
    input = JOptionPane.showInputDialog(null, message);
  }
  return input;
} 
//-------------------------------------------------------------------------

void setup() {
  size(500, 700);                          //Tamanho da tela 
  icon = loadImage("icon.png");            //Carregou o arquivo ícone
  fundo = loadImage("fundo.png");          //Carregou a Imagem de fundo
  surface.setIcon(icon);                   //Definiu o ícone do programa
  ufcg_logo  = loadImage("ufcg_logo.png"); //Carregou o logo da ufcg
  background(fundo);                       //Definiu o fundo
  image(ufcg_logo, 410,1, width/6, height/8); //posição a exibir e tamanho redimensionado
  smooth();
  fill(0);
  textSize(14);
  text("      Aluno\n Filipe Donato", 405, 102);    //Fim do cabeçalho
  
  x = float(showInputDialog("Digite o valor de x(maior que 0.746):")); //Recebe o valor de x
  
  i0 = aproximaIntegral(0, x, 2.0, 1000);  //Calcula separadamento o valor de I0(x)

//Laço FOR que imprime na tela de n=1 até n=10 usando o valor recebido pelo usuario de X
  for (int n = 1; n <= 10; n++) {
    double result = aproximaIntegral(n, x, 2.0, 1000); //Valor de n e depois o de x
    result = 2*result/i0;  //Como está no livro, multiplica por 2 e divide por I0(x)
    textSize(28);
    text("2*I" + n + "(x)/I0(x) = " + result, 10, 150 + n * 35);
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
  text("Comparar com a Tabela A-3 da página 639", 10, 650);
  println(i0);
}

//FUNÇÃO DO APACHE COMMONS QUE CALCULA----------------------------
double aproximaIntegral(int n, float a, float b, int num_pontos) {
  UnivariateFunction func = new UnivariateFunction() {
    @Override
    public double value(double y) {
      return Math.exp(a * Math.cos(y)) * Math.cos(n * y);
    }
  };
  
  SimpsonIntegrator integrator = new SimpsonIntegrator();
  
  double result = integrator.integrate(num_pontos, func, -Math.PI, Math.PI);
  result = result / (2 * Math.PI);  //multiplica o resultado da integral por 1/2*PI 
  return result;          //retorna o resultado de In(x) da fórmula A-1 do Apêndice
}
