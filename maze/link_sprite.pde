class Sprite {
  PImage sprite; 
  PVector loc; 

  Sprite  () {
    imageMode(CENTER); 
    sprite = loadImage("link sprite.png"); 
    loc = new PVector(50, 700);
  }


  void display() {
    image(sprite, loc.x, loc.y, 75, 75); //display link sprite, scaled down
  }

  void spriteright() { //move sprite to right; 
    if (maze.get(int(loc.x + 5), int(loc.y)) == color(0)) { //if the 5 pixels to the right is black
      loc.x += 5; //link moves right
    }
  }

  void spriteleft() { //move sprite to left
    if (maze.get(int(loc.x - 5), int(loc.y)) == color(0)) { //if 5 [pixels to the left is black
      loc.x -= 5; //link moves left
    }
  }

  void spriteup() { //move sprite up
    if (maze.get(int(loc.x), int(loc.y - 5)) == color(0)) { //if 5 pixels up is black
      loc.y -= 5; //link moves up
    }
  }

  void spritedown() { //move sprite down
    if (maze.get(int(loc.x), int(loc.y + 5)) == color(0)) { //if 5 pixels down is black
      loc.y += 5; //link moves down
    }
  }
}