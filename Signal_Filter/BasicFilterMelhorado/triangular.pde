void triangular () {
  float amplitude = 0.3; // Amplitude do sinal triangular
  float frequencia = 0.02; // Frequência do sinal triangular (ajuste conforme necessário)
  float yOffset = 0.5; // Valor para centralizar o sinal
  float periodo = 1.0 / frequencia; // Período da onda triangular
  float x = (frameCount % int(periodo)) / periodo; // Calcula a posição atual no período
  if (x < 0.5) {
    sinalFonte = map(x, 0.0, 0.5, -amplitude, amplitude) + yOffset;
  } 
  else {
    sinalFonte = map(x, 0.5, 1.0, amplitude, -amplitude) + yOffset;
  }
}
