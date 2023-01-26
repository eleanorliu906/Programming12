void game() {
  background(black);
  drawWorld();
  actWorld();
  addHearts();
}

void drawWorld() {
  pushMatrix();
  zoom = 0.5 + 40/dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
  translate(-0.5*(player1.getX()+player2.getX())*zoom + width/2, -0.5*((player1.getY()+player2.getY())*zoom) + height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void addHearts() {
  if (frameCount % 500 == 0) {
    int x = (int) random(0, 32);
    int y = (int) random(0, 32);

    color c = map.get(x, y);

    if (c == white) {
      FHeart h = new FHeart(x*gridSize, y*gridSize, 300);
      terrain.add(h);
      world.add(h);
    }
  }
}

void actWorld() {
  for (int i = 0; i < players.size(); i++) {
    FGameObject p = players.get(i);
    p.act();
  }

  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }

  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}
