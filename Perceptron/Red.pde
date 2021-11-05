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

}
