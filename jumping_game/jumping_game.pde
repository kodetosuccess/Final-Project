int count = 20;    //declare all variables
PImage background;
//Person p;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();

void setup() {
  size(1200, 800);
  for (int i = 50; i < width; i+=200) {  //created pattern for rocks to be displayed consecutively
    rocks.add(new Rock(i, 600));    //add a rock every 100 pixels
  }
  for (int i = 100; i <width; i += 200) {  //array for crocodiles
    crocodiles.add(new Crocodile(i, 600));
  }
  background = loadImage("setting.jpg");  //background image
  //p = new Person();
  //p.display();
}
void draw() {
  image(background, 0, 0, width, height);

  //p.display();

  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Crocodile c = crocodiles.get(i);
    c.display();
  }
  for (int i = rocks.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
  }
}