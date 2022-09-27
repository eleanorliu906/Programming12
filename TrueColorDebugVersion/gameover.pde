void gameover() {

  if (framecount > 0) {
    stroke(255, 255, 255, 200);
    fill(255, 255, 255, 200);
    rect(0, 0, width, height);
  }

  framecount--;
}

void gameoverClicks() {

  // mode = INTRO;
}
