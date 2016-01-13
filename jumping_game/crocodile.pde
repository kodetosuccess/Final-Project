class Crocodile{
  PImage croc;
  
  Crocodile(){
    croc = loadImage("crocodile.png");
  }
  
  void display(){
    image(croc,width/6,height/3*2,140,140);
  }
  
}