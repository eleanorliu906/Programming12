void intro() {
  background(lavender);
  introGifs();
  introText();
  introMouse();
}

void introText() {
  textSize(60);
  fill(purple);
  text("Platformer Game", 0.15*width, 80);
}

void introMouse() {
  if (mouseReleased) {
    mode = GAME;
  }
}

void introGifs(){
  fireworks.act();
  fireworks.show();
}
