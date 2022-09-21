void game() {
  background(lavender);

  gameText();
  createButtons();
  countdown();

  createText();
}

boolean answer() {
  if (get(mouseX, mouseY) == falsePink) return false;
  else return true;
}

void gameClicks(){

}

void gameText() {
  fill(lilac);
  textSize(30);
  text("Score: " + score, width*0.13, height*0.03);
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

void createText() {
  
  generateColors();
  
  fill(currColor);
  text(currColorText, 200, 120);
}

void generateColors() {
  float randomFloat = random(0, 1);

  if (randomFloat < 0.5) {
    int index = (int) random(0, 7);
    matches = true;
    currColor = colorOptions[index];
    currColorText = colorWords[index];
  } else {
    int index1 = (int) random(0, 7);
    int index2 = (int) random(0, 7);
    matches = false;
    currColor = colorOptions[index1];
    currColorText = colorWords[index2];
  }
}
