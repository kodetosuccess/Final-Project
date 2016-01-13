int count = 20;
PImage background;
Crocodile c;
Rock r;
ArrayList <Crocodile> crocodiles = new ArrayList();
ArrayList <Rock> rocks = new ArrayList();

void setup() {
  size(1000, 800);
  background = loadImage("setting.jpg");
  c = new Crocodile();
  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Crocodile c = crocodiles.get(i);
    c.display();
  }
  r = new Rock ();
  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
  }
}
void draw() {
  image(background, 0, 0, width, height);
  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Crocodile c = crocodiles.get(i);
    c.display();
  }
  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
  }
}