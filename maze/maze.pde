

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

//jumping game stuff
PImage fallinglink; //for start screen
int count = 20;    //declare all variables
PImage tunnel;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();
boolean rockCheck = false; //check if link is in contact with rock
JLink jumpl; //jumping link

//swordfighting game stuff
Link l; 
Shadow s; 
PImage forest, swordintro; 

//end screen stuff
PImage lostwoods; 



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
  fallinglink = loadImage("falling link.png");
  jumpl = new JLink ();
  tunnel = loadImage("tunnel.jpg"); 
  for (int i = 80; i < width; i+=200) {  //created pattern for rocks to be displayed consecutively
    rocks.add(new Rock(i, 650));    //add a rock every 100 pixels
  }
  for (int i = 200; i <width; i += 200) {  //array for crocodiles
    crocodiles.add(new Crocodile(i, 600));
  }

  //swordfighting game stuff
  l = new Link();
  s = new Shadow(); 
  forest = loadImage ("forest.jpg");
  swordintro = loadImage("swordfighting intro screen.jpg"); 

  //end screen
  lostwoods = loadImage("lost woods.jpg");
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
      gameMode = 6; //game mode for jumping game start screen
    }

    image(green, 950, 550, 25, 25);
    if (dist(sprite.loc.x, sprite.loc.y, 950, 550) <= 50) { //if dist between sprite and green gem < 50
      gameMode = 8; //game mode to start sword fighting game
    }

    if (maze.get(int(sprite.loc.x + 5), int(sprite.loc.y)) == color(5, 66, 19)) { //if the 5 pixels to the right  of sprite is green
      gameMode = 10; //game mode is 10
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
    sprite.loc.x = 100; //move sprite to new location so can continue maze
  }


  //jumping game stuff
  if (gameMode == 6) {
    jumpgameScreen(); //display jumpg game screen
  }

  if (gameMode == 7) {
    jumpinggame(); 
    sprite.loc.x = 600; //moves it so can continue maze
    sprite.loc.y = 275;
  }

  //swordfighting game stuff
  if (gameMode == 8) {
    swordfightingScreen(); //display intro to sword fighting game
  }

  if (gameMode == 9) {
    swordfighting(); //play swordfighting game
    sprite.loc.x = 990; 
    sprite.loc.y = 590;
  }

  //end screen
  if (gameMode == 10) {
    endScreen();
  }
}





void keyPressed() {
  if (keyCode == SHIFT) { //if shift key is pressed
    gameMode ++; //increase gamemode
    lts.clear(); //clear arraylist for lights
  }


  if (gameMode == 1) { //controls for while in maze
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

  if (gameMode == 7) { //controls for jumping game
    if (keyCode == UP && !jumpl.isJump) { //makes link jump higher
      jumpl.loc.y -= 10;
      jumpl.vel.y = -10;
      jumpl.g.y = 0.2;
      jumpl.isJump = true;
    }
    if (keyCode ==UP) {
      rockCheck = false;
    }
  }

  if (gameMode == 9) { //controls for swordfighting game
    if (keyCode == RIGHT) { //if right key is pressed
      l.linkforward(); //link moves forwards
    }
    if (keyCode == LEFT) { // if left is pressed
      l.linkbackward(); //link moves backwards
    }
    if (keyCode == UP) { //if upr is pressed
      l.t = true; //l.t (boolean that controls which link img is displayed) is true
      l.linkjump(); //link jumps up
    }
    if (keyCode == DOWN) { // if down is pressed
      l.t = false; 
      l.linkdown(); //link moves down
    }
  }
}












//functions for games


void lightgame() { //playgame funcion
  background(lightscreen); //bg 
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
  //println(C1.Touches(ball)); 
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
      ball.vel.x = ball.vel.x / abs(ball.vel.x) * random(3, 10);    //put the cannonball in the opposite (random) x direction
    }
  }

  if (C1.Touches(ball)) {    //if the Cannon touches the cannonball
    ball.vel.y = -ball.vel.y;    //put the cannonball in the opposite y direction
  }


  if (ball.loc.y + ball.diam/2 >= height || ball.loc.y - ball.diam/2 <= 0) {    //if the cannonball touches the top of the screen 
    ball.vel.y = -(ball.vel.y);    //put the cannonball in the opposite y direction
    ball.loc.y -= 5; // this is to make sure the ball does not get entangled with the wall
  }
  if (ball.loc.x + ball.diam/2 >= width) {    //if the ball touches either side of the screen 
    ball.loc.x -= 5; // this is to make sure the ball does not get entangled with the wall
    ball.vel.x = -ball.vel.x;    //put the cannonball in the opposite x direction
  }

  if (ball.loc.x - ball.diam/2 <= 0 ) {
    ball.loc.x += 5; // this is to make sure the ball does not get entangled with the wall
    ball.vel.x = -ball.vel.x;  //put the cannonball in the opposite x direction
  }

  if (ball.EndGame(k)) {  //if the cannonball touches the key, end the game
    gameMode = 1; //return to maze screen
  }
}



void jumpinggame() {
  background(tunnel);    //background image
  for (int i = crocodiles.size()-1; i >= 0; i--) {    //array for the crocodiles
    Crocodile croc = crocodiles.get(i);
    croc.display();
    if (croc.isincontactwith(jumpl)) {   //if link/person touches crocodile, decrease hp
      jumpl.decreasehp();
    }
  }

  for (int i = rocks.size()-1; i >= 0; i--) {    //array for the rocks on the screen
    Rock rock = rocks.get(i);
    rock.display(); //display the rocks
    if (jumpl.isincontactwith(rock)) { //if link touches rock
      rockCheck = true; 
      jumpl.isJump = false; //he's not jumping
    }
  }
  //println(rockCheck);
  if (rockCheck == true) { //if link is in contact w/ rock
    jumpl.vel.y = 0; //he's not jumping
    if (!keyPressed) { //and if the key isn't pressed
      jumpl.vel.x = 0; //he's not moving in the x direction
    }
    jumpl.g.y = 0; //and he doesn't have gravity
  }
  if (keyPressed) {
    if (keyCode == RIGHT && jumpl.vel.x < 3) {  //moves link to the right
      jumpl.vel.x += 0.5;
    } 
    if (keyCode == LEFT && jumpl.vel.x > -3) { //moves link backwards
      jumpl.vel.x -= 0.5;
    }
  }
  if (rockCheck == false) { //if he's not touching rock
    jumpl.g.y = 0.2; //he's accelerating downwards
  }
  jumpl.jump(); //make link jump
  jumpl.display(); //display link
  jumpl.health(); //link's hp

  if (jumpl.loc.y >= height ) { //if link falls off screen
    jumpl.returntoscreen(); //returns to first rock
    jumpl.w -= 10; //hp - 10
  }
  if (jumpl.loc.x >= width) { //if link jumps across all the rocks
    gameMode = 1; //returns to maze
  }
  if (jumpl.w == 0) { //if health becomes 0
    gameMode = 1;
  }
}


void swordfighting() {
  background(forest); 
  l.display(); //display link
  s.display(); //display shadow
  l.backonscreen();  //makes sure that link doesn't go off screen
  s.health(); //health bars for shadow and link
  l.health();
  if (l.isincontactwith(s) ) { //if link touches shadow
    s.decreasehealth(); //shadow's health decreases
  }
  if (s.isincontactwith(l)) { //if shadows gets past link's sword
    l.decreasehealth(); //links' health will decrease
  }
  if (s.nohealth()) { //if shadow's health is 0
    gameMode = 1; //will return to maze
  }
}