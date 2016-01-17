int count = 20;    //declare all variables
PImage background;
//Person p;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();
Link l; 

void setup() {
  background = loadImage("setting.jpg");  //background image
  imageMode(CENTER); 

  size(1200, 800);
  for (int i = 80; i < width; i+=200) {  //created pattern for rocks to be displayed consecutively
    rocks.add(new Rock(i, 650));    //add a rock every 100 pixels
  }
  for (int i = 200; i <width; i += 200) {  //array for crocodiles
    crocodiles.add(new Crocodile(i, 600));
  }

 l = new Link (); 

}


void draw() {
  image(background, width/2, height/2, width, height);

  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Crocodile c = crocodiles.get(i);
    c.display();
  }
  for (int i = rocks.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display();
  }
    l.display(); //display link
   l.jump(); //cause link to jump
}
