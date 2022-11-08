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

  if (buildingTowers) buildPannel();
}

void buildClicks() {
  if (playButton.clicked) {
    mode = PLAY;
  }

  if (addTower.clicked) buildingTowers = true;
}

void buildAnimateThings() {
  runTowers();
  runTexts();
}

void runTexts() {
  for (int i = 0; i < texts.size(); i++) {
    texts.get(i).act();
    texts.get(i).show();

    if (texts.get(i).counter <= 0) texts.remove(i);
  }
}

void buildPannel() {
  noStroke();
  fill(lightblue);
  rect(0.9*width, 0.43*height, 100, 160);

  basicTowerButton.show();
  basicTowerButton.act();
  circleTowerButton.show();
  circleTowerButton.act();
  sniperTowerButton.show();
  sniperTowerButton.act();

  if (basicTowerButton.clicked) {
    if (money >= 10) towers.add(new TowerBasic(mouseX, mouseY, 0, 30));
    else if (money <= 10) texts.add(new Text(width/2, height/2, "Not enough money"));
  } else if (circleTowerButton.clicked) {
    if (money >= 10) towers.add(new TowerCircle(mouseX, mouseY, 0, 180));
    else if (money <= 10) texts.add(new Text(width/2, height/2, "Not enough money"));
  } else if (sniperTowerButton.clicked) {
    if (money >= 10) towers.add(new TowerSniper(mouseX, mouseY, 0, 180));
    else if (money <= 10) texts.add(new Text(width/2, height/2, "Not enough money"));
  }
}
