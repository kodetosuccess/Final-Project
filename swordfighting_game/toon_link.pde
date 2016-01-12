class Link { //declare new class for toon link
  PVector loc, linkforward, linkbackward; 
  PImage l, j; 


  Link () {
    imageMode(CENTER); 
    l = loadImage("link.png"); 
    j = loadImage("linkjump.png"); 
    loc = new PVector (300, 600);
  }

  void display () { //display function
    image(l, loc.x, loc.y); //draw image
  }
  void linkbackward () { //move link backward
    loc.x -= 10;
  }
  void linkforward() { //move link forward
    loc.x += 10; //
  }
  void linkjump() {
    image (j, loc.x, loc.y); //link is jumping
    loc.y -= 20;
  }
} 