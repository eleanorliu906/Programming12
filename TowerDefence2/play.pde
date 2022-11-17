void play() {
  showMap();
  sidebar();
  playAnimateThings();
  playButtons();
  playClicks();
  if (lives<=0) mode=GAMEOVER;
}

void showMap() {
  if (mapmode == MAP1) showMap1();
  else if (mapmode == MAP2) showMap2();
}

void showMap1() {
  background(lightgreen);

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
  //image(castle, 464, 420, 120, 80);
}

void showMap2() {
  background(lightgreen);

  strokeWeight(25);
  stroke(silver);
  line(50, 0, 50, 200);
  line(50, 200, 200, 50);
  line(200, 50, 425, 50);
  line(425, 50, 425, 150);
  line(425, 150, 250, 150);
  line(250, 150, 250, 425);
  line(250, 425, 100, 425);
  line(100, 425, 100, 300);
  line(100, 300, 350, 300);
  line(350, 300, 350, 425);
  line(350, 425, 504, 425);
}

void sidebar() {
  fill(skyblue);
  strokeWeight(0);
  rect(0.9*width, 0.5*height, 0.2*width, height);
  showNodes();
  moneyAndLivesStatus();
}

void moneyAndLivesStatus() {
  // money
  image(coin, 550, 80, 20, 20);
  fill(darkpurple);
  textSize(15);
  text(money, 575, 80);

  // lives
  image(heart, 550, 110, 20, 20);
  fill(darkpurple);
  textSize(15);
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
  for (int i = 0; i < currNodeList.size(); i++) currNodeList.get(i).show();
}

void playAnimateThings() {
  runMobs();
  runTowers();
  runBullets();
  runTexts();
  // runButtons();
}


void runMobs() {
  // println(mobs.size());

  for (int i = 0; i < mobs.size(); i++) {
    mobs.get(i).show();
    mobs.get(i).act();

    if (mobs.get(i).hp <= 0 ) {
      money += mobs.get(i).value;
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
    if (waveCount % 3 == 0)  mobs.add(new MobCrab(50, - 40*i));
    else if (waveCount % 3 == 1) mobs.add(new MobFish(50, - 40*i));
    else mobs.add(new MobWhale(50, -40*i));
  }
  waveCount++;
}

void playClicks() {
  if (mouseReleased && buildButton.clicked) mode = BUILD;
  else if (mouseReleased && nextWave.clicked && mobs.size() == 0)  addMobs();
}
