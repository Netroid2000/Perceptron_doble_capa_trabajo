
Punto[] points = new Punto[20];
Red red;


Area[] areas = new Area[2];

//Inclinacion de la linea
float b = 0;
float aTam = 100;


void setup(){
  //Tamaño de la pantalla
  size(400, 400);
  background(250);
  
  for(int i = 0; i < points.length ; i++){
     //Dar valores, de X y Y, aceptables dentro de la grafica
     points[i] = new Punto(random(0, width), random(0, height));
  }
  
  //crear la red
  red = new Red(2, areas.length);
  
  //Crear y pintar las areas
  Circulos();
  
  println(frameCount);
}

void draw(){
  //Pintar los puntos
  int z = 0;
  for(Punto p : points){
    z++;
    println("Punto numer: "+ z);
    red.Classify(p);
    p.Pintar();
  }
  
  Punto puntoT = new Punto(random(0, width), random(0, height));
  
  
  red.Training(puntoT, areas, aTam);
 
 
  delay(10);
}

void Circulos() {
    if(areas.length <= red.red[red.red.length - 1].length){
      
      for(int i = 0; i < areas.length ; i++){
        areas[i] = new Area(random(0,width), random(0,height), aTam);
        red.red[red.red.length - 1][i].rgb1 = areas[i].rgb1;
        red.red[red.red.length - 1][i].rgb2 = areas[i].rgb2;
        red.red[red.red.length - 1][i].rgb3 = areas[i].rgb3;
        areas[i].Pintar();
      }
    }
    
}
