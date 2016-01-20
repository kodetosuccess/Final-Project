
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
  
  
}







void startscreen() {
}