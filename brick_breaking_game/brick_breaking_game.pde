PVector mouse, vel;
ArrayList<Brick> bricks = new ArrayList<Brick>();    //make array list for bricks
Cannonball c;    //initialize cannonball
Cannon C1;    //intialize cannon
PImage darkdoor;


void setup () {
  size(1200, 800);
  c = new Cannonball();
  C1 = new Cannon();
  mouse = new PVector();
  vel = new PVector(0, 4);
  darkdoor = loadImage("dark_door.jpg");
  for (int i = 0; i <= width; i+=120) {
    bricks.add(new Brick(i, 0));
  }
  for (int i = 0; i<= width; i+=120) {
    bricks.add(new Brick(i, 100));
  }
  for (int i = 0; i<= width; i+=120) {
    bricks.add(new Brick(i, 200));
  }
  for (int i = 0; i<= width; i+=120) {
    bricks.add(new Brick(i, 300));
  }
}


void draw () {
  println("there are " + bricks.size() + " bricks");  //tell us how many bricks there are
  image(darkdoor, 0, 0);    //make the background the dark door
  C1.display();
  c.display();
  if (mousePressed) {
  c.move();
  }
  //bricks.add(new Brick(random(width), 0));
  for (int i = bricks.size()-1; i >= 0; i--) {
    Brick b = bricks.get(i);
    //c.display();
    //c.move();
    //c.update();
    b.display();
    //C1.display();
    if (b.Disappears(c)) {
      bricks.remove(i);
    }
  }

  if (c.Touches(C1)) {
    c.vel.y = -(c.vel.y);
    c.vel.x = -(c.vel.x);
    //c.update();
  }
}