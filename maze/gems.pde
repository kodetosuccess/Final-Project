class Gem {
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
    loc = new PVector (20, 525); 

    image (blue, loc.x, loc.y, 25, 25);
    //image(purple, 25, 150, 25, 25);
    //image(red, 650, 225, 25, 25);
    //image(green, 950, 550, 25, 25);
  }

  void purple () {
    loc = new PVector (25, 150); 
    image(purple, loc.x, loc.y, 25, 25);
  }

  void red () {
    loc = new PVector (650, 225); 
    image(red, loc.x, loc.y, 25, 25); 
  }
}