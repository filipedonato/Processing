void senoidal() {
  float amplitude = 0.3; // Amplitude da onda senoidal
  float frequencia = 0.05; // Frequência da onda senoidal (ajuste conforme necessário)
  float yOffset = 0.5; // Valor para centralizar a onda
  sinalFonte = amplitude * sin(2*PI * frequencia * frameCount) + yOffset;
}
