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

  println(l.loc.y);
  image(background, width/2, height/2, width, height);

  for (int i = crocodiles.size()-1; i >= 0; i--) {
    Crocodile c = crocodiles.get(i);
    c.display();
    if (c.isincontactwith(l)) {
      l.decreasehp();
    }
  }
  for (int i = rocks.size()-1; i >= 0; i--) {
    Rock r = rocks.get(i);
    r.display(); //display the rocks
    if (l.isincontactwith(r)) { //if link touches rock
      l.vel.y = 0; //link no longer moves
      l.vel.y = -5;
    }
  }
  if(l.loc.y > height){
    l.reset();
  }

  l.display(); //display link
  l.move(); //link will jump
  l.health(); //link's hp

}