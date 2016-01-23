void beginningScreen() {
  background(0);
  fill(255); 
  textSize(50); 
  text("intro, to fill later", width/2, height/2);
}


void lightcatchingScreen () {
  background(lightscreen); 
  text("stuffhere", width/2, height/2);
}

void breakbreakingintroScreen() {
  background(brickintro); 
  text("explanation here", width/2, height/2);
}




void jumpgameScreen() {
  background(0); 
  image(fallinglink, 1000, height/3, 261, 247);  
  text("Oh no! You've fallen down a hole!!", width/2, height/2);
}