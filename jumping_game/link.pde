class Link {
  PVector loc, vel, g;
  PImage link;
  color c; //color for health bar
  int w; //for health bar

  Link() {
    imageMode(CENTER); 
    link = loadImage("link jump game.png"); 
    c = color (59, 237, 0);
    loc = new PVector (80, 550);
    vel = new PVector(0, -8); 
    g = new PVector (0, 0.3); //gravity
    w = 200; //link stars out with 200 health
  }

  void display() {
    image(link, loc.x, loc.y);
  }

  PVector jump() {
    loc.add(vel); //makes person jump up
    vel.add(g);  //add acceleration
    return loc;
  }

  void forward() { 
    loc.x += 5; //moves link forward
  }

  void backward() {
    loc.x -= 5; //moves link backwards
  }

  boolean isincontactwith(Rock r) {
    if (loc.dist(r.loc) < 70) { //if the distance between link and the rock is < 50
      return true; //return true
    } else {
      return false; //otherwise return false
    }
  }

  void health () { //health bar at top for link
    strokeWeight(8); //border for health bar
    fill(214, 214, 214);  //bg gray color
    rect(146, 96, 206, 16); //draw health bar border
    strokeWeight(0);  
    fill(c); //health bar starts out green initially
    rect(150, 100, w, 10); //health points
  }

  void decreasehp() {
    w -= 5; //decrease health
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
      if (w <= 0) { //if there's no more health
        w = 0; //stop decreasing health
      }
    }
  }
}