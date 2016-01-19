class Cannon {
  PImage  cannon;
  PVector loc;
  
  Cannon() {
    loc = new PVector();
    cannon = loadImage("cannon.png");    //bring in cannon image
  }
  
  void display () {
    image(cannon, mouseX, height-130);    //display cannon image
  }
  

}