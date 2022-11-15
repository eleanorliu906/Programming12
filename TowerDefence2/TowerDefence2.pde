//Tower Defense Game
// Eleanor Liu
//Programming 12

// ================ GLOBAL VARIABLES =================
final int INTRO = 0;
final int PLAY = 1;
final int BUILD = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;
int mode;

final int MAP1 = 5;
final int MAP2 = 6;
int mapmode;

// MUSIC
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, success, failure;

//COLORS
color tactileYellow = #ffe224;
color silver = #BFC0C0;
color dgreen = #0d3d07;
color powderblue = #6aaee6;
color steelblue = #A3B9C9;
color lightblue= #c2dbff;
color lightgreen = #b7ff87;
color lightgreen2 = #e2faca;
color skyblue = #b0ebf5;
color dblue = #334E58;
color blue = #2b8aba;
color purple = #b023e8;
color lilac = #c891ff;
color lavender = #ddbaff;
color darkpurple = #57246b;
color orange2 = #ff9a57;
color orange = #ffcf8c;
color red = #FF0000;
color brightpink = #f514db;
color pink = #f5abb8;
color pink2 = #facad3;
color lightpink = #ffa8db;
color hotpink = #f056d1;
color white = #ffffff;
color softred = #ff7a7a;

// FONT
PFont myFont;

//GIFS
ArrayList<Gif> introGif = new ArrayList<Gif>();
Gif currGif;
Gif gameoverGif;

// NODES
ArrayList<Node> map1NodeList = new ArrayList<Node>();
ArrayList<Node> map2NodeList = new ArrayList<Node>();
ArrayList<Node> currNodeList = new ArrayList<Node>();

// MOUSE
boolean mouseReleased, wasPressed;

//BUTTONS
ArrayList<Gif> gifs = new ArrayList<Gif>();
Button introButton, nextWave, buildButton, playButton, addTower;
Button gunTowerButton, AoETowerButton, sniperTowerButton, sniperTower2Button;
Button map1button, map2button;

// OBJECTS
ArrayList<Mob> mobs = new ArrayList<Mob>();
ArrayList<Tower> towers = new ArrayList<Tower>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Text> texts = new ArrayList<Text>();
ArrayList<Button> buttons = new ArrayList<Button>();

PImage lovebird, parrot, eagle;
PImage crab, fish, whale;
PImage castle;
PImage firecracker;

// COUNTERS
int money;
PImage coin;
int lives;
PImage heart;
int waveCount;

boolean buildingTowers;

void setup() {
  size(630, 480);

  //INITIALIZE
  initializeModes();
  initializeVariables();
  initializeGifs();
  initializeButtons();
  makeNodes();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}


void initializeGifs() {
  introGif.add(new Gif("tower/frame_", "_delay-0.1s", 100, 9));
  gameoverGif = new Gif("gameover/frame_", "_delay-0.1s", 19, 10);
}

void initializeButtons() {
  //String t, int _x, int _y, int _w, int _h, color c1, color c2
  introButton  = new Button("Start!", width/2, 440, 100, 60, steelblue, dblue);
  nextWave  = new Button(loadImage("play.png"), 567, 40, 90, 40, 30, 30, powderblue, powderblue);
  buildButton = new Button(loadImage("build.png"), 600, 450, 40, 40, 30, 30, powderblue, powderblue, 5);
  playButton = new Button(loadImage("play.png"), 600, 450, 40, 40, 30, 30, powderblue, powderblue, 5);
  addTower = new Button("+ Tower", 567, 40, 90, 40, powderblue, dblue);

  AoETowerButton = new Button("AoE", 0.9*width, 0.52*height, 40, 40, pink, #000000, 0);
  sniperTowerButton = new Button("Sniper", 0.9*width, 0.42*height, 40, 40, lilac, #000000, 0);
  sniperTower2Button = new Button("Sniper 2", 0.9*width, 0.62*height, 40, 40, orange2, #000000, 0);
  gunTowerButton = new Button("Gun", 0.9*width, 0.32*height, 40, 40, powderblue, #000000, 0);

  map1button = new Button(loadImage("lvl1.png"), 157.5, 240, 255, 243, 230, 219, lilac, lilac);
  map2button = new Button(loadImage("lvl2.png"), 472.5, 240, 255, 243, 230, 219, lilac, lilac);
  //PImage _img, float _x, float _y, float _w, float _h, float iw, float ih, color c1, color c2, float r
}

void initializeVariables() {
  // FONTS
  myFont = createFont("Milky Coffee.ttf", 28);
  textFont(myFont);
  buildingTowers = false;

  // IMAGES AND GIFS
  parrot = loadImage("parrot.jpg");
  lovebird = loadImage("lovebird.png");
  castle = loadImage("castle.jpeg");
  crab = loadImage("crab.png");
  coin = loadImage("coin.png");
  heart = loadImage("lives.png");
  firecracker = loadImage("firecracker.png");
  eagle = loadImage("eagle.png");
  whale = loadImage("whale.png");
  fish = loadImage("fish.png");

  // COUNTERS
  waveCount = 1;
  lives = 3;
  money = 30;

  // CREATE OBJECTS
  // towers.add(new Tower(300, 170, 0, 60, parrot)); // (TestTower)
}

void makeNodes() {
  //Plot the nodes on the map
  map1NodeList.add(new Node(50, 150, 1, 0));
  map1NodeList.add(new Node(250, 150, 0, 1));
  map1NodeList.add(new Node(250, 250, -1, 0));
  map1NodeList.add(new Node(150, 250, 0, -1));
  map1NodeList.add(new Node(150, 75, 1, 0));
  map1NodeList.add(new Node(350, 75, 0, 1));
  map1NodeList.add(new Node(350, 325, -1, 0));
  map1NodeList.add(new Node(100, 325, 0, 1));
  map1NodeList.add(new Node(100, 425, 1, 0));
  map1NodeList.add(new Node(504, 425, 1, 0));

  map2NodeList.add(new Node(50, 200, 0.707, -0.707));
  map2NodeList.add(new Node(200, 50, 1, 0));
  map2NodeList.add(new Node(425, 50, 0, 1));
  map2NodeList.add(new Node(425, 150, -1, 0));
  map2NodeList.add(new Node(250, 150, 0, 1));
  map2NodeList.add(new Node(250, 425, -1, 0));
  map2NodeList.add(new Node(100, 425, 0, -1));
  map2NodeList.add(new Node(100, 300, 1, 0));
  map2NodeList.add(new Node(350, 300, 0, 1));
  map2NodeList.add(new Node(350, 425, 1, 0));
  map2NodeList.add(new Node(504, 425, 1, 0));
}

// ===================== DRAW ===========================
void draw() {
  if (mode == INTRO) intro();
  else if (mode == PLAY) play();
  else if (mode == BUILD) build();
  else if (mode == GAMEOVER) gameover();
  else if (mode == OPTIONS) options();
  showCoordinates();
  click();
}

void showCoordinates() {
  String t = mouseX + ", " + mouseY;
  fill(0);
  textSize(15);
  text(t, mouseX, mouseY);
}
