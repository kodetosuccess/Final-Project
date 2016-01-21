
PImage maze, blue, purple, red, green;  
int gameMode = 0; 
Sprite sprite; 
int x, y;




void setup () {
  imageMode(CENTER); 
  size(1200, 800); 
  maze = loadImage("maze.png");
  sprite = new Sprite ();
  blue = loadImage("blue gem.png"); 
  purple = loadImage("purple gem.png"); 
  red = loadImage("red gem.png"); 
  green = loadImage("green gem.png");
}

void draw () {
  background(maze); 
  println(gameMode); 

  //if (gameMode == 0) { //if gamemode is 0

  // beginningscreen(); //display intro screen
  //  }

  sprite.display(); //display all those images
  image (blue, 20, 525, 25, 25); //display blue gem
  // gem.displaypurple();
  //gem.displayred();
  //gem.displaygreen(); 

  if (dist(sprite.loc.x, sprite.loc.y, 20, 525) <= 50) {
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