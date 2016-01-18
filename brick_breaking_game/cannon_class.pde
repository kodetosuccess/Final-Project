class Cannon {      //make Cannon class
  PImage  cannon;    //initialize cannon PImage
  PVector loc;    //initialize loc PVector
  int diam;    //initialize diam, which is not the diam of anything, just a familiar term used for distance to be judged in interaction of cannon and cannonball

  Cannon() {
    loc = new PVector();    //make loc a new PVector
    cannon = loadImage("cannon.png");    //bring in cannon image
    diam = ;    //helper in distance determination
  }

  void display () {
    image(cannon, mouseX, height-150);    //set the y coordinate of the cannon since it doesn't need to move that way while setting the x coordinate of the cannon to be the mouse's x coordinate
  }
  boolean Touches(Cannonball c) {    //this is for the interaction b/w the cannonball and cannon
    float d = loc.dist(c.loc);    //make d variable which is the distance b/w the cannon and cannonball
    if (d < diam/2 + diam) {    //if the distance is less than 15  ***we set this up to keep ourselves organized***
      return true;
    } else {
      return false;
    }
  }
}