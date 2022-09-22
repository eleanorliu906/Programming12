void intro() {
  background(lightblue);

  introGIF();
  introSetup();
  introButton();
}

void introClicks() {
  if (touchingButton(width/2, height*0.8, 120, 80)) {
    mode = GAME;
  }
}

void introSetup() {
  textSize(56);
  fill(brown);
  text("True Color", width*0.5, height*0.1);
}

void introGIF() {
  image(gif[(gifCount / 4) % numberOfFrames], width/2, 0.45*height);
  gifCount++;
}

void introButton() {
  fill(aqua);
  noStroke();
  rect(width/2, height*0.8, 120, 80);

  fill(brown);
  text("Play", width*0.5, height*0.78);

  if (touchingButton(width/2, height*0.8, 120, 80)) tactileButton(width/2, height*0.8, 120, 80, 150);
}
