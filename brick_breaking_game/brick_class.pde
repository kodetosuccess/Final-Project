class Brick {
  PImage brick;
  PVector loc;


  Brick(float a, float b) {
    loc = new PVector(a, b);
    brick = loadImage("brick.jpg");
  }


  boolean Disappears(Cannonball c) {
    if (loc.dist(c.loc) < 5) {
      return true;
    } else {
      return false;
    }
  }

  void display () {
    image(brick, loc.x, loc.y);    //display brick image
  }
  
}