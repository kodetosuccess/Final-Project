void beginningScreen() {
  background(0);
  fill(255); 
  image(beglink, 125, 600); 
  textSize(30); 
  text("You have already made it this far on your journey to rescue Zelda.", width/2, height/2);
  text("Now, you face your biggest challenge yet.", width/2, 450);
  textSize(20);
  text("To get out of the maze you have to pass all the gems", width/2, 480); 
  textSize(15);
  text("Use the arrow keys to move around in the maze.", width/2, 500);
  text("Press SHIFT to Start", width/2, 520);
}

void lightcatchingScreen () {
  background(lightscreen); 
  fill(255); 
  textSize(30); 
  text("The maze is dark and you need light before to see before you can continue.", width/2, height/2);
  text("Move the mouse around to collect light in your lantern.", width/2, 450);
  textSize(15);
  text("Press SHIFT to Start", width/2, 500);
}

void breakbreakingintroScreen() {
  background(brickintro); 
  fill(255); 
  textSize(30);
  text("Whoops!! You've gotten lost and reached a dead end!!", width/2, height/2);
  textSize(20); 
  text("Move the mouse to bounce the cannonball off the cannon around to destroy the wall.", width/2, 450);
  textSize(15);
  text("Press SHIFT to start", width/2, 500);
}

void jumpgameScreen() {
  background(0); 
  image(fallinglink, 1000, 250, 261, 247);  
  fill(255); 
  textSize(30);
  text("Oh no! You've fallen down a hole into an underground river!!", width/2, height/2);
  text("Use the UP, RIGHT, & LEFT keys to jump across to the other side.", width/2, 450);
  textSize(20); 
  text("If you don't land properly on the rocks, you'll fall into the river.", width/2, 480);
  textSize(15); 
  text("Press SHIFT to start", width/2, 500);
}

void swordfightingScreen() {
  background(swordintro); 
  fill(255); 
  image(swordintrolink, 150, 550); 
  textSize(30); 
  text("You're almost out of the maze!! But!! A Shadow has appeared!!", width/2, height/2);
  textSize(20); 
  text("Use the arrow keys to move around to fight the Shadow", width/2, 450); 
  textSize(15); 
  text("Press SHIFT to start", width/2, 500);
}

void endScreen() {
  background(lostwoods); 

  fill(255);
  textSize(30);
  text("Congratulations, you have finally made it out of the maze.", width/2, 300); 
  text("Now let the music of the forest guide you on the rest of your journey...", width/2, 350);
}