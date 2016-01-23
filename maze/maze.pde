

//maze stuff
PImage maze, blue, purple, red, green;  
int gameMode = 0; 
Sprite sprite; 

//light game stuff
ArrayList<Light> lts = new ArrayList <Light>(); //make array list
Lantern lantern; //make Lantern catcher
PVector mouse;   //declare a Pvector mouse
PImage lightscreen; 

//brick breaking stuff
PVector vel;    //initialize mouse and vel PVectors
ArrayList<Brick> bricks = new ArrayList<Brick>();    //make array list for bricks
Ball ball;    //initialize cannonball
Cannon C1;    //intialize cannon
Keytosuccess k;    //initialize key to success
PImage door, brickintro;    //establish dark door background image





void setup () {
  imageMode(CENTER); 
  textAlign(CENTER); 
  size(1200, 800); 

  //maze stuff
  maze = loadImage("maze.png");
  sprite = new Sprite ();
  blue = loadImage("blue gem.png"); 
  purple = loadImage("purple gem.png"); 
  red = loadImage("red gem.png"); 
  green = loadImage("green gem.png");


  //lightcatching stuff
  lightscreen = loadImage("light screen.jpg");
  mouse = new PVector();  //initialize mouse PVector. value is irrelevant since it will be set at the start of void draw(){}
  lts.add(new Light(random(width), random(-height, 0))); //add Lights to arraylist
  lantern = new Lantern(); //Lantern with diameter of 100


  //brick breaking stuff
  brickintro = loadImage("brick breaking beginning screen.jpg"); 
  ball = new Ball();    //make a new cannonball
  C1 = new Cannon();    //make a new cannon
  k = new Keytosuccess(random(width), random(0, 300));  //make a new key to success at any location w/in the rows of bricks
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

  //jumping game stuff
}

void draw () {
  background(maze); 
  println(sprite.loc); 

  if (gameMode == 0) { //if gamemode is 0
    beginningScreen(); //display intro screen
  }



  if (gameMode == 1) { //if game mode is 1
    sprite.display(); //display all those images

    image (blue, 20, 525, 25, 25); //display blue gem (light game)
    if (dist(sprite.loc.x, sprite.loc.y, 20, 525)  <= 50) { //if dist between sprite and blue gem < 50 
      gameMode ++; //increase game mode
    }

    image(purple, 25, 150, 25, 25);  //display purple gem (brick breaking game)
    if (dist(sprite.loc.x, sprite.loc.y, 25, 150)  <= 50) { //if dist between sprite and purple gem < 50
      gameMode = 4; //game mode changes to 4, will display intro screen for brick breaking game
    }


    image(red, 650, 225, 25, 25); //display red gem
    if (dist(sprite.loc.x, sprite.loc.y, 650, 225)  <= 50) { //if dist between sprite and red gem < 50
      gameMode ++; //game mode increases
    }

    image(green, 950, 550, 25, 25);
    if (dist(sprite.loc.x, sprite.loc.y, 950, 550) <= 50) { //if dist between sprite and green gem < 50
      gameMode ++; //game mode increases
    }
  }

  //stuff to display intro screen for individual games and make the games acutally happen



  //light catching game stuff
  if (gameMode == 2) { //display light catching game start screen
    lightcatchingScreen();
  }

  if (gameMode == 3) { //play light catching game
    lightgame();
    sprite.loc.x = 60; //thisll make sure that it doesn't go back to gameMode == 2 and loop
  }


  //brick breaking game stuff
  if (gameMode == 4) { //display brick breaking game start screen
    breakbreakingintroScreen();
  }

  if (gameMode == 5) { //play brick breaking game
    playbrickgame(); 
    sprite.loc.x = 30;
  }
}





void keyPressed() {
  if (keyCode == SHIFT) { //if shift key is pressed
    gameMode ++; //increase gamemode
    lts.clear(); //clear arraylist for lights
  }

  if (gameMode == 1) {
    if (keyCode == UP) { //if key pressed is up
      sprite.spriteup(); //link sprite moves up
    }

    if (keyCode == DOWN) { //if key pressed is down
      sprite.spritedown(); //link sprite moves down
    }

    if (keyCode == LEFT) { //if key pressed is left
      sprite.spriteleft(); //link sprite moves left
    }

    if (keyCode == RIGHT) { //if key pressed is right
      sprite.spriteright(); //link sprite moves right
    }
  }
}















void lightgame() { //playgame funcion
  background(lightscreen); //bg color
  mouse.set(mouseX, mouseY);   //set value of mouse as mouseX,mouseY
  fill(255); //make scoreboard white

  for (int i = 0; i < 20; i++) { //start w/ 20 lights
    lts.add(new Light(random(width), random(-height, 0))); //add new snowballs to array list
  }

  lantern.update(); //updates l.loc as mouse
  lantern.display(); //display Lantern
  lantern.ball(); //light inside lantern

  for (int i= lts.size() - 1; i >= 0; i --) {
    Light r = lts.get(i); //getting item in array lts at index i
    r.display(); //displays Light
    r.fall(); //Lights will fall

    if (r.isInContactWith(lantern)) { //if a Light is in contact with the Lantern
      lantern.grow(); 
      lts.remove(i); 

      if (r.loc.y > height) { //if light hits the bottom of the screen
        lts.remove(i); //remove Light
        lts.clear(); //clears out arraylist
      }
    }
  }
  if (lantern.enoughlight()) {
    gameMode = 1; //return to maze screen
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
    gameMode = 1; //return to maze screen
  }
}