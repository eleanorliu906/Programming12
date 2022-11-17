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
  sidebar();
  playButton.show();
  playButton.act();

  addTower.show();
  addTower.act();

  if (showBuildPanel) buildPannel();
}

void buildClicks() {
  if (playButton.clicked) {
    mode = PLAY;
  }

  if (addTower.clicked) showBuildPanel = true;
}

void buildAnimateThings() {
  runTowers();
  runTexts();
}

void runTexts() {
  for (int i = 0; i < texts.size(); i++) {
    texts.get(i).act();
    texts.get(i).show();

    if (texts.get(i).counter <= 0) {
      texts.remove(i);
      i--;
    }
  }
}

void buildPannel() {
  noStroke();
  fill(lightblue);
  rect(0.9*width, 0.47*height, 100, 200);

  runTowerButtons();

  if (!building) {
    if (towerButtons.get(0).clicked) {
      if (money >= towerCost[0]) {
        towers.add(new TowerGun(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (towerButtons.get(1).clicked) {
      if (money >= towerCost[1]) {
        towers.add(new TowerAOE(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (towerButtons.get(2).clicked) {
      if (money >= towerCost[2]) {
        towers.add(new TowerSniper(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (towerButtons.get(3).clicked) {
      if (money >= towerCost[3]) {
        towers.add(new TowerSniper2(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    }
  }
}

void runTowerButtons() {
  for (int i = 0; i < towerButtons.size(); i++) {
    towerButtons.get(i).show();
    towerButtons.get(i).act();
  }
}

void showText(float x, float y, String t) {
  texts.add(new Text(x, y, t));
}
