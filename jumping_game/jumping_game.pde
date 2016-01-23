int count = 20;    //declare all variables
PImage background;
//Person p;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();
JLink jumpl; 

void setup() {
  size(1200, 800);
  background = loadImage("tunnel.jpg");  //background image
  imageMode(CENTER); 
  for (int i = 80; i < width; i+=200) {  //created pattern for rocks to be displayed consecutively
    rocks.add(new Rock(i, 650));    //add a rock every 100 pixels
  }
  for (int i = 200; i <width; i += 200) {  //array for crocodiles
    crocodiles.add(new Crocodile(i, 600));
  }

  jumpl = new JLink ();
}


void draw() {
  println("jumping is " + jumpl.jumping);
  image(background, width/2, height/2, width, height);    //background image
  for (int i = crocodiles.size()-1; i >= 0; i--) {    //array for the crocodiles
    Crocodile croc = crocodiles.get(i);
    croc.display();
    if (croc.isincontactwith(jumpl)) {   //if link/person touches crocodile, decrease life 
      jumpl.decreasehp();
    }
  }
  boolean timeToFall = true;    
  for (int i = rocks.size()-1; i >= 0; i--) {    //array for the rocks on the screen
    Rock rock = rocks.get(i);
    rock.display(); //display the rocks

    if (jumpl.isincontactwith(rock)) { //if link touches rock
      timeToFall = false;
      //l.vel.y = 0; //link no longer moves
    }
  }
  if (timeToFall) {  //if timeToFall is true
    jumpl.jumpOrFall();
  }
  if (jumpl.loc.y > height) {    //reset the link/person whenever it falls off screen
    jumpl.reset();
  }

  jumpl.display(); //display link
  jumpl.move(); //link will jump
  jumpl.health(); //link's hp
}