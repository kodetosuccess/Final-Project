/*class Gem {
  PImage blue, purple, red, green; 
  PVector loc; 

  Gem () {
    loc = new PVector (x, y); 
    blue = loadImage("blue gem.png"); 
    purple = loadImage("purple gem.png"); 
    red = loadImage("red gem.png"); 
    green = loadImage("green gem.png");
  }

  void displayblue() {
    loc = new PVector (20, 525); //new location for blue gem

    image (blue, loc.x, loc.y, 25, 25); //display blue gem
    //image(purple, 25, 150, 25, 25);
    //image(red, 650, 225, 25, 25);
    //image(green, 950, 550, 25, 25);
  }

  void displaypurple () {
    loc = new PVector (25, 150); //purple gem's location
    image(purple, loc.x, loc.y, 25, 25); //display purple gem
  }

  void displayred () {
    loc = new PVector (650, 225); //set new location for red gem
    image(red, loc.x, loc.y, 25, 25); //dipslay red gem
  }


  void displaygreen() {
    loc = new PVector (950, 550); //set location for green gem
    image(green, loc.x, loc.y, 25, 25); //display green gem
  }

  boolean linkisnear(Sprite sprite) {
    if (loc.dist(sprite.loc) <= 30) {
      return true;
    } else {
      return false;
    }
  }
}*/