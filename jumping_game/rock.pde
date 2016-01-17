class Rock {
  PImage rock;
  PVector loc, vel, g;


  Rock(float x, float y) {
    imageMode(CENTER); 

    rock = loadImage("rock.png");
    loc = new PVector(x, y);
  }
  void display() {
    image(rock, loc.x, loc.y, 100, 80); //draw rocks
  }
}
