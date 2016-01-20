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
    loc.x += 5;
  }

  void spriteleft() { //move sprite to left
    loc.x -= 5;
  }

  void spriteup() { //move sprite up
    loc.y -= 5;
  }

  void spritedown() { //move sprite down
    loc.y += 5;
  }

  boolean isNear() { //if its near one of the gems;
    return true;
  }
}