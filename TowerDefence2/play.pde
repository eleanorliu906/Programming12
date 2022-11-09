void play() {
  showMap();
  playAnimateThings();
  playButtons();
  playClicks();
  if (lives<=0) mode=GAMEOVER;
}

void showMap() {
  background(grassgreen);

  strokeWeight(25);
  stroke(silver);
  line(50, 0, 50, 150);
  line(50, 150, 250, 150);
  line(250, 150, 250, 250);
  line(250, 250, 150, 250);
  line(150, 250, 150, 75);
  line(150, 75, 350, 75);
  line(350, 75, 350, 325);
  line(350, 325, 100, 325);
  line(100, 325, 100, 425);
  line(100, 425, 504, 425);

  fill(skyblue);
  strokeWeight(0);
  rect(0.9*width, 0.5*height, 0.2*width, height);

  image(castle, 464, 420, 120, 80);

  showNodes();
  moneyAndLivesStatus();
}

void moneyAndLivesStatus() {
  // money
  image(coin, 550, 80, 20, 20);
  fill(darkpurple);
  text(money, 575, 80);

  // lives
  image(heart, 550, 110, 20, 20);
  fill(darkpurple);
  text(lives, 570, 110);
}


void playButtons() {
  nextWave.show();
  nextWave.act();

  fill(darkpurple);
  text("Next Wave: " + waveCount, 0.9*width, 10);

  buildButton.show();
  buildButton.act();
}

void showNodes() {
  for (int i = 0; i < nodeList.size(); i++) nodeList.get(i).show();
}

void playAnimateThings() {
  runMobs();
  runTowers();
  runBullets();
  // runButtons();
}


void runMobs() {
  // println(mobs.size());

  for (int i = 0; i < mobs.size(); i++) {
    mobs.get(i).show();
    mobs.get(i).act();

    if (mobs.get(i).hp <= 0 ) {
      mobs.remove(i);
      i--;
    }
  }
}

void runTowers() {
  for (int i = 0; i < towers.size(); i++) {
        towers.get(i).show();
    if (mode == PLAY) {
      towers.get(i).act();
    }
  }
}

void runBullets() {
  // println(bullets.size());
  for (int i = 0; i < bullets.size(); i++) {
    bullets.get(i).act();
    bullets.get(i).show();

    if (bullets.get(i).hp <= 0) {
      bullets.remove(i);
      i--;
    }
  }
}

void runButtons() {
  for (int i = 0; i < buttons.size(); i++) {
    buttons.get(i).show();
    buttons.get(i).act();

    if ( buttons.get(i).hp <= 0) {
      buttons.remove(i);
      i--;
    }
  }
}
void addMobs() {
  for (int i = 0; i < waveCount; i++) {
    // Mob(float myX, float myY, float myVX, float myVY, color myC, PImage myImg)
    mobs.add(new Mob(50, - 40*i, 0, 1, lightpink, crab));
  }
  waveCount++;
}

void playClicks() {
  if (mouseReleased && buildButton.clicked) mode = BUILD;
  else if (mouseReleased && nextWave.clicked && mobs.size() == 0)  addMobs();
}
