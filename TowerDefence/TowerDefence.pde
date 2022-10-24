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
color powderblue = #ABDAE1;
color steelblue = #A3B9C9;
color lavender = #A09CB0;
color melonpink = #FCBFB7;
color grassgreen = #b7ff87;

// FONT
PFont myFont;

//GIFS
ArrayList<Gif> introGif = new ArrayList<Gif>();
Gif currGif;

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
  nextWave  = new Button("Next", 567, 40, 90, 40, lavender, lavender);
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
}

// ===================== DRAW ===========================
void draw() {
  click();
  if (mode == INTRO) intro();
  else if (mode == PLAY) play();
  else if (mode == BUILD) build();
  else if (mode == GAMEOVER) gameover();
}
