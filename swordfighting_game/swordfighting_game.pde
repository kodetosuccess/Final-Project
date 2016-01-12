//declare + intialize variables

Link l; 
PImage forest; 

void setup () {
  size (1200, 800);
  imageMode(CENTER); 
  l = new Link();
  forest = loadImage ("forest.jpg");
}


void draw () {

  image (forest, width/2, height/2); //draw bg
  l.display();
}

void keyPressed () {
  if (keyCode == 'D') { //if "a" key is pressed
    l.linkforward(); //link moves backwards
  }
  if (keyCode == 'A') {
    l.linkbackward();
  }
  if (keyCode == 'W') {
    l.linkjump ();
  }
}