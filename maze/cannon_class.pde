class Cannon {      //make Cannon class
  PImage  cannon;    //initialize cannon PImage
  PVector loc;    //initialize loc PVector
  int diam;    //initialize diam, which is not the diam of anything, just a familiar term used for distance to be judged in interaction of cannon and cannonball

  Cannon() {
    loc = new PVector(width/2, 650);    //make loc a new PVector
    cannon = loadImage("cannon.png");    //bring in cannon image
    diam = 100;    //helper in distance determination
  }

  void display () {
    image(cannon, mouseX, height-130);    //display cannon image
  }

  void update() {
    loc.set(mouseX, 650);
  }

  boolean Touches(Ball ball) {    //this is for the interaction b/w the cannonball and cannon
    float d = loc.dist(ball.loc);    //make d variable which is the distance b/w the cannon and cannonball
    if (d <= ball.diam/2) {    //if the distance is less than 15  ***we set this up to keep ourselves organized***
      return true;
    } else {
      return false;
    }
  }
}