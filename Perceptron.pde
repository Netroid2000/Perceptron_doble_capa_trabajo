
Punto[] points = new Punto[2000];
Neurona brain;

//Inclinacion de la linea
float m = -0.5;
float b = 0;

float tam;

void setup(){
  //Tamaño de la pantalla
  size(600, 600);
  
  for(int i = 0; i < points.length ; i++){
     //Dar valores, de X y Y, aceptables dentro de la grafica
     points[i] = new Punto(random(0, width) - width/2, random(0, height) - height/2);
  }
  //Asignar tamaño de la grafica
  tam = width/2;
   
  //Creacion de la neurona
  brain = new Neurona(0.05); 
  
  println(frameCount);
}

void draw(){
  
  //Pintar el entorno
  background(200);
  Ejes();
  strokeWeight(1);
  line(width/2 - width/m, 0, width/2 + width/m, height);
  
  //Pintar los puntos
  for(Punto p : points){
    //Asignar el tipo al que pertenese
    //Los valores de X y Y se convirtieron para utilizarce en la formula de una red neuronal simple
    p.tipo = int(brain.Classify(p.x/tam, p.y/tam));
    p.Pintar();
  }
  
  //Se dara coordenadas de un punto imaginario para realizar el entrenamiento y ajustar los pesos
  float x = random(0, width) - width/2;
  float y = random(0, height) - height/2;
  brain.Training(x, y, y < m * x + b ? 1 : -1);
  
  delay(50);
}

void Ejes() {
  strokeWeight(1);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}
