class Cannon {
  PImage  cannon;
  PVector loc;
  int diam;

  Cannon() {
    loc = new PVector();
    cannon = loadImage("cannon.png");    //bring in cannon image
    diam = 10;
  }

  void display () {
    image(cannon, mouseX, height-150);
  }
  boolean Touches(Cannonball c) {    //this is for the interaction b/w the cannonball and cannon
    float d = loc.dist(c.loc);
    boolean e;
    if (d < diam/2 + diam) {
      return true;
    } else {
      return false;
    }
  }
}