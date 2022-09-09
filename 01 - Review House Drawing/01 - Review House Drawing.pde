import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;

ArrayList<Stars> starList = new ArrayList<Stars>();

boolean fullMoon;

void setup() {
  size(600, 600);

  minim = new Minim(this);
  song = minim.loadFile("house-bgm-10m.mp3");
  song.play();

  fullMoon = false;
}

void draw() {

  // night sky
  background(#261566);

  // setting the default to no stroke
  noStroke();

  // grassy lawn
  fill(#064f25);
  rect(0, 0.8*height, width, 0.2*height);

  // roof
  fill(#ed4f24);
  triangle(0.5*width, 0.1*height, 0.1*width, 0.4*height, 0.9*width, 0.4*height);

  // house
  fill(#f5f3bc);
  rect(0.2*width, 0.4*height, 0.6*width, 0.4*height);
  triangle(0.5*width, 0.2*height, 0.2*width, 0.4*height, 0.8*width, 0.4*height);

  // window 1 (circular)
  fill(#91e5eb);
  circle(0.5*width, 0.32*height, 0.16*height);

  // window 1's bars
  strokeWeight(5);
  stroke(255);
  line(0.5*width, 0.24*height, 0.5*width, 0.40*height);
  line(0.42*width, 0.32*height, 0.58*width, 0.32*height);

  // windows 2, 3, 4, 5
  noStroke();
  square(0.3*width, 0.62*height, 0.14*height);
  square(0.3*width, 0.42*height, 0.14*height);
  square(0.56*width, 0.62*height, 0.14*height);
  square(0.56*width, 0.42*height, 0.14*height);

  // window 2's bars
  strokeWeight(5);
  stroke(255);
  line(0.37*width, 0.62*height, 0.37*width, 0.76*height);
  line(0.3*width, 0.69*height, 0.44*width, 0.69*height);

  // window 3's bars
  line(0.37*width, 0.42*height, 0.37*width, 0.56*height);
  line(0.3*width, 0.49*height, 0.44*width, 0.49*height);

  // window 4's bars
  line(0.63*width, 0.42*height, 0.63*width, 0.56*height);
  line(0.56*width, 0.49*height, 0.7*width, 0.49*height);

  // window 5's bars
  line(0.63*width, 0.62*height, 0.63*width, 0.76*height);
  line(0.56*width, 0.69*height, 0.7*width, 0.69*height);

  // moon
  fill(#fdffcc, moonTransparency());
  noStroke();
  circle(0.15*width, 0.15*height, 0.15*height);
  fill(#261566);
  circle(0.18*width, 0.13*height, 0.12*height);

  if (frameCount % 10 == 0 && frameCount > 0) addStar();

  gameEngine();
}

void gameEngine() {
  for (int i = 0; i < starList.size(); i++) {
    Stars s = starList.get(i);
    s.act();
    s.show();

    if (!s.alive) {
      starList.remove(i);
      i--;
    }
  }
}

void addStar() {
  starList.add(new Stars(mouseX + random(-5, 5), mouseY  + random(-5, 5), random(8, 12)));
}

float moonTransparency() {
  if (frameCount/5 % 256 == 0) fullMoon = !fullMoon;
  
  if (!fullMoon) {
    return (frameCount/5) % 256;
  } else {
    return 256 - (frameCount/5) % 256;
  }
}
