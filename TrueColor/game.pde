void game() {
  background(lavender);

  gameText();
  createButtons();
  countdown();
  createColorWords();
}

void gameText() {
  fill(lilac);
  textSize(30);
  text("Score: " + score, width*0.13, height*0.03);
}

boolean answer() {
  if (get(mouseX, mouseY) == falsePink) return false;
  else return true;
}

void gameClicks() {
  if (answer() == matches) {
    // println("Correct, " + "Answer: " + matches + " Your Answer: " + ans);
    newRound();
    success.play();
    success.rewind();
    score++;
  } else { 
    mode = GAMEOVER;
    failure.play();
    // println("Wrong, " + "Answer: " + matches + "Your Answer: " + ans + " " + currColor + " " + currColorText);
    roundCount ++;
    numOfRounds.add(roundCount);
    scoresPerRound.add(score);
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
    matches = true;
  } else {
    currColor = colorOptions[index1];
    currColorText = colorWords[index2];
    matches = false;
  }

  println(matches + " " + currColor + " " + currColorText);
}
