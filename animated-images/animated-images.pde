int numPics = 12;
PImage[] nyan = new PImage[numPics];
int count = 0;

//naming convention: prefix, number, suffix

void setup() {
  size(400, 400);
  for (int i = 0; i < nyan.length; i++) {
    nyan[i] = loadImage("adventure" + nf(i, 2) + ".gif");
  }
}

void draw() {
  if (frameCount%5 == 0) {
    count++;
  }
  image(nyan[count%nyan.length], 0, 0);
}
