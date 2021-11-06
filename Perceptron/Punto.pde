class Punto {
  
  float x;
  float y;
  float rgb1,rgb2,rgb3;
  
  Punto(float x, float y){
    this.x = x;
    this.y = y;
    this.rgb1 = 255;
    this.rgb2 = 255;
    this.rgb3 = 255;
  }
  
  void Pintar(){
    strokeWeight(1);
    
    
    fill(this.rgb1, this.rgb2, this.rgb3);
    
    ellipse(this.x, this.y, 10 , 10);
    
  }
  
}
