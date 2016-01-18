class Keytosuccess {
  PImage keytosuccess;    //make key PImage which, when the cannonball touches it, gives the end screen
  PVector loc;    //make loc PVector

  Keytosuccess (float a, float b) {
    keytosuccess = loadImage("key to success.png");    //bring in key to success image
    loc = new PVector (a, b);    //(specified in the boid draw of the main code) give the key image this location
  }

  void display () {
    image(keytosuccess, loc.x, loc.y);    //make sure the key stays in this one place (previous attempts had the key moving around everywhere)
  }


}