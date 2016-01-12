//declare + intialize variables

Link l; 

void setup () {
  size (1200, 800);
  l = new Link();
}


void draw () {
  l.display();
}

void keyPressed () {
  if (keyCode == 'd') { //if "a" key is pressed
    l.linkforward(); //link moves backwards
  }
}