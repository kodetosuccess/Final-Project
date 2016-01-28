class Light { //create class for light
  PVector loc, vel, g; //location for light
  int diam ; //diameter for light
  color c; //color for light


  Light (float x, float y) {
    diam = 20; //diameter is 20
    loc = new PVector(x, y);
    c = color(random(240, 255), random(255), random(78)); //makes light random color
    vel = PVector.random2D(); //velocity with random magnitude of 1
    vel.mult(random(2, 7)); //multiplies velocity
    g = new PVector (0, 0.2); //acceleration of 0,2
  }

  void display () {
    fill(c); //makes light blue
    noStroke(); //no stroke
    ellipse(loc.x, loc.y, diam, diam); //creates light
  }

  void fall() {
    loc.add(vel); //gives lightvelocity
    vel.add(g); // add gravity
  }
  
  void reset () {
    loc.y = 0; //brings light back to top of screen
    loc.x = random(diam/2, width - diam/2); //resets light in x direction 
    vel.x = 0; 
    vel.y = 0; //this way light wont speed up
  }


  boolean isInContactWith(Lantern lantern) { 
    if (loc.dist(lantern.loc) <=  75) { //if distance between lantern and lights is < 75
      return true;
    } else {
      return false;
    }
  }
}