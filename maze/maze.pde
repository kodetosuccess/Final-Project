
PImage maze; 






void setup () {
  imageMode(CENTER); 
  maze = loadImage("maze.png"); 
}

void draw () {
  image(maze, width/2,height/2); 
}