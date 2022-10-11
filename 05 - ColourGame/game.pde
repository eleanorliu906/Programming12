void game() {
  background(lavender);

  gameText();
  createButtons();
  countdown();
  createColorWords();
  tactileGame();
}

void tactileGame(){
  if (dist(mouseX, mouseY, 200, 300) < 100){
    if (answer()) fill(trueGreenText, 120);
    else if (!answer()) fill(falsePinkText, 120);
    circle(mouseX, mouseY, 50);
  }
}

void gameText() {
  fill(lilac);
  textSize(30);
  text("Score: " + score, width*0.13, height*0.03);
}

void gameKey() {
  if (keyCode == 'T' || keyCode == 't') checkAnswers(true);
  if (keyCode == 'F' || keyCode == 'f')  checkAnswers(false);
}


boolean answer() {
  loadPixels();
  float r = red(pixels[mouseX + mouseY * width]);
  float g = green(pixels[mouseX + mouseY * width]);

  if (r > g) return false;
  else return true;
}

void gameClicks() {
  if ( dist(mouseX, mouseY, 200, 300 )<= 100) {
    println("Your Answer: " + answer() + " Answer: " + gameAns + " | " + currColor + " " + currColorText);
    checkAnswers(answer());
  }
}


void checkAnswers(boolean playerAns) {
  if (playerAns == gameAns) {
    newRound();
    success.rewind();
    success.play();
    score++;
  } else {
    mode = GAMEOVER;
    failure.rewind();
    failure.play();
    roundCount ++;
    numOfRounds.add(roundCount);
    scoresPerRound.add(score);

    println(scoresPerRound);
  }
}

void countdown() {
  noFill();
  stroke(goldenYellow);
  strokeWeight(3);
  rect(width/2, 0.96*height, 0.91*width, 18);

  fill(tactileYellow, 230);
  noStroke();
  rectMode(CORNER);
  rect(0.05*width, 568.5, countDownWidth, 15);
  rectMode(CENTER);

  countDownWidth -= countDownRate;

  if (countDownWidth <= 0) mode = GAMEOVER;
}

void trueFalseButton(int x, int y, float angle, String txt, color cbutton, color ctext) {

  pushMatrix();
  translate(x, y);
  rotate(angle);

  noStroke();
  fill(cbutton);
  arc(0, 0, 200, 200, 0, PI, PIE);

  fill(ctext);
  textSize(50);
  text(txt, 0, 40);

  popMatrix();
}

void createButtons() {
  trueFalseButton(200, 300, TButtonAngle, "F", falsePink, falsePinkText);
  trueFalseButton(200, 300, FButtonAngle, "T", trueGreen, trueGreenText);

  FButtonAngle += 0.01;
  TButtonAngle += 0.01;
}

void newRound() {
  countDownWidth = 0.9*width;
  countDownRate += 0.25;

  generateColors();
}

void createColorWords() {
  fill(currColor);
  text(currColorText, 200, 120);
}

void generateColors() {
  float randomFloat = random(0, 1);
  int index1 = (int) random(0, 7);
  int index2 = (int) random(0, 7);

  while (index1 == index2) {
    index2 = (int) random(0, 7);
  }

  if (randomFloat < 0.5) {
    currColor = colorOptions[index1];
    currColorText = colorWords[index1];
    gameAns = true;
  } else {
    currColor = colorOptions[index1];
    currColorText = colorWords[index2];
    gameAns = false;
  }
}
