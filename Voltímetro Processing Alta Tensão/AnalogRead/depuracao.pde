void depuracao(){
  
  fill(0,200,200,100); //cor rgb e transparencia
  rect(465, 520, 134, 80, 10); //Retangulo com posição, tamanho e borda
  fill(0,0,0); //cor rgb
  textSize(12);
  text("Valores do ESP32 (serial)", 470, 532);
  text("Media em mV: " + valVolts, 470, 545);
  text("ADC1 Valor: " + val2, 470, 555);
  text("ADC2 Valor: " + val3, 470, 565);
  text("Clock do ESP: " + val4 + "MHz", 470, 575);
  textSize(16);
  text("Selecionado: " + selecionado, 470, 595);
}
