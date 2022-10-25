//Tower Defense Game
// Eleanor Liu
//Programming 12

// ================ GLOBAL VARIABLES =================
final int INTRO = 0;
final int PLAY = 1;
final int BUILD = 2;
final int GAMEOVER = 3;
int mode;

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
color purplegray = #6B6D76;
color silver = #BFC0C0;
color gray = #A69888;
color dgray = #776D5A;
color dblue = #334E58;
color dgreen = #0d3d07;
color dbrown = #33261D;
color powderblue = #6aaee6;
color steelblue = #A3B9C9;
color lavender = #A09CB0;
color melonpink = #FCBFB7;
color grassgreen = #b7ff87;
color skyblue = #b0ebf5;
color red = #FF0000;

// FONT
PFont myFont;

//GIFS
ArrayList<Gif> introGif = new ArrayList<Gif>();
Gif currGif;

// NODES
ArrayList<Node> nodeList = new ArrayList<Node>();

// MOUSE
boolean mouseReleased, wasPressed;

//BUTTONS
ArrayList<Gif> buttons = new ArrayList<Gif>();
Button introButton, nextWave;

void setup() {
  mode = 0;
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
  mode = PLAY;
}


void initializeGifs() {
  introGif.add(new Gif("tower/frame_", "_delay-0.1s", 100, 9));
}

void initializeButtons() {
  //String t, int _x, int _y, int _w, int _h, color c1, color c2
  introButton  = new Button("Start!", width/2, 440, 100, 60, steelblue, dblue);
  nextWave  = new Button(loadImage("play.png"), 567, 40, 90, 40, 30, 30, powderblue, powderblue);
}

void initializeVariables() {
  // FONTS
  myFont = createFont("Milky Coffee.ttf", 28);
  textFont(myFont);

  // IMAGES AND GIFS

  // CREATE OBJECTS
}

void makeNodes() {
  //Plot the nodes on the map

  nodeList.add(new Node(50, 150, 1, 0));
  nodeList.add(new Node(250, 150, 0, 1));
  nodeList.add(new Node(250, 250, -1, 0));
  nodeList.add(new Node(150, 250, 0, -1));
  nodeList.add(new Node(150, 75, 1, 0));
  nodeList.add(new Node(350, 75, 0, 1));
  nodeList.add(new Node(350, 325, -1, 0));
  nodeList.add(new Node(100, 325, 0, 1));
  nodeList.add(new Node(100, 425, 1, 0));
  nodeList.add(new Node(504, 425, 1, 0));
}

// ===================== DRAW ===========================
void draw() {
  click();
  if (mode == INTRO) intro();
  else if (mode == PLAY) play();
  else if (mode == BUILD) build();
  else if (mode == GAMEOVER) gameover();
  showCoordinates();
}

void showCoordinates() {
  String t = mouseX + ", " + mouseY;
  fill(0);
  textSize(15);
  text(t, mouseX, mouseY);
}
