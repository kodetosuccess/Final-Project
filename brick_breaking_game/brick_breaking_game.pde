PVector mouse, vel;    //initialize mouse and vel PVectors
ArrayList<Brick> bricks = new ArrayList<Brick>();    //make array list for bricks
Cannonball c;    //initialize cannonball
Cannon C1;    //intialize cannon
Keytosuccess k;    //initialize key to success
PImage darkdoor;    //access dark door background image


void setup () {
  size(1200, 800);
  c = new Cannonball();    //make a new cannonball
  C1 = new Cannon();    //make a new cannon
  k = new Keytosuccess(random(width), random(0, 300));  //make a new key to success at any location w/in the rows of bricks
  mouse = new PVector();    //make the mouse a new PVector
  darkdoor = loadImage("dark_door.jpg");
  for (int i = 0; i <= width; i+=120) {    //make the top row of bricks
    bricks.add(new Brick(i, 0));    //this, along with the next 3 for loops, sets the row of the bricks apart ***notice adding of 100 to y coordinate, aka the height of the brick***
  }
  for (int i = 0; i<= width; i+=120) {    //make the second row of bricks
    bricks.add(new Brick(i, 100));
  }
  for (int i = 0; i<= width; i+=120) {    //make the third row of bricks  
    bricks.add(new Brick(i, 200));
  }
  for (int i = 0; i<= width; i+=120) {     //make the fourth row of bicks
    bricks.add(new Brick(i, 300));
  }
}


void draw () {
  println("there are " + bricks.size() + " bricks");  //tell us how many bricks there are
  image(darkdoor, 0, 0);    //make the background the dark door
  C1.display();    //display the cannon
  c.display();    //display the cannonball
  k.display();     //display the key to success
  if (mousePressed) {    //if mouse is Pressed
    c.move();    //move the cannonball
  }

  for (int i = bricks.size()-1; i >= 0; i--) {    
    Brick b = bricks.get(i);    //keep adding bricks
    b.display();    //display bricks
    if (c.Disappears(b)) {    //if the cannonball touches one of the bricks
      bricks.remove(i);    //remove the bricks
      c.vel.y = -(c.vel.y);    //put the cannonball in the opposite y direction
      c.vel.x = -(c.vel.x);    //put the cannonball in the opposite x direction
    }
  }

  if (c.EndGame(k)) {    //if the cannonball touches the key, end the game
    image(darkdoor, 0, 0);    //make the background the dark door
  }

  if (C1.Touches(c)) {    //if the Cannon touches the cannonball
    c.vel.y = -(c.vel.y);    //put the cannonball in the opposite y direction
  }

  if (c.loc.y >= height || c.loc.y <= 0) {    //if the cannonball touches the top of the screen ***********get rid of the c.loc.y >= height******************
    c.vel.y = -(c.vel.y);    //put the cannonball in the opposite y direction
  }

  if (c.loc.x >= width || c.loc.x <= 0 ) {    //if the ball touches either side of the screen 
    c.vel.x = -(c.vel.x);    //put the cannonball in the opposite x direction
  }
}