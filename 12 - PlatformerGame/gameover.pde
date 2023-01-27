void gameover() {
  gameoverLayout();
  gameoverClicks();
}

void gameoverLayout() {
  background(lavender);
  fill(purple);
  textSize(30);
  text("Game Over", 0.4*width, 50);
  if (win) text("You Win!", 0.41* width, 100);
  else text("You Lose", 0.41*width, 100);
  text("Click to Play Again", 0.3* width, height*0.9);
  gameoverGif();
}

void gameoverGif() {
  gameoverGif.show();
  gameoverGif.act();
}

void gameoverClicks() {
  if (mouseReleased) {
    println("x");
    setup();
  }
}
