class Brick {
  PImage brick;
  PVector loc;


  Brick(float a, float b) {
    loc = new PVector(a, b);
    brick = loadImage("brick.jpg");
  }


  boolean Disappears(PVector z) {
    if (loc.dist(z) < 30) {
      return true;
    } else {
      return false;
    }
  }

  void display () {
    image(brick, 120, 100);    //display brick image
  }
}