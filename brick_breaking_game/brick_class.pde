class Brick {
  PImage brick;
  PVector loc;


  Brick(float a, float b) {
    loc = new PVector(a, b);
    brick = loadImage("brick.jpg");
  }

  void display () {
    image(brick, loc.x, loc.y);    //display brick image
  }
  
}