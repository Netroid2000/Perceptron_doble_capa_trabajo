class Punto {
  
  float x;
  float y;
  int tipo;
  
  Punto(float x, float y){
    this.x = x;
    this.y = y;
    this.tipo = 1;
  }
  
  void Pintar(){
    strokeWeight(0);
    
    if (tipo == 1){
      fill(255, 0, 0);
    }else{
      fill(0, 255, 0);
    }
    
    ellipse(this.x + width/2, this.y + height/2, 8 , 8);
    
  }
  
}
