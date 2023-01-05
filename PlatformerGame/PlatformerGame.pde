import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color green = #65eb50;
color red = #ff0000;
color blue = #00b7ef;
color orange = #f0a000;
color brown = #9c5a3c;

PImage map;
int gridSize = 20;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FPlayer player1, player2;
boolean[] keys1 = new boolean[4];
boolean[] keys2 = new boolean[4];

void setup() {
  size(600, 600);
  Fisica.init(this);

  loadWorld("map.png");
  loadPlayers();
  initializeVariables();
}

void draw() {
  background(white);
  drawWorld();
  player1.act();
  player2.act();
}

void drawWorld() {
  pushMatrix();
  zoom = 100/dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
  translate(-(player1.getX()+player2.getX())*zoom + width/2, -(player1.getY()+player2.getY())*zoom + height/2);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}

void loadWorld(String str) {

  map = loadImage(str);

  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int j = 0; j <= map.height; j++) {
    for (int i = 0; i <= map.width; i++) {
      color c = map.get(i, j);
      // print(c);
      if (c == brown) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(i*gridSize, j*gridSize);
        b.setStatic(true);
        b.setGrabbable(false);
        b.setFillColor(brown);
        world.add(b);
      }
    }
  }
}

void loadPlayers() {
  player1 = new FPlayer(red, keys1);
  world.add(player1);

  player2 = new FPlayer(blue, keys2);
  world.add(player2);
}

void initializeVariables() {
  upkey = downkey = leftkey = rightkey = wkey = akey = skey = dkey = qkey = ekey= spacekey = false;
  //keys1 = new boolean[]{akey, dkey, wkey, skey};
  //keys2 = new boolean[]{leftkey, rightkey, upkey, downkey};
}
