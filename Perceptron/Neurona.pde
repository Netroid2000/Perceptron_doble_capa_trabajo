
class Neurona {
  
  float[] pesos;
  float bias;
  float res;

  Neurona(float bias){
    this.pesos = new float[3];
    this.pesos[0] = 0.5;
    this.pesos[1] = 0.2;
    this.pesos[2] = 0.3;
    this.bias = bias;
    this.res = 0; 
  }
  
  //Clasificacion de los puntos de si pertenecen a 1 o 0
  float Classify(float x, float y){
     float suma = 0;
     suma+= x*this.pesos[0] + y*this.pesos[1] + this.pesos[2];
     
     this.res = f(suma);
     
     return f(suma);
  }
  
  float f(float suma){
    return 1/(1 + exp(-suma));
  }
  
  //Entrenamiento de la neurona para ajustar los pesos
  void Training(){
  }


}
