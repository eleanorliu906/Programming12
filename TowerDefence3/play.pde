void play() {

  showMap();
  sidebar();

  if (counter > 0) counter();
  else {
    playAnimateThings();
    playButtons();
    playClicks();
    generatePowerUps();
  }

  if (lives<=0) mode=GAMEOVER;
  counter--;
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
  text(coins, 575, 80);

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
}


void runMobs() {
  // println(mobs.size());

  for (int i = 0; i < mobs.size(); i++) {
    mobs.get(i).show();
    mobs.get(i).act();

    if (mobs.get(i).hp <= 0 ) {
      coins += mobs.get(i).value;
      mobs.remove(i);
      i--;
    }
  }
}

void runTowers() {
  for (int i = 0; i < towers.size(); i++) {
    towers.get(i).show();
    if (towers.get(i).hp <= 0) {
      towers.remove(i);
      i--;
    }
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

void addMobs() {
  for (int i = 0; i < waveCount; i++) {
    if (waveCount % 3 == 0)  mobs.add(new MobCrab(50, - 40*i));
    else if (waveCount % 3 == 1) mobs.add(new MobFish(50, - 40*i));
    else mobs.add(new MobWhale(50, -40*i));
  }
  float r = random(1);
  if (r < 0.6) {
    mobs.add(new MobGhost(50, -40*waveCount));
    texts.add(new Text(50, 20, "Beware of Ghost Mob!", 15*waveCount));
  }
  waveCount++;
}

void playClicks() {
  if (mouseReleased && buildButton.clicked) { 
    mode = BUILD;
    building = false;
  } else if (mouseReleased && nextWave.clicked && mobs.size() == 0)  addMobs();
}

void generatePowerUps() {
  for (int i = 0; i < powerups.size(); i++) {
    powerups.get(i).act();
    powerups.get(i).show();
    if (powerups.get(i).hp <= 0) {
      powerups.remove(i);
      i--;
    }
  }
  if (frameCount % 360 == 0) {
    float i = random(1);
    if (i < 0.25) {
      powerups.add(new PowerUpHeart());
    } else if (i < 0.5) {
      powerups.add(new PowerUpCoin());
    }
  }
}

void counter() {

  if (counter > 0) {
    strokeWeight(0);
    fill(255, 255, 255, 100);
    rect(width/2, height/2, width, height);
  }

  if (counter > 150  ) {
    fill(hotpink);
    textSize(80);
    text("3", width/2, height/2);
  }
  if (counter > 90 && counter <= 150) {
    fill(darkorange);
    textSize(80);
    text("2", width/2, height/2);
  }
  if (counter > 30 && counter <= 90) {
    fill(orangeyellow);
    textSize(80);
    text("1", width/2, height/2);
  }
  if (counter > 0 && counter <= 30) {
    fill(readygreen);
    textSize(100);
    text("GO!", width/2, height/2);
  }
}
