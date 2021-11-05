class Area {
  
  float x, y, tam;
  float rgb1, rgb2, rgb3;
  
  Area(float x, float y, float tam){
    this.x = x;
    this.y = y;
    this.tam = tam;
    this.rgb1 = random(0,250);
    this.rgb2 = random(0,250);
    this.rgb3 = random(0,250);

  }
  
  void Pintar(){
    strokeWeight(1);
    
    fill(this.rgb1,this.rgb2, this.rgb3);
    
    ellipse(this.x, this.y, this.tam , this.tam);
    
  }
  
}
