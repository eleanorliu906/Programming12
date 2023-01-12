import fisica.*;
FWorld world;

color white = #FFFFFF;
color black = #000000;
color red = #ff0000;
color blue = #00b7ef;
color orange = #f0a000;
color brown = #9c5a3c;
color iceBlue = #00ffff;
color treeGreen = #00ff00;
color treeTrunkBrown = #9c5a3c;
color spikePurple = #aa00ff;
color bridgePink = #ff00ff;

PImage map;
int gridSize = 32;
float zoom = 1.5;
boolean upkey, downkey, leftkey, rightkey, wkey, akey, skey, dkey, qkey, ekey, spacekey;
FPlayer player1, player2;
ArrayList<FGameObject> terrain;
boolean[] keys1 = new boolean[4];
boolean[] keys2 = new boolean[4];

PImage ice, stone, treetrunk, middletree, lefttree, righttree, normaltree, spike, bridge;

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
  zoom = 1 + 9/dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
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
        createBlocks(i, j, "stone", stone, 4, false);
      } else if (c == iceBlue) { // ice block
        createBlocks(i, j, "ice", ice, 0, false);
      } else if (c == treeTrunkBrown) { // tree trunk
        createBlocks(i, j, "treetrunk", treetrunk, 4, true);
      } else if (c == treeGreen) {
        if ( s == brown) {
          createBlocks(i, j, "tree", middletree, 4, false);
        } else if ( e == treeGreen && w == treeGreen) {
          createBlocks(i, j, "tree", normaltree, 4, false);
        } else if (w == white && e == treeGreen) {
          createBlocks(i, j, "tree", lefttree, 4, false);
        } else if (e == white && w == treeGreen) {
          createBlocks(i, j, "tree", righttree, 4, false);
        }
      } else if (c == spikePurple) {
        createBlocks(i, j, "spike", spike, 4, false);
      } else if (c == bridgePink) {
        FBridge br = new FBridge(i*gridSize, j*gridSize);
        terrain.add(br);
        world.add(br);
      }
    }
  }
}

void createBlocks(int x, int y, String n, PImage img, int friction, boolean sensor) {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x*gridSize, y*gridSize);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(sensor);
  b.setFriction(friction);
  b.attachImage(img);
  b.setName(n);
  world.add(b);
}


void loadPlayers() {
  player1 = new FPlayer(red, keys1);
  world.add(player1);

  player2 = new FPlayer(blue, keys2);
  world.add(player2);
}

void initializeVariables() {
  upkey = downkey = leftkey = rightkey = wkey = akey = skey = dkey = qkey = ekey= spacekey = false;
}

void loadImages() {
  map = loadImage("map.png");
  ice = loadImage("ice.png");
  ice.resize(32, 32); // 32 by 32 pixel
  stone = loadImage("stone.png");
  treetrunk = loadImage("treetrunk.png");
  middletree = loadImage("middletree.png");
  normaltree = loadImage("normaltree.png");
  righttree = loadImage("righttree.png");
  lefttree = loadImage("lefttree.png");
  spike = loadImage("spike.png");
  bridge = loadImage("bridgecenter.png");
}
