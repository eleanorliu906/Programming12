import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
Minim minim;
AudioPlayer song;

ArrayList<CloudStars> objList = new ArrayList<CloudStars>();

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

color nightgreen = #064f25;
color daygreen = #1ad940;
color currGrass;

void setup() {

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

  cloud = loadImage("cloud.png");
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
  rect(0, 0.8*height, width, 0.2*height);

  // house
  createHouse();

  // adding new stars or clouds
  if (frameCount % 8 == 0 && frameCount > 60) addCloudStar();
  // running the ArrayList of stars and clouds
  createObjs();
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

void createHouse() {
  // roof
  fill(#ed4f24);
  triangle(0.5*width, 0.1*height, 0.1*width, 0.4*height, 0.9*width, 0.4*height);

  // house
  fill(#f5f3bc);
  rect(0.2*width, 0.4*height, 0.6*width, 0.4*height);
  triangle(0.5*width, 0.2*height, 0.2*width, 0.4*height, 0.8*width, 0.4*height);

  // window 1 (circular)
  fill(windowBlue);
  circle(0.5*width, 0.32*height, 0.16*height);

  // window 1's bars
  strokeWeight(5);
  stroke(255);
  line(0.5*width, 0.24*height, 0.5*width, 0.40*height);
  line(0.42*width, 0.32*height, 0.58*width, 0.32*height);

  // window 2 (bottom left)
  fill(windowBlue);
  noStroke();
  square(0.3*width, 0.62*height, 0.14*height);

  // window 2's bars
  strokeWeight(5);
  stroke(255);
  line(0.37*width, 0.62*height, 0.37*width, 0.76*height);
  line(0.3*width, 0.69*height, 0.44*width, 0.69*height);

  // window 3: top left
  fill(windowBlue);
  noStroke();
  square(0.3*width, 0.42*height, 0.14*height);

  // window 3's bars
  strokeWeight(5);
  stroke(255);
  line(0.37*width, 0.42*height, 0.37*width, 0.56*height);
  line(0.3*width, 0.49*height, 0.44*width, 0.49*height);


  // window 4: bottom right
  fill(windowBlue);
  noStroke();
  square(0.56*width, 0.42*height, 0.14*height);

  // window 4's bars
  strokeWeight(5);
  stroke(255);
  line(0.63*width, 0.42*height, 0.63*width, 0.56*height);
  line(0.56*width, 0.49*height, 0.7*width, 0.49*height);

  // window 5: top right
  fill(windowBlue);
  noStroke();
  square(0.56*width, 0.62*height, 0.14*height);

  // window 5's bars
  strokeWeight(5);
  stroke(255);
  line(0.63*width, 0.62*height, 0.63*width, 0.76*height);
  line(0.56*width, 0.69*height, 0.7*width, 0.69*height);
}
