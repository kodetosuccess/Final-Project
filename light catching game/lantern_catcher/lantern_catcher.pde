class Lantern { //declare new class for catching raindrops
  PVector loc;
  PImage lantern; 
  float x; 



  Lantern () { //create constructor
    lantern = loadImage("lantern.png"); 
    loc = new PVector (random(width), random(height));
    imageMode(CENTER); //centers image
    x = 10; //for light size
  }

  void display () { //function display bucket
    image(lantern, loc.x, loc.y, 150, 300); //draw image
  }

  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }

  void ball () {
    fill(255, 246, 125); 
    ellipse(loc.x, loc.y + 25, x, x); //makes light circle
  }

  void grow() {
    x += .05; //will make light in lantern slowly grow bigger
  }

  boolean enoughlight() { //see weather or not light is big enough
    if (x >= 50) {
      return true;
    } else {
      return false;
    }
  }
}