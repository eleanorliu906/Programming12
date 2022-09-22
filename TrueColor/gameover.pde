void gameover() {
  background(lightred);

  calculateHighScore();
  displayGameoverText();
  tryAgainButton();
}

void gameoverClicks() {
  if (touchingButton(width/2, height*0.82, 170, 60)) {
    mode = INTRO;
    score = 0;
    countDownWidth = 0.9*width;
    countDownRate = 0.5;
  }
}

void displayGameoverText() {
  fill(red);
  textSize(50);
  text("Game Over", width/2, height*0.1);
  textSize(40);
  text("Score: " + score, width/2, height*0.26);
  text("High Score: " + highScore, width/2, height*0.32);
}

void calculateHighScore() {
  if (score > highScore) highScore = score;
}

void tryAgainButton() {
  fill(lilac);
  noStroke();
  rect(width/2, height*0.82, 170, 60);
  fill(red);
  text("Try Again", width/2, height*0.8);

  if (touchingButton(width/2, height*0.82, 170, 60)) tactileButton(width/2, height*0.82, 170, 60, 150);
}
