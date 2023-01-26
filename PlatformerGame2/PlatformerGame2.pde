import processing.sound.*;

import fisica.*;
FWorld world;

// COLOURS
color white = #FFFFFF;
color black = #000000;
color red = #ff0000;
color blue = #00b7ef;
color orange = #f0a000;
color iceBlue = #00ffff;
color treeGreen = #00ff00;
color treeTrunkBrown = #b97a56;
color spikePurple = #aa00ff;
color bridgePink = #ff00ff;
color bridgeTopPink = #ffaec8;
color trampolineOrange = #ff7f27;
color goombaYellow = #FFFF00;
color wallGray = #c3c3c3;
color nextLevelBlue = #00a8f3;
color thwompGold = #ffca18;
color hammerYellow = #fdeca6;
color heartRed = #88001b;
color purple = #b023e8;
color lavender = #ddbaff;

// MOUSE
boolean mouseReleased, wasPressed;

// MODE FRAMEWORK
int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;
boolean win;

// VARIABLES
PImage map;
ArrayList<PImage> levels = new ArrayList<>();
int currLevel, maxLevel;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FPlayer player1, player2;
ArrayList<FPlayer> players;
ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
boolean[] keys1 = new boolean[4];
boolean[] keys2 = new boolean[4];

// IMAGES
PImage heart;
PImage ice, stone, treetrunk, treeWithTrunk, treeLeft, treeRight, treeCenter, spike, bridge, bridgeright, bridgeleft, bridgetop, bridgetopleft, bridgetopright, trampoline, portal;
int lavaIndex;
PImage[] lava = new PImage[6];
PImage[] idle = new PImage[2];
PImage[] jump = new PImage[1];
PImage[] run = new PImage[3];
PImage thwompSleepy, thwompAngry, hammer;
PImage[] goomba = new PImage[2];
PImage[] hammerbro = new PImage[2];

// GIFS
Gif fireworks, gameoverGif;

void setup() {
  size(600, 600);
  Fisica.init(this);
  initializeVariables();
  initializeGifs();
  loadImages();
  setupWorld();
  loadPlayers();
}

void setupWorld() {
  terrain = new ArrayList <FGameObject>();
  enemies = new ArrayList<FGameObject>();
  loadWorld(levels.get(currLevel));
  if (currLevel > 0) addPlayers();
}

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  }
}

void loadWorld(PImage img) {

  map = img;

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
        makeBlock(i, j, "stone", stone);
        // println("s");
      } else if (c == iceBlue) { // ice block
        makeFancyBlock(i, j, "ice", ice, 0, 0.2, false);
      } else if (c == treeTrunkBrown) { // tree trunk
        makeFancyBlock(i, j, "treetrunk", treetrunk, 4, 0.2, true);
      } else if (c == treeGreen) {
        if (s == treeTrunkBrown) {
          makeBlock(i, j, "tree", treeWithTrunk);
        } else if ( e == treeGreen && w == treeGreen) {
          makeBlock(i, j, "tree", treeCenter);
        } else if (w == white && e == treeGreen) {
          makeBlock(i, j, "tree", treeLeft);
        } else if (e == white && w == treeGreen) {
          makeBlock(i, j, "tree", treeRight);
        }
      } else if (c == spikePurple) {
        if (n == black) makeBlock(i, j, "spike", rotateImage(rotateImage(spike)));
        else makeBlock(i, j, "spike", spike);
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
      } else if (c == trampolineOrange) {
        makeFancyBlock(i, j, "trampoline", trampoline, 2, 2, false);
      } else if (c == bridgeTopPink) {
        PImage bridgetopImg;
        if (w == white && e == bridgeTopPink) bridgetopImg = bridgetopleft;
        else if (e == white && w == bridgeTopPink) bridgetopImg = bridgetopright;
        else bridgetopImg = bridgetop;

        FBridge br = new FBridge(i*gridSize, j*gridSize, bridgetopImg);
        terrain.add(br);
        world.add(br);
      } else if ( c == goombaYellow) {
        FGoomba gmb = new FGoomba(i*gridSize, j*gridSize);
        enemies.add(gmb);
        world.add(gmb);
      } else if (c == wallGray) {
        makeBlock(i, j, "wall", stone);
        // println("wall");
      } else if (c == nextLevelBlue) {
        FPortal pt = new FPortal(i*gridSize, j*gridSize);
        world.add(pt);
        terrain.add(pt);
      } else if (c == thwompGold) {
        FThwomp t = new FThwomp(i*gridSize, j*gridSize);
        enemies.add(t);
        world.add(t);
        // println("add thwomp");
      } else if ( c == hammerYellow) {
        FHammerBro h = new FHammerBro(i*gridSize, j*gridSize, 180);
        enemies.add(h);
        world.add(h);
      } else if (c == heartRed) {
        FHeart h = new FHeart(i*gridSize, j*gridSize, 300);
        terrain.add(h);
        world.add(h);
      }
    }
  }
}

void makeFancyBlock(int x, int y, String n, PImage img, int friction, float res, boolean sensor) {
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

void makeBlock(int x, int y, String n, PImage img) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(false);
  b.setFriction(4);
  b.setRestitution(0.2);
  b.attachImage(img);
  b.setName(n);
  world.add(b);
}


void loadPlayers() {
  players = new ArrayList<FPlayer>();

  player1 = new FPlayer(red, keys1, 1);
  players.add(player1);
  world.add(player1);

  player2 = new FPlayer(blue, keys2, 2);
  players.add(player2);
  world.add(player2);
}

void addPlayers() {
  for (FPlayer p : players) {
    world.add(p);
  }
}

void initializeVariables() {
  mode = INTRO;

  upkey = downkey = leftkey = rightkey = wkey = akey = skey = dkey = qkey = ekey= spacekey = false;
  lavaIndex = 0;
  win = false;

  levels.add(loadImage("level0.png"));
  levels.add(loadImage("level1.png"));
  levels.add(loadImage("level2.png"));
  levels.add(loadImage("level3.png"));
  levels.add(loadImage("level4.png"));
  levels.add(loadImage("level5.png"));
  currLevel = 0;
  maxLevel = levels.size()-1;
}

void initializeGifs() {
  gameoverGif = new Gif(0.1*width, 0.2*height, 0.8*width, 0.6*height, "gameover/frame_", "_delay-0.1s", 19, 10);
  fireworks = new Gif(0.1*width, 0.2*height, 0.8*width, 0.55*height, "fireworks/frame_", "_delay-0.06s", 20, 6);
}

void loadImages() {
  //map = loadImage("level1.png");
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

  goomba[0] = loadImage("goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1] = loadImage("goomba1.png");
  goomba[1].resize(gridSize, gridSize);

  thwompSleepy = loadImage("thwompSleepy.png");
  thwompAngry = loadImage("thwompAngry.png");

  hammer = loadImage("hammer.png");
  hammerbro[0] = loadImage("hammerbro0.png");
  hammerbro[1] = loadImage("hammerbro1.png");

  portal = loadImage("portal.png");
}
