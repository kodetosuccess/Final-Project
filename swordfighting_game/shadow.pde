class Shadow { //declare new class for shadow
  PVector loc, vel; 
  PImage s, j; 
  float a, i; //for mapping the function


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    vel = new PVector (-3, 0); 
    a = 0;
  }

  void display () { //show shadow
    image (s, loc.x, loc.y); //display shadow
  }
  void move() { //move shadow
    a += 0.01; 
    i = map(noise(a), 0, width, 0, height);
    loc.y = l.loc.y +i; //following y coordinate of link
    loc.add(vel); //give shadow velocity
  }
}