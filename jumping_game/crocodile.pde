class Crocodile{
  PImage croc;
  PVector loc;
  
  Crocodile(float x, float y){
    croc = loadImage("crocodile.png");
    loc = new PVector(x,y);
  }
  
  void display(){
    image(croc,loc.x,loc.y,140,140);
  }
  
}