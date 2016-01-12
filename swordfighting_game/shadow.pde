class Shadow { //declare new class for shadow
  PVector loc; 
  PImage s, j; 


  Shadow () {
    imageMode(CENTER); 
    s = loadImage ("shadow.png"); 
    loc = new PVector (900, 600);
  }

  void display () { //show shadow
    image (s, loc.x, loc.y);
  }
  void move(){
  }
}