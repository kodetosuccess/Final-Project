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
    if (ball.loc.y > 600 && ball.loc.y < 610 && ball.loc.x > loc.x - 50 && ball.loc.x < loc.x + 50 && ball.vel.y > 0) {    //this checks if the ball is within a certain rectangle and if it is traveling downwards
      return true;
    } else {
      return false;
    }
  }
}