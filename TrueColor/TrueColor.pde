int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;

color lightblue = #CFF8F7 ;
color aqua = #6ADDE8;
color brown = #b57938;
color lightred = #f7a8a8;

color tactileYellow = #ffe224;

color lavender = #eee0ff;
color lilac = #df8dfc;

color red = #FF0022;
color orange = #FC7536;
color yellow = #FFDF64;
color green = #81C14B;
color blue = #008BF8;
color purple = #8F008C;
color pink = #fa3cce;

PFont myFont;

int score, highScore;

PImage[] gif;
int numberOfFrames, gifCount;

void setup() {
  myFont = createFont("Friday Beach.ttf", 28);
  textFont(myFont);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  mode = INTRO;
  size(400, 600);

  score = 0;

  // Load the GIF
  numberOfFrames = 58;
  gifCount = 0;
  gif = new PImage[numberOfFrames];
  for (int i = 0; i < 58; i++) {
    if (i < 10) gif[i] = loadImage("frame_0" + i + "_delay-0.04s.png");
    else gif[i] = loadImage("frame_" + i + "_delay-0.04s.png");
  }
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == GAMEOVER) gameover();
  else print(mode);
}
