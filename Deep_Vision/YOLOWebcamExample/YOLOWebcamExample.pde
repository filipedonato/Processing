import ch.bildspur.vision.*;
import ch.bildspur.vision.result.*;

import processing.core.PApplet;
import processing.core.PConstants;
import processing.core.PImage;
import processing.video.Capture;

Capture cam;

//adicionando a plavra true na linha abaixo ativa o suporte ao CUDA
DeepVision deepVision = new DeepVision(this, true);
YOLONetwork yolo;
ResultList<ObjectDetectionResult> detections;

int textSize = 12;

public void setup() {
  size(640, 480);
  colorMode(HSB, 360, 100, 100);
  
  
  DeepVision vision = new DeepVision(this, true);      //ATIVAR O CUDA
  println("CUDA: " + deepVision.isCUDABackendEnabled()); //Verificar se ativou

  println("Criando Modelo...");
  yolo = deepVision.createYOLOv4Tiny();
  println("Carregando o modelo...");
  yolo.setup();

  cam = new Capture(this, "pipeline:autovideosrc");
  cam.start();
}

public void draw() {
  background(55);

  if (cam.available()) {
    cam.read();
  }

  image(cam, 0, 0);

  if (cam.width == 0) {
    return;
  }

  yolo.setConfidenceThreshold(0.2f);
  detections = yolo.run(cam);

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

  surface.setTitle("Webcam YOLO Test - FPS: " + Math.round(frameRate));
}
