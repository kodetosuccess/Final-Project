
PImage maze; 
int gameMode = 0; 
Sprite sprite; 




void setup () {
  imageMode(CENTER); 
  size(1200, 800); 
  maze = loadImage("maze.png");
  sprite = new Sprite ();
}

void draw () {

  if (gameMode == 0) { //if gamemode is 0

    introscreen(); //display intro screen
  }
  image(maze, width/2, height/2);
  sprite.display();
}


void keyPressed() {
  if (keyCode == 'W') { //if key pressed is w
    sprite.spriteup(); //link sprite moves up
  }

  if (keyCode == 'S') { //if key pressed is S
    sprite.spritedown(); //link sprite moves down
  }

  if (keyCode == 'A') { //if key pressed is A
    sprite.spriteleft(); //link sprite moves left
  }

  if (keyCode == 'D') { //if key pressed is D
    sprite.spriteright(); //link sprite moves right
  }
}







void introscreen() {
}