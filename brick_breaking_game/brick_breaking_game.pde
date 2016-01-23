PVector mouse, vel;    //initialize mouse and vel PVectors
ArrayList<Brick> bricks = new ArrayList<Brick>();    //make array list for bricks
Ball ball;    //initialize cannonball
Cannon C1;    //intialize cannon
Keytosuccess k;    //initialize key to success
PImage door;    //establish dark door background image



int gameMode = 0; 

void setup () {
  size(1200, 800);
  imageMode(CENTER); 
  ball = new Ball();    //make a new cannonball
  C1 = new Cannon();    //make a new cannon
  k = new Keytosuccess(random(width), random(0, 300));  //make a new key to success at any location w/in the rows of bricks

  mouse = new PVector();    //make the mouse a new PVector
  door = loadImage("door.png");    //access zelda dark door image

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
  if (gameMode == 0) {
    playbrickgame();
  }
}





void playbrickgame() {
  background(door); 
  println(C1.Touches(ball)); 
  //println("there are " + bricks.size() + " bricks");  //tell us how many bricks there are

  C1.display();    //display the cannon
  ball.display();    //display the cannonball
  k.display();     //display the key to success
  ball.move();    //move the cannonball
  C1.update(); 

  for (int i = bricks.size()-1; i >= 0; i--) {    
    Brick b = bricks.get(i);    //keep adding bricks
    b.display();    //display bricks
    if (ball.Disappears(b)) {    //if the cannonball touches one of the bricks
      bricks.remove(i);    //remove the bricks
      ball.vel.y = -(ball.vel.y);    //put the cannonball in the opposite y direction
      ball.vel.x = random(3, 10);    //put the cannonball in the opposite (random) x direction
    }
  }

  if (C1.Touches(ball)) {    //if the Cannon touches the cannonball
    ball.vel.y = -ball.vel.y;    //put the cannonball in the opposite y direction
  }


  if (ball.loc.y + ball.diam/2 >= height || ball.loc.y - ball.diam/2 <= 0) {    //if the cannonball touches the top of the screen 
    ball.vel.y = -(ball.vel.y);    //put the cannonball in the opposite y direction
  }



  if (ball.loc.x + ball.diam/2 >= width || ball.loc.x - ball.diam/2 <= 0 ) {    //if the ball touches either side of the screen 
    ball.vel.x = -ball.vel.x;    //put the cannonball in the opposite x direction
  }

  if (ball.EndGame(k)) {    //if the cannonball touches the key, end the game
    //gameMode == 0; //for main code later
  }
}