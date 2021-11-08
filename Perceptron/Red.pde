class Red {
  Neurona[][] red;
  float[] bias;
  
  Red(int capas,int nCapas){
    this.red = new Neurona[capas][nCapas];
    this.bias = new float[capas];
    for(int i = 0; i < this.red.length ; i++){
       this.bias[i] = 0.05; 
       for(int z = 0; z < this.red[i].length ; z++){
         this.red[i][z] = new Neurona(0.5);
       }
    }
  }
  
  void Classify(Punto punto){
    
    for(int i = 0; i < red.length; i++){
      //println(i);
      int r = 0;
      for(Neurona neurona: red[i]){
        
        if(i == 0){
          neurona.Classify(punto.x/width, punto.y/height);
        }else if(i > 0 && i < red.length-1){
          
          neurona.Classify(red[i - 1][0].res, red[i - 1][1].res);
        }else{
         
          neurona.Classify(red[i - 1][0].res, red[i - 1][1].res);
          
          
          if(neurona.res == 1){
            
            //println(neurona.rgb1 + " " + neurona.rgb2 + " "+ neurona.rgb3);
            punto.rgb1 = neurona.rgb1;
            punto.rgb2 = neurona.rgb2;
            punto.rgb3 = neurona.rgb3;
            
            
            //println(punto.rgb1 + " " + punto.rgb2 + " "+ punto.rgb3 + " entro:" + r);
          }else{
            //println("Blanco");
            punto.rgb1 = 255;
            punto.rgb2 = 255;
            punto.rgb3 = 255;
          }
          r++;
          println("caso: "+ r +" "+neurona.res);
        }
      }
    }
  }
  
  //Entrenamiento de la ultima capa del perceptron
  void Training(Punto puntoT, Area[] areas, float aTam){
     this.Classify(puntoT);
     
     for(int i = this.red.length - 1; i >= 0; i--){
       for(int z = 0; z < this.red[i].length; z++){
         if(i == (this.red.length - 1)){
           
           //println("entro en primera");
           int correct = aTam/2 < sqrt(pow(areas[z].x - puntoT.x, 2) + pow(areas[z].y - puntoT.y, 2)) ? 1 : -1;
           this.red[i][z].error = (correct - this.red[i][z].res); 
           this.red[i][z].d = this.red[i][z].error * df(this.red[i][z].res);
         }else{
           
           //println("entro en las ocultas");
           float propagationError = 0;
           
           for (int k = 0; k < this.red[i + 1].length; k++){
             propagationError += (red[i + 1][k].error * (red[i + 1][k].pesos[k] / (red[i + 1][k].pesos[0] + red[i + 1][k].pesos[1]))); 
           }
           
           this.red[i][z].error = propagationError;
           
           this.red[i][z].d = this.red[i][z].error * df(this.red[i][z].res);
           
           //println(this.red[i][z].error);
         }
         
         this.red[i][z].bias = this.red[i][z].bias + (this.red[i][z].alfa * this.red[i][z].d);
         
         if(i > 0){
           for(int k = 0; k < this.red[i][z].pesos.length; k++){
             this.red[i][z].pesos[k] = this.red[i][z].pesos[k] + ((this.red[i][z].alfa * (sigmoidCapas(this.red[i], this.red[i - 1] )*(1 - sigmoidCapas(this.red[i], this.red[i - 1]))) * this.red[i - 1][z].res) * (-1));
           }
         }else{
           
           float[] entradas = new float[]{puntoT.x/width,puntoT.y/height};
           for(int k = 0; k < this.red[i][z].pesos.length; k++){
             this.red[i][z].pesos[k] = this.red[i][z].pesos[k] + ((this.red[i][z].alfa * (sigmoidEntradas(this.red[i], entradas )*(1 - sigmoidEntradas(this.red[i], entradas))) * entradas[k]) * (-1));
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
  
  float sigmoidCapas (Neurona[] capaActual, Neurona[] entradas){
    float res = 0;
    for(int i = 0; i < entradas.length; i++){
      res += (capaActual[i].pesos[i] * entradas[i].res);
    }
    
    return f(res);
  }
  
   float sigmoidEntradas (Neurona[] capaActual, float[] entradas){
    float res = 0;
    for(int i = 0; i < entradas.length; i++){
      res += (capaActual[i].pesos[i] * entradas[i]);
    }
    
    return f(res);
  }
}
