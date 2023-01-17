import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #ff0000;
color blue = #00b7ef;
color orange = #f0a000;
// color brown = #9c5a3c;
color iceBlue = #00ffff;
color treeGreen = #00ff00;
color treeTrunkBrown = #b97a56;
color spikePurple = #aa00ff;
color bridgePink = #ff00ff;
color bridgeTopPink = #ffaec8;
color trampolineYellow = #FFFF00;

PImage map;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FPlayer player1, player2;
ArrayList<FGameObject> terrain;
boolean[] keys1 = new boolean[4];
boolean[] keys2 = new boolean[4];

PImage ice, stone, treetrunk, treeWithTrunk, treeLeft, treeRight, treeCenter, spike, bridge, bridgeright, bridgeleft, bridgetop, bridgetopleft, bridgetopright, trampoline;
PImage[] lava = new PImage[6];
int lavaIndex;
PImage heart;
PImage[] idle = new PImage[2];
PImage[] jump = new PImage[1];
PImage[] run = new PImage[3];

void setup() {
  size(600, 600);
  Fisica.init(this);
  terrain = new ArrayList <FGameObject>();
  initializeVariables();
  loadImages();
  loadWorld("map.png");
  loadPlayers();
}

void draw() {
  background(white);
  drawWorld();
  actWorld();
}

void actWorld() {
  player1.act();
  player2.act();

  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
}

void drawWorld() {
  pushMatrix();
  zoom = 0.6 + 10/dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
  translate(-0.5*(player1.getX()+player2.getX())*zoom + width/2, -0.5*((player1.getY()+player2.getY())*zoom) + height/2);
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
      color c = map.get(i, j);   // color of current pixil
      color s = map.get(i, j+1); // color below current pixil
      color n = map.get(i, j-1); // color above current pixil
      color e = map.get(i+1, j); // color on the right of current pixil
      color w = map.get(i-1, j); // color on the left of current pixil

      if (c == black) { // stone block
        createBlocks(i, j, "stone", stone, 4, 0.2, false);
      } else if (c == iceBlue) { // ice block
        createBlocks(i, j, "ice", ice, 0, 0.2, false);
      } else if (c == treeTrunkBrown) { // tree trunk
        createBlocks(i, j, "treetrunk", treetrunk, 4, 0.2, true);
      } else if (c == treeGreen) {
        if (s == treeTrunkBrown) {
          createBlocks(i, j, "tree", treeWithTrunk, 4, 0.2, false);
        } else if ( e == treeGreen && w == treeGreen) {
          createBlocks(i, j, "tree", treeCenter, 4, 0.2, false);
        } else if (w == white && e == treeGreen) {
          createBlocks(i, j, "tree", treeLeft, 4, 0.2, false);
        } else if (e == white && w == treeGreen) {
          createBlocks(i, j, "tree", treeRight, 4, 0.2, false);
        }
      } else if (c == spikePurple) {
        createBlocks(i, j, "spike", spike, 4, 0.2, false);
      } else if (c == bridgePink) {
        PImage bridgeImg;
        if (w == white && e == bridgePink) bridgeImg = bridgeleft;
        else if (e == white && w == bridgePink) bridgeImg = bridgeright;
        else bridgeImg = bridge;
        FBridge br = new FBridge(i*gridSize, j*gridSize, bridgeImg);
        terrain.add(br);
        world.add(br);
      } else if (c == red) {
        FLava l = new FLava(i*gridSize, j*gridSize, lavaIndex);
        lavaIndex ++;
        lavaIndex = lavaIndex % 6;
        // println("Initial: " + lavaIndex);
        terrain.add(l);
        world.add(l);
      } else if (c == trampolineYellow) {
        createBlocks(i, j, "trampoline", trampoline, 2, 2, false);
      } else if (c == bridgeTopPink) {
        PImage bridgetopImg;
        if (w == white && e == bridgeTopPink) bridgetopImg = bridgetopleft;
        else if (e == white && w == bridgeTopPink) bridgetopImg = bridgetopright;
        else bridgetopImg = bridgetop;
        FBridge br = new FBridge(i*gridSize, j*gridSize, bridgetopImg);
        terrain.add(br);
        world.add(br);
      }
    }
  }
}

void createBlocks(int x, int y, String n, PImage img, int friction, float res, boolean sensor) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(sensor);
  b.setFriction(friction);
  b.setRestitution(res);
  b.attachImage(img);
  b.setName(n);
  world.add(b);
}


void loadPlayers() {
  player1 = new FPlayer(red, keys1, 1);
  world.add(player1);

  player2 = new FPlayer(blue, keys2, 2);
  world.add(player2);
}

void initializeVariables() {
  upkey = downkey = leftkey = rightkey = wkey = akey = skey = dkey = qkey = ekey= spacekey = false;
  lavaIndex = 0;
}

void loadImages() {
  map = loadImage("map.png");
  ice = loadImage("ice.png");
  ice.resize(32, 32); // 32 by 32 pixel
  stone = loadImage("stone.png");
  treetrunk = loadImage("treetrunk.png");
  treeWithTrunk = loadImage("treeWithTrunk.png");
  treeCenter = loadImage("treeCenter.png");
  treeRight = loadImage("treeRight.png");
  treeLeft = loadImage("treeLeft.png");
  spike = loadImage("spike.png");
  bridgetop = loadImage("bridgetopcenter.png");
  bridgetopleft = loadImage("bridgetopleft.png");
  bridgetopright = loadImage("bridgetopright.png");
  bridge = loadImage("bridgecenter.png");
  bridgeleft = loadImage("bridgeleft.png");
  bridgeright = loadImage("bridgeright.png");
  lava[0] = loadImage("lava1.png");
  lava[1] = loadImage("lava2.png");
  lava[2] = loadImage("lava3.png");
  lava[3] = loadImage("lava4.png");
  lava[4] = loadImage("lava5.png");
  lava[5] = loadImage("lava6.png");
  trampoline = loadImage("trampoline.png");
  trampoline.resize(gridSize, gridSize);
  heart = loadImage("heart.png");
  heart.resize(gridSize/2, gridSize/2);

  idle[0] = loadImage("idle0.png");
  idle[1] = loadImage("idle1.png");
  jump[0] = loadImage("jump0.png"); // to be consistent with other arrays to use the action array
  run[0] = loadImage("runright0.png");
  run[1] = loadImage("runright1.png");
  run[2] = loadImage("runright2.png");
  // null pointer can point to another array
}
