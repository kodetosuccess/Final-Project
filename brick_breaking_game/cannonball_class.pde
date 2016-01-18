class Cannonball {      //make Cannonball class
  PVector loc, vel;  //declare PVector for location and velocity of the cannonball
  PImage cnnball;    //initialize cannonball PImage
  int diam;      //initialize diam which serves same purpose as diam in the cannon class
  int diam1;


  Cannonball() {
    loc = new PVector(width/2, height-240);      //make initial location of the cannonball a little above the cannon
    vel = new PVector(6, -6);    //set velocity of cannonball 
    cnnball = loadImage("cannonball.png");    //bring in the cannonball image
    diam = 70;    //setup of diam serves same purpose as diam in cannon class
    diam1 = 20;
  }

  void move () {
    loc.add(vel);    //add velocity to the cannonball to make it move
  }


  void display () {
    image(cnnball, loc.x, loc.y);    //display the cannonball
  }

  boolean EndGame (Keytosuccess k) {    //used to end the game when you found the key
    float z = loc.dist(k.loc);
    if (z < diam1/2 + diam1) {
      return true;
    } else {
      return false;
    }
  }

  boolean Disappears(Brick b) {    //for the interaction b/w cannonball & brick
    float d = loc.dist(b.loc);    //make d variable which is the distance b/w the brick and cannonball
    if (d < diam/2 + diam) {   //if the distance is less than 105  ***we set this up to keep ourselves organized***
      return true;
    } else {
      return false;
    }
  }
}