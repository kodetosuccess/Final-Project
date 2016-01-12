//declare + intialize variables

Link l; 
Shadow s; 
PImage forest; 

void setup () {
  size (1200, 800);
  imageMode(CENTER); 
  l = new Link();
  s = new Shadow(); 
  forest = loadImage ("forest.jpg");
}


void draw () {

  image (forest, width/2, height/2); //draw bg
  l.display(); //display link
  s.display(); //display shadow
}

void keyPressed () {
  if (keyCode == 'D') { //if D key is pressed
    l.linkforward(); //link moves forwards
  }
  if (keyCode == 'A') { // if A is pressed
    l.linkbackward(); //link moves backwards
  }
  if (keyCode == 'W') { //if W is pressed
    l.t = true; 
    l.linkjump ();
  }
}