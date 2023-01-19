void keyPressed() {
  if (key == 'a' || key == 'A') keys1[0] = true;
  if (key == 'd' || key == 'D') keys1[1] = true;
  if (key == 'w' || key == 'W') keys1[2] = true;
  if (key == 's' || key == 'S') keys1[3] = true;
  if (key == 'q' || key == 'Q') qkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == ' ') spacekey = true;
  if (keyCode ==  LEFT) keys2[0] = true;
  if (keyCode == RIGHT) keys2[1] = true;
  if (keyCode == UP) keys2[2] = true;
  if (keyCode ==  DOWN) keys2[3] = true;

  //  keys1 = new boolean[]{akey, dkey, wkey, skey};
  // keys2 = new boolean[]{leftkey, rightkey, upkey, downkey};
}


void keyReleased() {
  if (key == 'a' || key == 'A') keys1[0] = false;
  if (key == 'd' || key == 'D') keys1[1] = false;
  if (key == 'w' || key == 'W') keys1[2] = false;
  if (key == 's' || key == 'S') keys1[3] = false;
  if (key == 'q' || key == 'Q') qkey = false;
  if (key == 'e' || key == 'E') ekey = false;
  if (key == ' ') spacekey = false;
  if (keyCode ==  LEFT) keys2[0] =false;
  if (keyCode == RIGHT) keys2[1] = false;
  if (keyCode == UP) keys2[2] = false;
  if (keyCode ==  DOWN) keys2[3] = false;
}
