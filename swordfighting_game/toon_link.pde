class Link { //declare new class for toon link
PVector loc;
PImage l; 

Link () {
  imageMode(Center); 
  l = loadImage(""); 
  loc = new PVector (random,
}
  
  void display (){ //display function
  image(l, loc.x, loc.y); //draw image
  }
  
}