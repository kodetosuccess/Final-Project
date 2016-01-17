class Crocodile {
  PImage croc;
  PVector loc;

  Crocodile(float x, float y) {
    imageMode(CENTER); 

    croc = loadImage("crocodile.png");
    loc = new PVector(x, y);
  }

  void display() {
    image(croc, loc.x, loc.y, 100, 100);
  }
  
  boolean isincontactwith(Link l){
    if (loc.dist(l.loc) < 50){
      return true;
    } else {
      return false; 
    }
  }
}
