class Link { //declare new class for toon link
  PVector loc, linkforward, linkbackward; 
  PImage l, j; 
  boolean t; 


  Link () {
    imageMode(CENTER); 
    l = loadImage("link.png"); 
    j = loadImage("linkjump.png"); 
    loc = new PVector (300, 600);
  }

  void display () { //display function
    if (t == false) {
      image(l, loc.x, loc.y); //draw image
    }
    if (t == true) {
      image (j, loc.x, loc.y);
    }
  }
  void linkbackward () { //move link backward
    loc.x -= 10;
  }
  void linkforward() { //move link forward
    loc.x += 10; //
  }
  void linkjump() {
    //link is jumping
    loc.y -= 20;
  }
} 