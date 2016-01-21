
PImage maze; 
int gameMode = 0; 
Sprite sprite; 
int x, y;
Gem gem; 




void setup () {
  imageMode(CENTER); 
  size(1200, 800); 
  maze = loadImage("maze.png");
  sprite = new Sprite ();
  gem = new Gem ();
}

void draw () {
  background(maze); 
  println(gameMode); 

  //if (gameMode == 0) { //if gamemode is 0

  // introscreen(); //display intro screen
  //  }
  sprite.display(); //display all those images
  gem.displayblue();
  gem.displaypurple();
  gem.displayred();
  gem.displaygreen(); 

  if (gem.linkisnear(sprite)) {
    gameMode ++;
  }
}


void keyPressed() {
  if (keyCode == SHIFT) { //if shift key is pressed
    gameMode ++; //increase gamemode
  }


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