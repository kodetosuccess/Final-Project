class Link { //declare new class for toon link
  PVector loc, linkforward, linkbackward; 
  PImage  j; 
  int count = 0; 
  int numpics = 3; 
  PImage l [] = new PImage [numpics]; 
  boolean t; 
  int w; //for health bar
  color c; //color for health bar


  Link () {
    imageMode(CENTER); 
    for (int i = 0; i < numpics; i++) {
      l[i] = loadImage("link" + i + ".png");
    }

    j = loadImage("linkjump.png"); 
    loc = new PVector (300, 600);
    w= 200;
    c = color (59, 237, 0);
  }

  void display () { //display function
    //if (t == false) { //if t is flase
    if (frameCount%5 == 0) {
      count ++;
    } 
    image(l[count%l.length], loc.x, loc.y);

    //}
    //  image(l[i], loc.x, loc.y); //draw image link
    //}
    //if (t == true) { //if t is true
    //  image (j, loc.x, loc.y); //jumping link img
    //}
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
    if (loc.dist(s.loc) <= 75) {
      return true; //then return true
    } else { //otherwise
      return false;
    }
  }


  void health () { //health bar at top for link
    strokeWeight(8); //border for health bar
    fill(214, 214, 214);  //bg gray color
    rect(146, 96, 206, 16); //draw health bar border
    strokeWeight(0); 
    fill(c); //health bar starts out green initially
    rect(150, 100, w, 10); //health points
  }

  void decreasehealth() { //decrease health
    w -= 1; //decrease health
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
      if (w <= 0) { //if there's no more health
        w = 0; //stop decreasing health
      }
    }
  }
}