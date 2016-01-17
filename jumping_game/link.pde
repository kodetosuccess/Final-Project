class Link {
  PVector loc, vel, g;
  PImage link;

  Link() {
    imageMode(CENTER); 
    link = loadImage("link jump game.png"); 

    loc = new PVector (80, 550);
    vel = new PVector(0, -8); 
    g = new PVector (0, 0.3); //gravity
  }

  void display() {
    image(link, loc.x, loc.y);
  }

  PVector jump() {
    loc.add(vel); //makes person jump up
    vel.add(g);  //add acceleration
    return loc;
  }
}
