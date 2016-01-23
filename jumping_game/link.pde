class JLink {
  PVector loc, vel, g;
  PImage jlink;
  color c; //color for health bar
  int w; //for health bar
  Boolean jumping;

  JLink() {
    imageMode(CENTER); 
    jlink = loadImage("link jump game.png"); 
    c = color (59, 237, 0);
    loc = new PVector (80, 550);
    vel = new PVector(0, 0); //changed velocity so link starts to jump higher
    g = new PVector (0, 0.3); //gravity
    w = 200; //link stars out with 200 health
    jumping = false;
  }

  void display() {
    image(jlink, loc.x, loc.y);
  }

  void startJump() {
    jumping = true; //makes person jump up
    vel.y = -7;  //add velocity to make it go up
    //g.y = .6; //gravity
    println("start a jump in frame " + frameCount);
  }

  void endJump() {
    loc.y = 550; //ends jump when in contact with rock
    vel.y = 0;
    //g.y = 0;
    jumping = false;
    println("ended jump in frame " + frameCount);
  }

  void jumpOrFall() {
    vel.add(g); //add gravity to link moving makes it more realistic
    loc.add(vel); //add velocity to location
  }

  void move() {
    if (jumping) { //if link is jumping
      jumpOrFall();
    }

    if (keyPressed && keyCode ==RIGHT) {  //moves link to the right
      loc.x+=15;
    } else if (keyPressed && keyCode ==LEFT) { //moves link backwards
      loc.x-=15;
    } else if (keyPressed && keyCode ==UP) { //makes link jump higher
      startJump();
    }
  }

  void reset() {    //reset link whenever link falls out of screen 
    loc.x = 80;
    loc.y = 630;   //reset location of the person back to the first rock
    vel.set(0, 10);
  }

  boolean isincontactwith(Rock rock) {
    if (loc.dist(rock.loc) < 70) { //if the distance between link and the rock is < 50
      endJump();   //link stops jumping
      return true; //return true
    } else {
      return false; //otherwise return false
    }
  }

  void health () { //health bar at top for link
    strokeWeight(8); //border for health bar
    fill(214, 214, 214);  //bg gray color
    rect(146, 96, 206, 16); //draw health bar border
    strokeWeight(0);  
    fill(c); //health bar starts out green initially
    rect(150, 100, w, 10); //health points
  }

  void decreasehp() {
    w -= 5; //decrease health
    if (w <= 100) { //if health is < 10
      c = color (255, 34, 0); //health bar tunrs red
      if (w <= 0) { //if there's no more health
        w = 0; //stop decreasing health
      }
    }
  }
}