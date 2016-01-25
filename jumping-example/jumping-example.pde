Player p;
void setup() {
  size(2000, 1600);
  p = new Player();
}

void draw() {
  background(50);
  p.move();
  p.display();
}

class Player {
  PVector loc, vel, acc;
  int w, h;
  Boolean jumping;

  Player() {
    w = 100;
    h = 300;
    loc = new PVector(w, height - h);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    jumping = false;
  }
  void display() {
    rect(loc.x, loc.y, w, h);
  }

  void move() {
    vel.add(acc);
    loc.add(vel);
    if (jumping && loc.y > height - h) {
      endJump();
    }
    if (keyPressed && keyCode == RIGHT) {
      loc.x++;
    } else if (keyPressed && keyCode == LEFT) {
      loc.x--;
    } else if (keyPressed && keyCode == UP) {
      startJump();
    }
  }

  void startJump() {
    jumping = true;
    vel.y = -10;
    acc.y = .1;
  }

  void endJump() {
    loc.y = height -h;
    vel.y = 0;
    acc.y = 0;
    jumping = false;
  }
}
