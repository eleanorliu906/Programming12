void gameover() {
  background(lightred);

  calculateHighScore();
  displayGameoverText();
  tryAgainButton();
  
  if (numOfRounds.size() <= 1) gameoverGif();
  else showGraph();
}

void gameoverClicks() {
  if (touchingButton(width/2, height*0.82, 170, 60)) {
    mode = INTRO;
    score = 0;
    countDownWidth = 0.9*width;
    countDownRate = 0.5;
    newRound();
  }
}

void displayGameoverText() {
  fill(red);
  textSize(50);
  text("Game Over", width/2, height*0.1);
  textSize(40);
  text("Score: " + score, width/2, height*0.20);
  text("High Score: " + highScore, width/2, height*0.26);
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

void showGraph() {
  stroke(0);
  strokeWeight(3);
  line(50, 250, 50, 450);
  line(25, 425, 375, 425);

  pushMatrix();
  translate(40, 350);
  rotate(3*PI/2);
  fill(0);
  textSize(18);
  text("Score", 0, 0);
  popMatrix();
  fill(0);
  text("Rounds", width/2, 430);

  highScore = max(scoresPerRound);

  int l = scoresPerRound.size();

  for (int i = 0; i < l; i++) {
    if (i > 0) {
      pastCircleX = circleX;
      pastCircleY = circleY;
    }

    circleX = map( (i+1), 1, l, 75, 350);
    circleY = map( scoresPerRound.get(i), -0.01, highScore, 400, 275);

    fill(0);
    circle(circleX, circleY, 5);

    if (i > 0) line(circleX, circleY, pastCircleX, pastCircleY);
  }
}

void gameoverGif(){
  image(gameoverGif[gameoverGifCount / 6], width/2, 320, 94*3, 55*3);
  if (gameoverGifCount == gameoverFrameNum*6-1) gameoverGifCount = 0;
  else gameoverGifCount ++;
}
