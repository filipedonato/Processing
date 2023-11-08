void cabecalho() {
  image(ufcg_logo, 1,10, width/5, height/5); //posição a exibir e tamanho redimensionado
  fill(0,0,0);
  textSize(22); //Atributos do texto de cor, fonte e tamanho da letra
  text("Estágio Supervisionado", 130, 25); //texto e sua respectiva posição X Y
  text("Voltímetro DC utilizando ESP32 e Processing", 130, 50); //texto e sua respectiva posição X Y
  text("Aluno: Filipe Soares Donato", 130, 75); //texto e sua respectiva posição X Y
  text("Orientador: Raimundo C. S. Freire", 130, 100); //texto e sua respectiva posição X Y
}
