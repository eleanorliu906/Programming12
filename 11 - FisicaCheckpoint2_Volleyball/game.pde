void game() {
  background(skyblue);
  handlePlayerInput();
  if (counter < 0) {
    showScores();
    runWorld();
  }
  countdown();
}

void reset() {
  println("r");
  leftPlayer.setPosition(0.25*width, 500);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setPosition(0.75*width, 500);
  rightPlayer.setVelocity(0, 0);
  ball.setVelocity(0, 0);
  if (lr) ball.setPosition(0.25*width, 220);
  else ball.setPosition(0.75*width, 220);

  if (rightScore >= 5 || leftScore >= 5) mode = GAMEOVER;
  counter = 180;
}

void showScores() {
  if (hitGround(leftGround)) {
    rightScore++;
    reset();
    lr = true;
  }
  if (hitGround(rightGround)) {
    leftScore++;
    reset();
    lr = false;
  }
  textSize(50);
  fill(#000000);
  text(rightScore, 0.75*width, 80);
  text(leftScore, 0.25*width, 80);
}

void countdown() {
  counter--;
  if (counter > 0) {
    fill(white, 128);
    noStroke();
    rect(0.5*width, 0.5*height, width, height);
    if (counter > 120) {
      textSize(90);
      fill(green);
      text("3", 0.5*width, 0.5*height);
    } else if (counter <= 120 && counter > 60) {
      textSize(90);
      fill(green);
      text("2", 0.5*width, 0.5*height);
    } else if (counter <= 60 && counter > 0) {
      textSize(90);
      fill(green);
      text("1", 0.5*width, 0.5*height);
    }
  }
}

void runWorld() {
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}
