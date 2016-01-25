class JLink {
  PVector loc, vel, g;
  PImage jlink;
  boolean isJump = false;
  color c; //color for health bar
  int w; //for health bar

  JLink() {
    imageMode(CENTER); 
    jlink = loadImage("link jump game.png"); 
    c = color (59, 237, 0);
    loc = new PVector (80, 550);
    vel = new PVector(0, 0); //changed velocity so link starts to jump higher
    g = new PVector (0, 0); //gravity
    w = 200; //link stars out with 200 health
  }

  void display() {
    image(jlink, loc.x, loc.y);
  }

  void jump() {
    loc.add(vel);
    vel.add(g); //add gravity
  }
  void returntoscreen() {
    loc = new PVector (80, 550); //will return link to first rock
  }


  boolean isincontactwith(Rock rock) {
    if (loc.x > rock.loc.x - 40 && loc.x < rock.loc.x + 40 && loc.y < rock.loc.y - 50 && loc.y > rock.loc.y - 100) { //if the distance between link and the rock is < 50
      println(rock.loc.y);
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