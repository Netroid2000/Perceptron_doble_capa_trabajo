class Area {
  
  float x, y, aWidth, aHeight;
  float tipo;
  
  Area(float x, float y, float aWidth, float aHeight){
    this.x = x;
    this.y = y;
    this.aWidth = aWidth;
    this.aHeight = aHeight;
    this.tipo = random(0,250);
  }
  
  void Pintar(){
    strokeWeight(1);
    
    fill(this.tipo, this.tipo/2, this.tipo/4);
    
    ellipse(this.x, this.y, this.aWidth , this.aHeight);
    
  }
  
}
