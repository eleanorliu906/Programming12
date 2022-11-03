void gameover() {
  background(tactileYellow);
  gameoverGif();
  if (mouseReleased) mode = INTRO;
}

void gameoverGif() {
  gameoverGif.show();
  gameoverGif.act();
}
