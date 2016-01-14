class Link { //declare new class for toon link
  PVector loc, linkforward, linkbackward; 
  PImage l, j; 
  boolean t; 
  int w; //for health bar
  color c; //color for health bar


  Link () {
    imageMode(CENTER); 
    l = loadImage("link.png"); 
    j = loadImage("linkjump.png"); 
    loc = new PVector (300, 600);
    w= 200;
    c = color (59, 237, 0);
  }

  void display () { //display function
    if (t == false) { //if t is flase
      image(l, loc.x, loc.y); //draw image link
    }
    if (t == true) { //if t is true
      image (j, loc.x, loc.y); //jumping link img
    }
  }
  void linkbackward () { //move link backward
    loc.x -= 20;
  }
  void linkforward() { //move link forward
    loc.x += 50;
  }
  void linkjump() { //link is jumping
    loc.y -= 20; //move link up
  }

  void linkdown () {
    loc.y += 20; //moves link down
  }

  boolean isincontactwith (Shadow s) { //to hurt shadow
    if (loc.dist(s.loc) <= loc.x/4 + s.loc.x/4) {
      return true; //then return true
    } else { //otherwise
      return false;
    }
  }


  void health () { //health bar at top for link
    strokeWeight(8); 
    fill(214, 214, 214); 
    rect(146, 96, 206, 16);
    strokeWeight(0); 
    fill(c); 
    rect(150, 100, w, 10); //health points
  }
  
  void decreasehealth() { //decrease health
    w -= 1; //decrease health
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
      if (w <= 0) {
        w = 0;
      }
    }
  }
}