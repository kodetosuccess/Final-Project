class Heart { //declare new class for heart
  PVector loc; 
  PImage h; 
  int count; 
  color c; 


  Heart () {
    colorMode(HSB, 360, 10, 5); 
    imageMode(CENTER); 
    h = loadImage ("heart.png"); 
    loc = new PVector (900, 100);
  }

  void display () { //show heart
    image (h, loc.x, loc.y); //display heart
  }

  void decrease () {
  }
}