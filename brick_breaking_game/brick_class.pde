class Brick {      //make Brick class
  PImage brick;    //initialize brick PImage
  PVector loc;    //initialize loc PVector


  Brick(float a, float b) {
    loc = new PVector(a, b);    //make loc a new PVector 
    brick = loadImage("brick.jpg");    //bring in the brick image
  }

  void display () {
    image(brick, loc.x, loc.y);    //display brick image
  }
  
}