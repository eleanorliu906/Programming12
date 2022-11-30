//Tower Defense Game
// Eleanor Liu
//Programming 12

// NEW FEATURES
// social distancing for towers - you can not place towers together
// text messages - to show you what happened
// countdown screen - more thrilling
// powerups - 2 classes (heart and coins); tactile; disappear if you don't click on them
// upgrade towers - towers have max level you can upgrade; towers become more powerful
// sell towers - still you will not earn what you originally put in
// ghost mobs - randomly appear, you can not always see them
// music - imported a new library
// tower that shoots it's closest mob (TowerSniper2)
// moving tower - drops bombs, the bombs cast an AoE ring when clicked and disappear when it isn't clicked, the bombs won't disappear for longer if the tower is a higher level.
// mobs get more hp once the wavecount increases


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
import processing.sound.*;
SoundFile file;

//COLORS
color silver = #BFC0C0;
color lightgreen = #b7ff87;
color lightgreen2 = #e2faca;
color dgreen = #0d3d07;
color dblue = #334E58;
color lightblue= #c2dbff;
color powderblue = #6aaee6;
color steelblue = #A3B9C9;
color skyblue = #b0ebf5;
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
color readygreen = #2bd95a;
color hotpink2 = #ff0084;
color darkorange = #ff6a00;
color orange3 = #FF7F11;
color orangeyellow = #ffbb00;
color tactileYellow = #ffe224;
color yellow1 = #ffe53b;
color yellow2 = #ffe959;

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
ArrayList<Button> selectTowerButtons = new ArrayList<Button>();

Button introButton, nextWave, buildButton, playButton, addTower;
Button gunTowerButton, AoETowerButton, sniperTowerButton, sniperTower2Button, moverTowerButton;
Button map1button, map2button;

// OBJECTS
ArrayList<Mob> mobs = new ArrayList<Mob>();
ArrayList<Tower> towers = new ArrayList<Tower>();
int[] towerCost = {5, 10, 15, 15, 20};
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<Text> texts = new ArrayList<Text>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();

//IMAGES
PImage crab, fish, whale, ghost;
PImage firecracker, bomb;
PImage upgrade, sell;

// COUNTERS
int coins;
PImage coin;
int lives;
PImage heart;
int waveCount;
int counter;

boolean showBuildPanel, building;

void setup() {
  size(630, 480);

  //INITIALIZE
  initializeModes();
  initializeVariables();
  initializeGifs();
  initializeButtons();
  initializeMusic();
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
  gameoverGif = new Gif(0.6*width, 0.6*height, "gameover/frame_", "_delay-0.1s", 19, 10);
}

void initializeButtons() {
  //String t, int _x, int _y, int _w, int _h, color c1, color c2
  introButton  = new Button("Start!", width/2, 440, 100, 60, steelblue, dblue);
  nextWave  = new Button(loadImage("play.png"), 567, 40, 90, 40, 30, 30, powderblue, powderblue);
  buildButton = new Button(loadImage("build.png"), 600, 450, 40, 40, 30, 30, powderblue, powderblue, 5);
  playButton = new Button(loadImage("play.png"), 600, 450, 40, 40, 30, 30, powderblue, powderblue, 5);
  addTower = new Button("+ Tower", 567, 40, 90, 40, powderblue, dblue);


  gunTowerButton = new Button("Gun", 0.9*width, 0.37*height, 40, 40, powderblue, #000000, 0);
  AoETowerButton = new Button("AoE", 0.9*width, 0.47*height, 40, 40, lilac, #000000, 0);
  sniperTowerButton = new Button("Sniper", 0.9*width, 0.57*height, 40, 40, pink, #000000, 0);
  sniperTower2Button = new Button("Sniper 2", 0.9*width, 0.67*height, 40, 40, orange2, #000000, 0);
  moverTowerButton = new Button("Mover", 0.9*width, 0.77*height, 40, 40, yellow2, #000000, 0);
  
  selectTowerButtons.add(gunTowerButton);
  selectTowerButtons.add(AoETowerButton);
  selectTowerButtons.add(sniperTowerButton);
  selectTowerButtons.add(sniperTower2Button);
  selectTowerButtons.add(moverTowerButton);

  map1button = new Button(loadImage("lvl1.png"), 157.5, 240, 255, 243, 230, 219, lilac, lilac);
  map2button = new Button(loadImage("lvl2.png"), 472.5, 240, 255, 243, 230, 219, lilac, lilac);
  //PImage _img, float _x, float _y, float _w, float _h, float iw, float ih, color c1, color c2, float r
}

void initializeVariables() {
  // FONTS
  myFont = createFont("Milky Coffee.ttf", 28);
  textFont(myFont);
  showBuildPanel = false;

  // IMAGES 
  coin = loadImage("coin.png");
  heart = loadImage("lives.png");
  firecracker = loadImage("firecracker.png");
  bomb = loadImage("bomb.png");
  crab = loadImage("crab.png");
  whale = loadImage("whale.png");
  fish = loadImage("fish.png");
  ghost = loadImage("ghost.png");
  upgrade = loadImage("upgrade.png");
  sell = loadImage("sell.png");

  // COUNTERS
  waveCount = 1;
  lives = 30;
  coins = 100;
  counter = 210;

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

void initializeMusic() {
  file = new SoundFile(this, "theme.mp3");
  file.loop();
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
