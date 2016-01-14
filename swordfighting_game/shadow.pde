class Shadow { //declare new class for shadow
  PVector loc;  
  PImage s, j; 
  float b, i; //for mapping the function
  float w;
  color c; //color for health bar
  float noise;


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    b = 0;
    w = 200;
    c = color (59, 237, 0);
    noise = random(20);
  }

  void display () { //show shadow
    //image (s, l.loc.x + 100 + noise, loc.y); //display shadow
    image(s, getLoc().x, getLoc().y);
  }

  PVector getLoc() {
    float a = noise(b);
    i = map(a, 0, 1, 0, width*.6);
    noise = i;
    b += .03;
    PVector newLoc = new PVector(l.loc.x + 100 + noise, l.loc.y);

    return newLoc;
  }



  void health () { //health bar at top for shadow
    strokeWeight(8); 
    fill(214, 214, 214); 
    rect(846, 96, 206, 16);
    strokeWeight(0); 
    fill(c); 
    rect(850, 100, w, 10); //health points
  }

  void decreasehealth() { //decrease health
    w -= 2; //decrease by 10
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
      if (w <= 0) {
        w = 0;
      }
    }
  }
}