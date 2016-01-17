class Bucket { //declare new class for catching raindrops
  PVector loc;
  PImage man; 
  float c, d; //control size of image

  Bucket () { //create constructor
    man = loadImage("man.jpg"); 
    loc = new PVector (random(width), random(height));
    imageMode(CENTER); //centers image
    c = 132;
    d = 204;
  }

  void display () { //function display bucket
    image (man, loc.x, loc.y, c, d); //draw image
  }

  void update () {
    loc.set(mouseX, mouseY); //makes loc = mouse
  }

  void decrease (float a) { //function to decrease size of img
    c = c- a;  //decrease width
    d = d - a; //decrease height
  }
}
