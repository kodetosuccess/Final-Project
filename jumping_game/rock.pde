class Rock {
  PImage rock;
  PVector loc;


  Rock(float x, float y) {

    rock = loadImage("rock.png");
    loc = new PVector(x,y);
  }
  void display() {
    image(rock, loc.x, loc.y, 100, 80);
  }
}