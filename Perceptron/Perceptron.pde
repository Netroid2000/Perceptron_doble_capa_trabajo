
Punto[] points = new Punto[2000];
Red red;
Area[] areas = new Area[2];

//Inclinacion de la linea
float b = 0;
float aTam = 100;


void setup(){
  //Tamaño de la pantalla
  size(600, 600);
  background(200);
  
  for(int i = 0; i < points.length ; i++){
     //Dar valores, de X y Y, aceptables dentro de la grafica
     points[i] = new Punto(random(0, width), random(0, height));
  }
  
  //crear la red con salida igual a la cantidad de areas mas 1
  red = new Red(2, areas.length+1);
  
  //Crear y pintar las areas
  Circulos();
  
  println(frameCount);
}

void draw(){
  //Pintar los puntos
  for(Punto p : points){
    p.Pintar();
  }
 
  delay(50);
}

void Circulos() {
    for(Area area: areas){
      area = new Area(random(0,width), random(0,height), aTam);
      area.Pintar();
    }
}
