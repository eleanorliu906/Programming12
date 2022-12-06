void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (keyCode == UP) upkey = true;
  if (keyCode ==  DOWN) downkey = true;
  if (keyCode ==  LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode ==  DOWN) downkey = false;
  if (keyCode ==  LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
}

void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if (dkey) leftPlayer.setVelocity(100, left_vy);
  if (akey) leftPlayer.setVelocity(-100, left_vy);
  if (wkey && touchGround(leftPlayer, leftGround)) leftPlayer.setVelocity(left_vx, -500);
  if (skey) leftPlayer.setVelocity(left_vx, 100);

  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();
  if (rightkey) rightPlayer.setVelocity(100, right_vy);
  if (leftkey) rightPlayer.setVelocity(-100, right_vy);
  if (upkey && touchGround(rightPlayer, rightGround)) rightPlayer.setVelocity(right_vx, -500);
  if (downkey) rightPlayer.setVelocity(right_vx, 100);
  
  //if (!touchGround(rightPlayer, rightGround))
}
