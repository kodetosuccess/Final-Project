class Cannonball {
  PVector loc, vel;  //declare PVector for location and velocity of the cannonball
  PImage cnnball;


  Cannonball() {
    loc = new PVector(width/2, height-300);
    vel = new PVector(4, 4);    //set velocity of cannonball b/w 0 and 4
    cnnball = loadImage("cannonball.png");
  }

  void move () {
    loc.add(vel);    //add velocity to the cannonball to make it move
  }


  void display () {
    image(cnnball, loc.x, loc.y);    //display the cannonball
  }



  boolean Touches(Cannon C1) {
    if (loc.dist(C1.loc) < 10) {
      return true;
    } else {
      return false;
    }
  }
}