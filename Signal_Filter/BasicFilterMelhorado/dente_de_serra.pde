void dente_de_sera() {
  float amplitude = 0.5; // Amplitude do sinal dente de serra
  float frequencia = 0.02; // Frequência do sinal dente de serra (ajuste conforme necessário)
  float yOffset = 0.5; // Valor para centralizar o sinal
  float periodo = 1.0 / frequencia; // Período da onda dente de serra
  float x = (frameCount % int(periodo)) / periodo; // Calcula a posição atual no período
  sinalFonte = map(x, 0.0, 1.0, -amplitude, amplitude) + yOffset;
}
