void gameover() {
  background(lavender);
  if ( rightScore > leftScore) text("Right Player Wins!", width/2, 120);
  else if (leftScore > rightScore)  text("Left Player Wins!", width/2, 120);
  else  text("Tie", width/2, 120);

  if (mouseReleased) {
    mode = GAME;
    rightScore = 0;
    leftScore = 0;
  }
}
