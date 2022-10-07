// Eleanor Liu
// Programming 12, Block 1-2
// Oct 7th, 2022

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer theme, success, failure;

int mode;
final int INTRO = 0;
final int GAME = 1;
final int GAMEOVER = 2;

color lightblue = #CFF8F7 ;
color aqua = #6ADDE8;
color brown = #b57938;
color lightred = #f7a8a8;

color tactileYellow = #ffe224;

color lavender = #eee0ff;
color lilac = #df8dfc;
color goldenYellow = #ffa600;

color red = #FF0022;
color orange = #FC7536;
color yellow = #FFDF64;
color green = #81C14B;
color blue = #008BF8;
color purple = #8F008C;
color pink = #fa3cce;

// COLOR TEXT
color[] colorOptions = {#FF0022, #FC7536, #FFDF64, #81C14B, #008BF8, #8F008C, #fa3cce};
String[] colorWords = {"Red", "Orange", "Yellow", "Green", "Blue", "Purple", "Pink"};
color currColor;
String currColorText;
boolean matches;

PFont myFont;

int score, highScore;

PImage[] introGif, gameoverGif;
int introFrameNum, introGifCount, gameoverFrameNum, gameoverGifCount;

// BUTTON
float TButtonAngle, FButtonAngle;
color falsePink = #ff94a4;
color falsePinkText = #f21f3f;
color trueGreen = #aeffab;
color trueGreenText = #00ff3c;

// COUNTDOWN
float countDownRate, countDownWidth;

//GAMEOVER GRAPH
ArrayList<Integer> numOfRounds = new ArrayList<Integer>();
ArrayList<Integer> scoresPerRound = new ArrayList<Integer>();
float xgrids;
float circleX, circleY, pastCircleX, pastCircleY;
int roundCount;

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
  introFrameNum = 58;
  introGifCount = 0;
  introGif = new PImage[introFrameNum];
  for (int i = 0; i < 58; i++) {
    if (i < 10) introGif[i] = loadImage("frame_0" + i + "_delay-0.04s.png");
    else introGif[i] = loadImage("frame_" + i + "_delay-0.04s.png");
  }

  gameoverFrameNum = 2;
  gameoverGifCount = 0;
  gameoverGif = new PImage[gameoverFrameNum];
  for (int i = 0; i < 2; i++) {
    gameoverGif[i] = loadImage("frame_" + i + "_delay-0.01s.png");
  }

  //ROTATING BUTTON
  TButtonAngle = 0;
  FButtonAngle = PI;
  textAlign(CENTER, CENTER);

  // COUNTDOWN
  countDownRate = 0.5;
  countDownWidth = 0.9*width;

  //COLOR MATCHING
  matches = false;

  int i1 = (int) random(0, 7);
  int i2 = (int) random(0, 7);
  currColorText  = colorWords[i1];
  currColor = colorOptions[i2];
  matches = (i1 == i2);

  // GAMEOVER GRAPH
  circleX = pastCircleX = -10;
  circleY = pastCircleY = -10;
  roundCount = 0;

  // music!
  minim = new Minim(this);
  theme = minim.loadFile("theme.mp3");
  success = minim.loadFile("success.mp3");
  failure = minim.loadFile("FAILURE.wav");
}

void draw() {
  if (mode == INTRO) intro();
  else if (mode == GAME) game();
  else if (mode == GAMEOVER) gameover();
  else print(mode);
}
