int count = 20;    //declare all variables
PImage background;
//Person p;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();
Link l; 

void setup() {
  background = loadImage("tunnel.jpg");  //background image
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
  println("jumping is " + l.jumping);
  image(background, width/2, height/2, width, height);    //background image
  for (int i = crocodiles.size()-1; i >= 0; i--) {    //array for the crocodiles
    Crocodile c = crocodiles.get(i);
    c.display();
    if (c.isincontactwith(l)) {   //if link/person touches crocodile, decrease life 
      l.decreasehp();
    }
  }
  boolean timeToFall = true;    
  for (int i = rocks.size()-1; i >= 0; i--) {    //array for the rocks on the screen
    Rock r = rocks.get(i);
    r.display(); //display the rocks

    if (l.isincontactwith(r)) { //if link touches rock
      timeToFall = false;
      //l.vel.y = 0; //link no longer moves
    }
  }
  if (timeToFall) {  //if timeToFall is true
    l.jumpOrFall();
  }
  if (l.loc.y > height) {    //reset the link/person whenever it falls off screen
    l.reset();
  }

  l.display(); //display link
  l.move(); //link will jump
  l.health(); //link's hp
}