class Cannonball {
  PVector loc, vel;  //declare PVector for location and velocity of the cannonball
  PImage cnnball;
  int diam;


  Cannonball() {
    loc = new PVector(width/2, height-240);
    vel = new PVector(6, -6);    //set velocity of cannonball b/w 0 and 4
    cnnball = loadImage("cannonball.png");
    diam = 70;
  }

  void move () {
    loc.add(vel);    //add velocity to the cannonball to make it move
  }


  void display () {
    image(cnnball, loc.x, loc.y);    //display the cannonball
  }



  boolean Disappears(Brick b) {    //for the interaction b/w cannonball & brick
    float d = loc.dist(b.loc);
    boolean e;
    if (d < diam/2 + diam) {    //if distance between Cannonball and Brick is less than 1
      return true;
    } else {
      return false;
    }
  }
}