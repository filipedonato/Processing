import ch.bildspur.vision.*;
import ch.bildspur.vision.result.*;

DeepVision deepVision = new DeepVision(this);
YOLONetwork yolo;
ResultList<ObjectDetectionResult> detections;

PImage image;
int textSize = 12;

public void setup() {
  size(1024, 720);
  colorMode(HSB, 360, 100, 100);
  image = loadImage("R.jpg");
  
  DeepVision vision = new DeepVision(this, true);      //ATIVAR O CUDA
  println("CUDA: " + deepVision.isCUDABackendEnabled()); //Verificar se ativou

  println("Criando modelo...");
  yolo = deepVision.createYOLOv5m(); //funcionou v5n, v5m e v5x
  println("Carregando YOLO escolhido...");
  yolo.setup();
  long startTime = System.currentTimeMillis();  // Inicia a contagem de tempo
  println("Computando...");
  
  yolo.setConfidenceThreshold(0.96f);
  yolo.setTopK(0);
  detections = yolo.run(image);
  
  long endTime = System.currentTimeMillis();  // Finaliza a contagem de tempo
  long processingTime = endTime - startTime;  // Calcula o tempo de processamento
  println("Tempo de Processamento: " + processingTime + " millisegundos");
  println("Total de Detecções:" + detections.size());
}

public void draw() {
  background(55);
  image(image, 0, 0);
  noFill();
  
  strokeWeight(2f);
  strokeWeight(3f);
  
  textSize(textSize);

  for (ObjectDetectionResult detection : detections) {
    int hue = (int)(360.0 / yolo.getLabels().size() * detection.getClassId());

    noFill();
    stroke(hue, 80, 100);
    rect(detection.getX(), detection.getY(), detection.getWidth(), detection.getHeight());

    fill(hue, 80, 100);
    rect(detection.getX(), detection.getY() - (textSize + 3), textWidth(detection.getClassName()) + 4, textSize + 3);

    fill(0);
    textAlign(LEFT, TOP);
    text(detection.getClassName(), detection.getX() + 2, detection.getY() - textSize - 3);
  }

  surface.setTitle("YOLO Test - FPS: " + Math.round(frameRate));
}
