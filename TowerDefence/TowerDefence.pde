// MUSIC
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, success, failure;

// MODE FRAMEWORK
final int intro = 0;
final int play = 1;
final int build = 2;
final int gameover = 3;
int mode;

//COLORS
color tactileYellow = #ffe224;
color purplegray = #6B6D76;
color silver = #BFC0C0;
color gray = #A69888;
color dgray = #776D5A;
color dblue = #334E58;
color dbrown = #33261D;
color powderblue = #ABDAE1;
color steelblue = #A3B9C9;
color lavender = #A09CB0;
color melonpink = #FCBFB7;

// FONT
PFont myFont;

//GIFS
ArrayList<Gif> introGif = new ArrayList<Gif>();
Gif currGif;

// MOUSE
boolean mouseReleased, wasPressed;

//BUTTONS
ArrayList<Gif> buttons = new ArrayList<Gif>();
Button introButton;

void setup() {
  mode = 0;
  size(630, 480);

  //text
  textAlign(CENTER, CENTER);
  myFont = createFont("Milky Coffee.ttf", 28);
  textFont(myFont);

  // IMAGES
  imageMode(CENTER);

  // GIF
  initializeGifs();

  initializeButtons();
}

void draw() {
  click();
  if (mode == intro) intro();
  else if (mode == play) play();
  else if (mode == build) build();
  else if (mode == gameover) gameover();
}

void initializeGifs() {
  introGif.add(new Gif("tower/frame_", "_delay-0.1s", 100, 9));
}

void initializeButtons() {
  //String t, int _x, int _y, int _w, int _h, color c1, color c2
  introButton  = new Button("Start!", width/2, 440, 100, 60, steelblue, dblue);
}
