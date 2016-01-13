class Brick {
   
   Brick(float a, float b) {
    loc = new PVector(a, b);
  }
  
  
  boolean Disappears(PVector z) {
    if (loc.dist(z) < ) {
      return true;
    } else {
      return false;
    }
  }
  
  void display () {
    rect(0, 0, 120, 100);
  }