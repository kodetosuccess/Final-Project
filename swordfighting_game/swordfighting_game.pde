//declare + intialize variables

Link l; 
Shadow s; 
//Heart h; 
PImage forest; 

void setup () {
  size (1200, 800);
  imageMode(CENTER); 
  l = new Link();
  s = new Shadow(); 
  forest = loadImage ("forest.jpg");
  //h = new Heart();
}


void draw () {

  image (forest, width/2, height/2); //draw bg
  l.display(); //display link
  s.display(); //display shadow
  //h.display(); //display health
  s.move(); //move shadow around to follow link
  s.health();
}

void keyPressed () {
  if (keyCode == 'D') { //if D key is pressed
    l.linkforward(); //link moves forwards
  }
  if (keyCode == 'A') { // if A is pressed
    l.linkbackward(); //link moves backwards
  }
  if (keyCode == 'W') { //if W is pressed
    l.t = true; //l.t (boolean that controls which link img is displayed) is true
    l.linkjump(); //link jumps up
  }
  if (keyCode == 'S') { // if S is pressed
    l.t = false; 
    l.linkdown(); //link moves down
  }
}