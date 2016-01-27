class Crocodile {  //new class for crocodiles
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

  boolean isincontactwith(JLink jumpl) {  //if link/person is in contact with object
    if (loc.dist(jumpl.loc) < 60) {
      return true;
    } else {
      return false;
    }
  }
}