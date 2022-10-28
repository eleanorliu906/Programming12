void play() {
  playLayout();
  showNodes();
  animateThings();
  runMobs();
}

void playLayout() {
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

  nextWave.show();
  nextWave.act();
}

void showNodes() {
  for (int i = 0; i < nodeList.size(); i++) nodeList.get(i).show();
}

void animateThings() {
  mobby.act();
  mobby.show();
}

void runMobs() {
  if (mouseReleased && nextWave.clicked) {
    mobList.add(new Mob(50, 0, 0, 1, 20, 20, hotpink, 2));
  }

  for (int i = 0; i < mobList.size(); i++) {
    mobList.get(i).show();
    mobList.get(i).act();
  }
}
