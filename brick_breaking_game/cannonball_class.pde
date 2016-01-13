class Cannonball {
  PVector loc, vel;
  PImage cnnball;
  
  
  Cannonball() {
    loc = new PVector();
    vel = new PVector(0, 4);
    cnnball = loadImage("cannonball.png"); 
  }
  
  void move () {
    loc.add(vel);    //add velocity to the cannonball
  }
  
  
  void display () {
    image(cnnball, width/2, height-80);  
  }
  
  void update () {
    loc.set(loc.x, loc.y);
  }
  