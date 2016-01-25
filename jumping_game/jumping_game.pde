int count = 20;    //declare all variables
PImage background;
ArrayList <Crocodile> crocodiles = new ArrayList();  //array lists for crocodile and rocks
ArrayList <Rock> rocks = new ArrayList();
boolean rockCheck = false; //check if link is in contact with rock
JLink jumpl; //jumping link

void setup() {
  size(1200, 800);
  background = loadImage("tunnel.jpg");  //background image
  imageMode(CENTER); 
  jumpl = new JLink ();
  for (int i = 80; i < width; i+=200) {  //created pattern for rocks to be displayed consecutively
    rocks.add(new Rock(i, 650));    //add a rock every 100 pixels
  }
  for (int i = 200; i <width; i += 200) {  //array for crocodiles
    crocodiles.add(new Crocodile(i, 600));
  }
}


void draw() {
  image(background, width/2, height/2, width, height);    //background image
  for (int i = crocodiles.size()-1; i >= 0; i--) {    //array for the crocodiles
    Crocodile croc = crocodiles.get(i);
    croc.display();
    if (croc.isincontactwith(jumpl)) {   //if link/person touches crocodile, decrease hp
      jumpl.decreasehp();
    }
  }

  for (int i = rocks.size()-1; i >= 0; i--) {    //array for the rocks on the screen
    Rock rock = rocks.get(i);
    rock.display(); //display the rocks
    if (jumpl.isincontactwith(rock)) { //if link touches rock
      rockCheck = true; 
      jumpl.isJump = false; //he's not jumping
    }
  }
  println(rockCheck);
  if (rockCheck == true) { //if link is in contact w/ rock
    jumpl.vel.y = 0; //he's not jumping
    if (!keyPressed) { //and if the key isn't pressed
      jumpl.vel.x = 0; //he's not moving in the x direction
    }
    jumpl.g.y = 0; //and he doesn't have gravity
  }

  if (keyPressed) {
    if (keyCode == RIGHT && jumpl.vel.x < 3) {  //moves link to the right
      jumpl.vel.x += 0.5;
    } 
    if (keyCode == LEFT && jumpl.vel.x > -3) { //moves link backwards
      jumpl.vel.x -= 0.5;
    }
  }

  if (rockCheck == false) { //if he's not touching rock
    jumpl.g.y = 0.2; //he's accelerating downwards
  }
  jumpl.jump(); //make link jump
  jumpl.display(); //display link
  jumpl.health(); //link's hp

  if (jumpl.loc.y >= height ) { //if link falls off screen
    jumpl.returntoscreen(); //returns to first rock
    jumpl.w -= 10; //hp - 10
  }
}

void keyPressed () {
  if (keyCode == UP && !jumpl.isJump) { //makes link jump higher
    jumpl.loc.y -= 10;
    jumpl.vel.y = -10;
    jumpl.g.y = 0.2;
    jumpl.isJump = true;
  }
  if (keyCode ==UP) {
    rockCheck = false;
  }
}