// NEW FEATURES:
// - cant make clouds/stars on land
// - added house function to previous sketch with stars/clouds, moon/sun, and bgm
// - sine function for height of moon/sun
// - color of the houses can be changed
// - GIF Fireworks

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer song;

ArrayList<CloudStars> objList = new ArrayList<CloudStars>();
ArrayList<Gif> gifList = new ArrayList<Gif>();

PImage cloud;

boolean fullMoon;
boolean isNight;

// animation variables
float sunMoonX;

// color pallette
color skyblue = #d0f5f7;
color nightblue = #261566;
color currBackground;
color sunOrange = #ffbb00;
color windowBlue = #91e5eb;
color roofRed = #ed4f24;
color nightgreen = #064f25;
color daygreen = #1ad940;
color currGrass;

color houseColor;
color red = #ff2121;
color lavender = #d1bbfa;
color lightpink = #fabbf7;
color cream = #f5f3bc;
color lightorange = #faddbb;

// GIF

PImage[] gif;
int numberOfFrames;
int gifCooldown;

void setup() {

  // GIF
  numberOfFrames = 91;
  gif = new PImage[numberOfFrames];
  gifCooldown= 0;

  for (int i = 0; i < 91; i++) {
    if (i < 10) gif[i] = loadImage("frame_0" + i + "_delay-0.03s.png");
    else gif[i] = loadImage("frame_" + i + "_delay-0.03s.png");
  }

  size(600, 600);

  minim = new Minim(this);
  song = minim.loadFile("house-bgm-10m.mp3");
  song.play();

  fullMoon = false;
  isNight = true;
  currBackground = nightblue;
  currGrass = nightgreen;

  // initializing animation variables
  sunMoonX = 90;

  // color
  houseColor = cream;

  cloud = loadImage("cloud.png");
  rectMode(CENTER);
}

void draw() {

  // night sky
  background(currBackground);

  // setting the default to no stroke
  noStroke();

  // switch between day and night
  dayOrNight();

  // moon or sun
  if (isNight) drawMoon();
  else drawSun();

  // grassy lawn
  fill(currGrass);
  rect(width/2, height*0.8, width, height*0.4);

  // house
  house(100, 500, 100);
  house(300, 500, 100);
  house(500, 500, 100);

  house(200, 400, 100);
  house(400, 400, 100);

  // adding new stars or clouds
  if (frameCount % 8 == 0 && frameCount > 60 && mouseY <= 0.6*height) addCloudStar();
  // running the ArrayList of stars and clouds
  createObjs();

  // create buttons
  createButton(width*0.04, height*0.8, 25, lavender);
  createButton(width*0.04, height*0.85, 25, lightpink);
  createButton(width*0.04, height*0.9, 25, lightorange);
  createButton(width*0.04, height*0.95, 25, cream);

  createRectButton(width*0.04, height*0.05, 25, 25, lavender);

  gifCooldown --;
  println(gifCooldown);
}

void createObjs() {
  for (int i = 0; i < objList.size(); i++) {
    CloudStars s = objList.get(i);
    s.act();
    s.show();

    if (!s.alive) {
      objList.remove(i);
      i--;
    }
  }

  for (int i = 0; i < gifList.size(); i++) {
    Gif g = gifList.get(i);
    g.act();
    g.show();

    if (!g.alive) {
      gifList.remove(i);
      i--;
    }
  }
}

void createButton(float x, float y, float s, color c) {
  noStroke();
  fill(c);
  circle(x, y, s);

  if (touchingCircle(x, y, s/2)) {
    strokeWeight(3);
    stroke(red);
    noFill();
    circle(x, y, s);
  } else noStroke();

  if (mousePressed && touchingCircle(x, y, s/2)) {
    houseColor = c;
  }
}

void createRectButton(float x, float y, float w, float h, color c) {
  noStroke();
  fill(c);
  rect(x, y, w, h);

  if (touchingRect(x, y, w, h)) {
    strokeWeight(3);
    stroke(red);
    noFill();
    rect(x, y, w, h);
  } else noStroke();

  if (mousePressed && touchingRect(x, y, w, h)) {
    if (gifCooldown < 0) gifList.add(new Gif(random(width), random(0.5*height)));
    gifCooldown = 120;
  }
}

boolean touchingRect(float x, float y, float w, float h) {
  if (mouseX >= x - 0.5*w && mouseX <= x + 0.5*w && mouseY >= y - 0.5*h && mouseY <= y + 0.5*h) return true;
  else return false;
}

boolean touchingCircle(float x, float y, float r) {
  if (dist(x, y, mouseX, mouseY) <= r) return true;
  else return false;
}

void addCloudStar() {
  objList.add(new CloudStars(mouseX + random(-5, 5), mouseY  + random(-5, 5), random(5, 8)));
}

float moonTransparency() {
  if (frameCount % 256 == 0) fullMoon = !fullMoon;

  if (!fullMoon) {
    return (frameCount) % 256;
  } else {
    return 256 - (frameCount) % 256;
  }
}

void drawMoon() {
  // moon
  fill(#fdffcc, moonTransparency()); // function to change moon's transparency
  noStroke();
  circle(sunMoonX, 0.15*width - 30*sin(PI*sunMoonX/600), 0.15*height); // moon
  fill(nightblue);
  circle(sunMoonX + 18, 0.13*width - 30*sin(PI*sunMoonX/600), 0.12*height); //  circle to create a crescent
}

void drawSun() {
  // Sun
  fill(sunOrange); // function to change moon's transparency
  noStroke();
  circle(sunMoonX, 0.15*width - 30*sin(PI*sunMoonX/600), 0.15*height); // moon
}

void dayOrNight() {
  sunMoonX = (sunMoonX + 0.5);

  if (sunMoonX > width) {
    sunMoonX = -0.075 * width;
    isNight = !isNight;

    if (isNight) {
      currBackground = nightblue;
      currGrass = nightgreen;
    } else {
      currBackground = skyblue;
      currGrass = daygreen;
    }
  }
}

void house(int x, int y, int s) {
  pushMatrix();
  translate(x, y);

  noStroke();
  fill(houseColor);
  rect(0, 0, s, 1.2*s);

  fill(roofRed);
  triangle(0, -1.35*s, 0.75*s, -0.6*s, -0.75*s, -0.6*s);

  fill(houseColor);
  triangle(0, -1.1*s, 0.5*s, -0.6*s, -0.5*s, -0.6*s);

  window(0.25*s, 0.25*s, 0.3*s);
  window(-0.25*s, 0.25*s, 0.3*s);
  window(0.25*s, -0.3*s, 0.3*s);
  window(-0.25*s, -0.3*s, 0.3*s);

  circularWindow(0, -0.75*s, 0.18*s);
  popMatrix();
}

void window(float x, float y, float s) {

  pushMatrix();
  translate(x, y);

  // window
  noStroke();
  fill(windowBlue);
  square(0, 0, s);

  // bars
  strokeWeight(0.1*s);
  stroke(255);
  line(-0.5*s, 0, 0.5*s, 0);
  line(0, -0.5*s, 0, 0.5*s);

  popMatrix();
}

void circularWindow(float x, float y, float s) {
  pushMatrix();
  translate(x, y);

  noStroke();
  fill(windowBlue);
  circle(0, 0, 2*s);

  strokeWeight(0.2*s);
  stroke(255);
  line(-s, 0, s, 0);
  line(0, -s, 0, s);
  popMatrix();
}
