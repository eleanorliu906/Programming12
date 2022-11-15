void gameover() {
  background(tactileYellow);
  gameoverGif();
  if (mouseReleased) {
    setup();
    mode = INTRO;
  }
}

void gameoverGif() {
  gameoverGif.show();
  gameoverGif.act();
}
