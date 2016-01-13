class Shadow { //declare new class for shadow
  PVector loc; 
  PImage s, j; 
  float a, i; 


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    a = 0;
  }

  void display () { //show shadow
    image (s, loc.x, loc.y);
  }
  /*void move() {
    a += 0.01; 
    i = map(noise(a), 0, 1, -100, 100);
    loc.y += i;
  }*/
}