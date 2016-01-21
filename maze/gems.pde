class Gem {
  PImage blue, purple, red, green; 

  Gem () {
    blue = loadImage("blue gem.png"); 
    purple = loadImage("purple gem.png"); 
    red = loadImage("red gem.png"); 
    green = loadImage("green gem.png");
  }

  void display() {
    image (blue, 20, 525, 25, 25);
    image(purple, 25, 150, 25, 25);
    image(red, 650, 225, 25, 25);
    image(green, 950, 550, 25, 25);
  }
}