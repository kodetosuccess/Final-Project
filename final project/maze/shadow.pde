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
    c = color (59, 237, 0); //color of health bar
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
    b += .035;
    PVector newLoc = new PVector(l.loc.x + 100 + noise, l.loc.y);
    return newLoc;
  }

  boolean isincontactwith (Link l) { //function for if shadow is in contact w/ link
    if (loc.dist(l.loc) <= 50) { //if the distance between shadow and link is less than 50
      return true; //then return true
    } else { //otherwise
      return false;
    }
  }




  void health () { //health bar at top for shadow
    strokeWeight(8); //border of healthbar
    fill(0); 
    rect(844, 96, 210, 18); 
    fill(214, 214, 214);  //gray bg fill
    rect(850, 100, 200, 10); //draw rect
    strokeWeight(0); 
    fill(c); 
    rect(850, 100, w, 10); //health points
  }

  void decreasehealth() { //decrease health
    w -= 5; //decrease health
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
    }
  }
  boolean nohealth() { 
    if (w <= 0) { //if health gets to 0
      return true;
    } else {
      return false;
    }
  }
}