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
    counter = 210;
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

  runAddTowerButtons();

  if (!building) {
    if (selectTowerButtons.get(0).clicked) {
      if (coins >= towerCost[0]) {
        towers.add(new TowerGun(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (selectTowerButtons.get(1).clicked) {
      if (coins >= towerCost[1]) {
        towers.add(new TowerAOE(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (selectTowerButtons.get(2).clicked) {
      if (coins >= towerCost[2]) {
        towers.add(new TowerSniper(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    } else if (selectTowerButtons.get(3).clicked) {
      if (coins >= towerCost[3]) {
        towers.add(new TowerSniper2(mouseX, mouseY));
        building = true;
      } else showText(width/2, height/2, "Insufficient money");
    }
  }
}

void runAddTowerButtons() {
  for (int i = 0; i < selectTowerButtons.size(); i++) {
    selectTowerButtons.get(i).show();
    selectTowerButtons.get(i).act();
  }
}

void showText(float x, float y, String t) {
  texts.add(new Text(x, y, t));
}
