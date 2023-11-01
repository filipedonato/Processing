/* Este esboço mostra como gravar um vídeo com diferentes tomadas.
   É útil quando para capturar apenas momentos específicos
   Pressione r para começar */
import processing.video.*; 
import com.hamoid.*; 

VideoExport videoExport;
Capture cam;
boolean gravando = false;

void setup() {
  size(640, 480);
  frameRate(30);
  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  videoExport = new VideoExport(this, "/data/Interativo.mp4");
  cam.start(); 
  videoExport.startMovie();
  println("Pressione r para alternar a gravação");
}

void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  // Abaixo temos que se recording for Verdadeiro, grava o vídeo.
  if(gravando) {
    videoExport.saveFrame();
  }
}
//Criamos a função para alternar o valor da variavel "gravando"
void keyPressed() {
  if(key == 'r' || key == 'R') {
    gravando =! gravando;
    println("Gravação está: " + (gravando ? "LIGADA" : "DESLIGADA"));
  }
  if (key == 'q') {
    videoExport.endMovie();
    exit();
  }
}
