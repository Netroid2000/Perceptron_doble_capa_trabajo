
class Neurona {
  
  float[] pesos;
  float alfa;
  float res;
  float bias;
  float rgb1, rgb2, rgb3;
  float d;
  float error;

  Neurona(float alfa){
    this.pesos = new float[2];
    this.pesos[0] = 0.5;
    this.pesos[1] = 0.5;
    this.alfa = alfa;
    this.res = 0;
    this.rgb1 = 0; 
    this.rgb2 = 0;
    this.rgb3 = 0;
    this.d = 0;
    this.bias = 1;
    this.error = 0;
  }
  
  //Clasificacion de los puntos de si pertenecen a 1 o 0
  float Classify(float input1, float input2){
     float suma = (input1 * this.pesos[0])+(input2 + this.pesos[1]) + this.bias;
     this.res = f(suma);

     return res;
  }
  
  float f(float suma){
    return 1/(1 + exp(-suma));
  }


}
