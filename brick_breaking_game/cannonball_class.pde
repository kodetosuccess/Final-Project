class Cannonball {
  PVector loc, vel;
  PImage cnnball;


  Cannonball() {
    loc = new PVector();
    vel = new PVector(0, 4);
    cnnball = loadImage("cannonball.png");
  }

  void move () {
    loc.add(vel);    //add velocity to the cannonball to make it move
  }


  void display () {
  }

  void update () {
    loc.set(loc.x, loc.y);
    vel.y = -vel.y;
  }

  boolean Touches(PVector y) {
    if (loc.dist(y) < 10) {
      return true;
    } else {
      return false;
    }
  }
  

}