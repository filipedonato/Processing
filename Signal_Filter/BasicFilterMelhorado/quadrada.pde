void quadrada() {
 float amplitude = 0.5; // Amplitude do sinal quadrado
  float frequencia = 0.02; // Frequência do sinal quadrado (ajuste conforme necessário)
  float yOffset = 0.5; // Valor para centralizar o sinal
  float periodo = 1.0 / frequencia; // Período da onda quadrada
  float x = (frameCount % int(periodo)) / periodo; // Calcula a posição atual no período
  if (x < 0.5) {
    sinalFonte = -amplitude + yOffset;
  } 
  else {
    sinalFonte = amplitude + yOffset;
  } 
}
