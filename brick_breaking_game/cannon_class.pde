class Cannon {      //make Cannon class
  PImage  cannon;    //initialize cannon PImage
  PVector loc;    //initialize loc PVector
  int diam;    //initialize diam, which is not the diam of anything, just a familiar term used for distance to be judged in interaction of cannon and cannonball

  Cannon() {
    imageMode(CENTER); 
    loc = new PVector(width/2, 650);    //make loc a new PVector
    cannon = loadImage("cannon.png");    //bring in cannon image
    diam = 100;    //helper in distance determination
  }

  void display () {
    image(cannon, loc.x, loc.y);    //set the y coordinate of the cannon since it doesn't need to move that way while setting the x coordinate of the cannon to be the mouse's x coordinate
  }

  void update() {
    loc.set(mouseX, 650);
  }

  boolean Touches(Cannonball c) {    //this is for the interaction b/w the cannonball and cannon
    float d = loc.dist(c.loc);    //make d variable which is the distance b/w the cannon and cannonball
    if (d <= c.diam/2) {    //if the distance is less than 15  ***we set this up to keep ourselves organized***
      return true;
    } else {
      return false;
    }
  }
}
