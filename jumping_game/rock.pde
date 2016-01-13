class Rock{
  PImage rock;
  
  Rock(){
    rock = loadImage("rock.png");
  }
  void display(){
    image(rock,width/20,height/4*3,100,80);
  }
}