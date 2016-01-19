//declare + intialize variables

Link l; 
Shadow s; 
//Heart h; 
PImage forest, lostwoods; 

void setup () {
  size (1200, 800);
  imageMode(CENTER); 
  textAlign(CENTER); 
  l = new Link();
  s = new Shadow(); 
  forest = loadImage ("forest.jpg");
  lostwoods = loadImage("lost woods.jpg"); 

  //h = new Heart();
}


void draw () {
  println(s.loc.x - l.loc.x); 

  image (forest, width/2, height/2); //draw bg

  l.display(); //display link
  s.display(); //display shadow
  //h.display(); //display health

  s.health(); //health bars for shadow and link
  l.health();
  if (l.isincontactwith(s) ) { //if link touches shadow
    s.decreasehealth(); //shadow's health decreases
  }
  if (s.isincontactwith(l)) { //if shadows gets past link's sword
    l.decreasehealth(); //links' health will decrease
  }
  if (s.nohealth()) { //if shadow's health is 0
    endscreen(); //display endscreen
  }
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


void endscreen() {
  image(lostwoods, width/2, height/2); //lost woods image
  fill(255);
  textSize(30);

  text("Congratulations, you have finally made it out of the maze.", width/2, 300); 
  text("Now let the music of the forest guide you on the rest of your journey...", width/2, 350);
}