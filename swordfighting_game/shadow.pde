class Shadow { //declare new class for shadow
  PVector loc;  
  PImage s, j; 
  float b, i; //for mapping the function
  float w;


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
    b = 0;
    w = 200;
  }

  void display () { //show shadow
    image (s, loc.x, loc.y); //display shadow
  }
  void move() { //move shadow
    loc.y = l.loc.y;  //following y coordinate of link
    float a = noise(b); 
    i = map(a, 0, 300, 0, l.loc.x);
    loc.x -= i;
    b += 0.0000000000000001;
  }

  void health () {
    strokeWeight(8); 
    fill(59, 237, 0); 
    rect(850, 100, w, 10);
  }
}