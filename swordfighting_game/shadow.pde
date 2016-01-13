class Shadow { //declare new class for shadow
  PVector loc;  
  PImage s, j; 
  float a, b, i; //for mapping the function


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    a = 0;
  }

  void display () { //show shadow
    image (s, loc.x, loc.y); //display shadow
  }
  void move() { //move shadow
    loc.y = l.loc.y;  //following y coordinate of link
    float a = noise(b); 
    i = map(a, 0, width, 0, width);
    loc.x += i;
    b = l.loc.x + 0.1;
  }
}