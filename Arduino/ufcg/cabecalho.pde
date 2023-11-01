void cabecalho() {
  image(ufcg_logo, 1,30, width/6, height/5); //posição a exibir e tamanho redimensionado
  fill(0,0,0); textFont(fonte); textSize(22); //Atributos do texto de cor, fonte e tamanho da letra
  
  text("Interação com Arduino e Processing", 130, 50); //texto e sua respectiva posição X Y
  text("Filipe Soares Donato", 130, 75);                                    //texto e sua respectiva posição X Y
}
