
class Neurona {
  
  float[] pesos;
  float alfa;

  Neurona(float tasa){
    this.pesos = new float[3];
    this.pesos[0] = 0.5;
    this.pesos[1] = 0.2;
    this.pesos[2] = 0.3;
    this.alfa = tasa;
  }
  
  //Clasificacion de los puntos de si pertenecen a 1 o 0
  float Classify(float x, float y){
    float suma = 0;
    suma+= x*this.pesos[0] + y*this.pesos[1] + this.pesos[2];
    return f(suma);
  }
  
  float f(float suma){
    return 1/(1 + exp(-suma));
  }
  
  //Entrenamiento de la neurona para ajustar los pesos
  void Training(float x, float y, int correct){
    
    float eval = Classify(x,y);
    float error = correct - eval;

    this.pesos[0] = pesos[0] + this.alfa * error * x;
    this.pesos[1] = pesos[1] + this.alfa * error * y;
    this.pesos[2] = pesos[2] + this.alfa * error;
    
  }


}
