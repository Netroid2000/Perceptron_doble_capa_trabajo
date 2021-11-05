class Red {
  Neurona[][] red;
  
  Red(int capas,int nCapas){
    this.red = new Neurona[capas][nCapas];
    
    for(int i = 0; i < red.length ; i++){
       for(int z = 0; z < red[i].length ; z++){
         red[i][z] = new Neurona(0.05);
       }
    }
  }
  
  void Classify(Punto punto){
    
    for(int i = 0; i < red.length; i++){
      
      for(Neurona neurona: red[i]){
        
        if(i <= 0){
          
          neurona.Classify(punto.x, punto.y);
          
        }else if(i >= (red.length - 1) ){
          
          if (red[i - 1] != null && neurona.Classify(red[i - 1][0].res, red[i - 1][1].res) == 1){
            
             println("entro");
             punto.rgb1 = neurona.rgb1;
             punto.rgb2 = neurona.rgb2;
             punto.rgb2 = neurona.rgb2;
             
          }else{
             
             punto.rgb1 = 255;
             punto.rgb2 = 255;
             punto.rgb2 = 255;
             
          }
          println(neurona.res);
        }
      }
    }
  }
  
  void TrainingLastCap(Punto puntoT, int correct, int i){
     this.Classify(puntoT);
     for(int z = red.length - 1; z >= 0 ; z--){
       
       if(z >= red.length-1){
         this.red[z][i].d = (correct - red[z][i].res)*df(red[z][i].res);
         this.red[z][i].bias =  this.red[z][i].bias + this.red[z][i].alfa * this.red[z][i].d;
         this.red[z][i].pesos[0] = this.red[z][i].pesos[0] + this.red[z][i].alfa * this.red[z][i].d;
         this.red[z][i].pesos[1] = this.red[z][i].pesos[1] + this.red[z][i].alfa * this.red[z][i].d;
         this.red[z][i].pesos[2] = this.red[z][i].pesos[2] + this.red[z][i].alfa * this.red[z][i].d;
       }
     }
     
  }
  
  void TrainingLowCaps(){
    for(int z = red.length - 1; z >= 0 ; z--){
      
      if(z < red.length-1){
        
        for(int c = 0; c < this.red[z].length-1; c++){
          for(int v = 0; v < this.red[z+1].length; v++){
            
            this.red[z][c].d = (this.red[z + 1][v].d - red[z][c].res)*df(red[z][c].res);
            this.red[z][c].bias =  this.red[z][c].bias + this.red[z][c].alfa * this.red[z][c].d;
            this.red[z][c].pesos[0] = this.red[z][c].pesos[0] + this.red[z][c].alfa * this.red[z][c].d;
            this.red[z][c].pesos[1] = this.red[z][c].pesos[1] + this.red[z][c].alfa * this.red[z][c].d;
            this.red[z][c].pesos[2] = this.red[z][c].pesos[2] + this.red[z][c].alfa * this.red[z][c].d;
            
          } 
        }
      }
    }
  }
  
  
  
  float df(float x){
    return f(x)*(1 - f(x));
  }
  
  float f(float x){
    return 1/(1 + exp(-x));
  }
}
