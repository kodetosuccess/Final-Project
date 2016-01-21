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
    if (maze.get(int(loc.x + 5), int(loc.y)) == color(0)) {
      loc.x += 5;
    }
  }

  void spriteleft() { //move sprite to left
    if (maze.get(int(loc.x - 5), int(loc.y)) == color(0)) {
      loc.x -= 5;
    }
  }

  void spriteup() { //move sprite up
    if (maze.get(int(loc.x), int(loc.y - 5)) == color(0)) {
      loc.y -= 5;
    }
  }

  void spritedown() { //move sprite down
    if (maze.get(int(loc.x), int(loc.y + 5)) == color(0)) {
      loc.y += 5;
    }
  }




  boolean isNear() { //if its near one of the gems;

    return true;
  }
}