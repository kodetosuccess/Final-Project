PImage background;
Crocodile c;
Rock r;

void setup() {
  size(1000,800);
  background = loadImage("setting.jpg");
  c = new Crocodile();
  r = new Rock ();
}

void draw() {
  image(background,0,0,width,height);
  c.display();
  r.display();
}