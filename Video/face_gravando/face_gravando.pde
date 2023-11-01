import processing.video.*;
import com.hamoid.*;
import ch.bildspur.vision.*;
import ch.bildspur.vision.result.*;

Capture cam;
PImage inputImage;

DeepVision vision;
ULFGFaceDetectionNetwork network;
ResultList<ObjectDetectionResult> detections;

VideoExport videoExport;
boolean gravando = false;
int contagem = 1;

void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  noStroke();

  println("Criando rede...");
  vision = new DeepVision(this);
  network = vision.createULFGFaceDetectorRFB320();

  println("Carregando Modelo...");
  network.setup();

  String[] cameras = Capture.list();
  cam = new Capture(this, cameras[0]);
  videoExport = new VideoExport(this);
}

void draw() {
  cam.start(); 
  if (cam.available()) {
    cam.read();
  }

  image(cam, 0, 0);

  if (cam.width == 0) {
    return;
  }

  inputImage = cam.get();      // Captura a imagem atual da webcam
  videoExport.setFrameRate(25);//Define a taxa de frames do vídeo que será salvo
  detections = network.run(inputImage);
  surface.setTitle("Detector de Faces e Gravação de Vídeo - FPS: " + Math.round(frameRate));
  noFill();
  strokeWeight(2f);

  stroke(200, 80, 100);
  for (ObjectDetectionResult detection : detections) {
    rect(detection.getX(), detection.getY(), detection.getWidth(), detection.getHeight());

    if (!gravando && detection.getClassName().equals("face")) {
      iniciaGravacao();
    }
    
    if (gravando) {
      videoExport.saveFrame();
    }
  }
}

void iniciaGravacao() {
  gravando = true;
  String horaAtual = nf(hour(), 2) + nf(minute(), 2) + nf(second(), 2);
  String nome = "Video_";
  videoExport.setMovieFileName(nome + horaAtual + ".mp4");
  videoExport.startMovie();
  println("Gravando!");
  contagem++;
}
