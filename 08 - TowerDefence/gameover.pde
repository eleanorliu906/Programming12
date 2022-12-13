void gameover() {
  gameoverLayout();
  gameoverClicks();
}

void gameoverLayout() {
  background(lavender);
  fill(purple);
  textSize(30);
  text("Game Over", width/2, 35);
  text("Waves Survived: " + waveCount, width/2, 80);
  text("Click to Play Again", width/2, height*0.9);
  gameoverGif();
}
void gameoverGif() {
  gameoverGif.show();
  gameoverGif.act();
}

void gameoverClicks() {
  if (mouseReleased) {
    setup();
    mode = INTRO;
  }
}
