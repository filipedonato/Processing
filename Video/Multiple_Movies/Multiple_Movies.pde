/*Como gravar um ou mais vídeos com o clique do mouse.
  Clique e segure para gravar, solte o clique para finalizar. 
  Ao clicar novamente, será iniciado outra gravação com outro nome*/
import processing.video.*; 
import com.hamoid.*; 
VideoExport videoExport;
Capture cam;
boolean gravando = false;
int contagem = 1;

void setup() {
  size(640, 480);
  noStroke();
  frameRate(30);
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("Não há câmeras disponíveis para captura.");
    exit();
    } 
    else {
    println("Câmeras disponíveis:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
      }
  cam = new Capture(this, 640, 480);
  cam.start(); 
    }
  videoExport = new VideoExport(this);
  println("Clique para iniciar a gravação");
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

void mousePressed(mouseButton == LEFT) {
  gravando = true;
  String nome = "Video_";
  videoExport.setMovieFileName(nome + contagem + ".mp4");
  videoExport.startMovie();
  println("Gravando!");
  contagem++;
}
void mouseReleased() {
  gravando = false;
  println("Finalizado!");
  videoExport.endMovie(); 
}
