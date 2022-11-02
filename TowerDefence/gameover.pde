void gameover() {
  background(tactileYellow);
  gameoverGif();
  if (mouseReleased) mode = INTRO;
}

void gameoverGif() {
  gameoverGif.act();
  gameoverGif.show();
}
