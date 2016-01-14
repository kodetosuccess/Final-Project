class Shadow { //declare new class for shadow
  PVector loc;  
  PImage s, j; 
  float b, i; //for mapping the function
  float w;
  color c; //color for health bar


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    b = 0;
    w = 200;
    c = color (59, 237, 0);
  }

  void display () { //show shadow
    image (s, loc.x, loc.y); //display shadow
  }
  void move() { //move shadow
    loc.y = l.loc.y;  //following y coordinate of link
    float a = noise(b); 
    i = map(a, 0, 200, 0, l.loc.x);
    loc.x -= i;
    b += 0.0000000000000001;
  }

  void health () { //health bar at top for shadow
    strokeWeight(6); 
    fill(c); 
    rect(850, 100, w, 10); //health points
  }

  void hurthealth() { //decrease health
    w -= 10; //decrease by 10
    if (w <= 50){ //if health is < 10
      c = color (255,34,0); //health bar tunrs red
    }
  }
}