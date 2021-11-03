class Punto {
  
  float x;
  float y;
  int tipo;
  
  Punto(float x, float y){
    this.x = x;
    this.y = y;
    this.tipo = 255;
  }
  
  void Pintar(){
    strokeWeight(1);
    
    
    fill(this.tipo, this.tipo, this.tipo);
    
    ellipse(this.x, this.y, 8 , 8);
    
  }
  
}
