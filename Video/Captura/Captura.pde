import processing.video.*;
Capture cam;
void setup() {
  size(640, 480);
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
    //Mais de uma câmera pode ser utilizada usando um
    //elemento índice da matriz retornado pela lista():
    cam = new Capture(this, 640, 480);
    cam.start();     
    }  
  }   
void draw() {
  if (cam.available() == true) {
    cam.read();
  }
  image(cam, 0, 0);
  //A seguinte linha abaixo comentada faz o mesmo comando 
  //set(0, 100, cam);
}
