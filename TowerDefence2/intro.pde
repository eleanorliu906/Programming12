void intro() {
  background(silver);
  introGifs();
  introText();

  introButton.show();
  introButton.act();
  
  introMouse();
}

void introText() {
  textSize(60);
  fill(steelblue);
  text("Tower Defence", width/2, 30);
}

void introMouse() {
  if (introButton.clicked) {
    mode = PLAY;
    // println("x");
  }
}

void introGifs() {
  for (int i = 0; i < introGif.size(); i++) {
    introGif.get(i).act();
    introGif.get(i).show();
  }
}
