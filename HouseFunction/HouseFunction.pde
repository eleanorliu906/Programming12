color houseWall = #f5f3bc;
color roofRed = #ed4f24;
color windowBlue = #91e5eb;

void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void draw() {

  // night sky
  background(#261566);

  // setting the default to no stroke
  noStroke();

  house(300, 300, 100);

}

void house(int x, int y, int s) {
  pushMatrix();
  translate(x, y);

  noStroke();
  fill(houseWall);
  rect(0, 0, s, 1.2*s);

  fill(roofRed);
  triangle(0, -1.35*s, 0.75*s, -0.6*s, -0.75*s, -0.6*s);

  fill(houseWall);
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
