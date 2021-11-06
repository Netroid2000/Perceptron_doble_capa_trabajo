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
      //println(i);
      for(Neurona neurona: red[i]){
        
        if(i == 0){
          neurona.Classify(punto.x, punto.y);
          println("coordenadas: " + punto.x + ", " + punto.y+" "+ i);   
        }else if(i > 0){
          println("entes: " + neurona.res);
          if (red[i - 1] != null && int(neurona.Classify(red[i - 1][0].res, red[i - 1][1].res)) >= 1){
            
             punto.rgb1 = neurona.rgb1;
             punto.rgb2 = neurona.rgb2;
             punto.rgb2 = neurona.rgb2;
             
          }else{
             
             punto.rgb1 = 255;
             punto.rgb2 = 255;
             punto.rgb2 = 255;
             
          }
          
          println("despues: " + neurona.res);          
        }
      }
    }
  }
  
  //Entrenamiento de la ultima capa del perceptron
  void TrainingLastCap(Punto puntoT, int correct, int i){
    
     this.Classify(puntoT);
     
     int z = red.length - 1;
 
     this.red[z][i].d = (correct - red[z][i].res)*df(red[z][i].res);
     this.red[z][i].bias =  this.red[z][i].bias + this.red[z][i].alfa * this.red[z][i].d;
     this.red[z][i].pesos[0] = this.red[z][i].pesos[0] + this.red[z][i].alfa * this.red[z][i].d;
     this.red[z][i].pesos[1] = this.red[z][i].pesos[1] + this.red[z][i].alfa * this.red[z][i].d;
     
     
  }
  
  //Entrenamiento de las capas anteriores a la de salida
  void TrainingLowCaps(){
    //Recorre las capaz en reverza empezando una antes de la capa de salida
    for(int z = red.length - 1; z >= 0 ; z--){
      
      if(z < red.length-1){
        
        for(int c = 0; c < this.red[z].length-1; c++){
          
          for(int v = 0; v < this.red[z+1].length; v++){
            
            this.red[z][c].d = this.red[z + 1][v].pesos[v] * this.red[z + 1][v].d * this.df(this.red[z][c].res);
            
          } 
          this.red[z][c].bias =  this.red[z][c].bias + this.red[z][c].alfa * this.red[z][c].d;
          this.red[z][c].pesos[0] = this.red[z][c].pesos[0] + this.red[z][c].alfa * this.red[z][c].d;
          this.red[z][c].pesos[1] = this.red[z][c].pesos[1] + this.red[z][c].alfa * this.red[z][c].d;
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
