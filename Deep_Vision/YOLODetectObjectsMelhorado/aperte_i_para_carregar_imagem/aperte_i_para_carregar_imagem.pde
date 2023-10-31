import ch.bildspur.vision.*;
import ch.bildspur.vision.result.*;
import processing.core.PImage;

DeepVision deepVision;
YOLONetwork yolo;
ResultList<ObjectDetectionResult> detections;

PImage image;
int textSize = 12;

public void setup() {
  size(1024, 720);
  colorMode(HSB, 360, 100, 100);

  // Carregue uma imagem inicialmente vazia
  image = createImage(width, height, RGB);

  // Inicialize a biblioteca DeepVision
  deepVision = new DeepVision(this, true); // ATIVAR O CUDA
  println("CUDA: " + deepVision.isCUDABackendEnabled()); // Verificar se ativou

  println("Criando modelo...");
  yolo = deepVision.createYOLOv5m(); // funcionou v5n, v5m e v5x
  println("Carregando YOLO escolhido...");
  yolo.setup();
}

public void draw() {
  background(55);
  image(image, 0, 0);
  noFill();
  strokeWeight(2f);
  textSize(textSize);

  if (detections != null) {
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
}

// Função para carregar uma nova imagem quando o usuário pressiona a tecla 'I'
public void keyPressed() {
  if (key == 'i' || key == 'I') {
    selectInput("Selecione uma imagem para detecção:", "imageSelected");
  }
}

// Função chamada quando o usuário seleciona uma imagem
void imageSelected(File selection) {
  if (selection != null) {
    image = loadImage(selection.getAbsolutePath());
    detections = yolo.run(image);
  }
}
