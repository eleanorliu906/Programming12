void build() {
  showMap();
  buildLayout();
  buildClicks();
  buildAnimateThings();
}

void buildLayout() {
  fill(purple);
  textSize(50);
  text("Build Mode", width/2, 30);

  playButton.show();
  playButton.act();

  addTower.show();
  addTower.act();
}

void buildClicks() {
  if (playButton.clicked) {
    mode = PLAY;
  }

  else if (addTower.clicked) {
    println("addTower");
    towers.add(new Tower(mouseX, mouseY, 0, 30));
  }
}

void buildAnimateThings() {
  runTowers();
}
