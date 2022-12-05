import fisica.*;
FWorld world;

// KEYBOARD
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;

// COLORS
color skyblue = #d9f4ff;
color yellowgreen = #aff24b;
color orange = #ffc061;
color white = #FFFFFF;

// COUNTERS
int rightScore, leftScore;

// FBodies
FBox leftPlayer, rightPlayer, leftGround, rightGround, net;
FCircle ball;

void setup() {
  size(800, 600);
  createWorld();
  createBodies();
  rectMode(CENTER);
  leftScore = 0;
  rightScore = 0;
}

void draw() {
  background(skyblue);
  handlePlayerInput();
  runWorld();

  if (hitGround(leftGround)) {
    rightScore++;
    reset();
  }
  if (hitGround(rightGround)) {
    leftScore++;
    reset();
  }
}

void createWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges(skyblue);
  world.setEdgesRestitution(0);
}

void createBodies() {
  leftPlayer = new FBox(100, 100);
  leftPlayer.setPosition(0.25*width, 0.85*height);
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(1);
  leftPlayer.setFillColor(orange);
  leftPlayer.setDensity(5);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(0);
  world.add(leftPlayer);

  rightPlayer = new FBox(100, 100);
  rightPlayer.setPosition(0.75*width, 0.85*height);
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(1);
  rightPlayer.setFillColor(yellowgreen);
  rightPlayer.setDensity(5);
  rightPlayer.setFriction(1);
  rightPlayer.setRestitution(0);
  world.add(rightPlayer);

  leftGround = new FBox(0.5*width, 50);
  leftGround.setPosition(0.25*width, 575);
  leftGround.setStroke(0);
  leftGround.setStrokeWeight(1);
  leftGround.setFillColor(orange);
  // leftGround.setDensity(0.2);
  leftGround.setFriction(1);
  leftGround.setRestitution(0);
  leftGround.setStatic(true);
  world.add(leftGround);

  rightGround = new FBox(0.5*width, 50);
  rightGround.setPosition(0.75*width, 575);
  rightGround.setStroke(0);
  rightGround.setStrokeWeight(1);
  rightGround.setFillColor(yellowgreen);
  // rightGround.setDensity(0.2);
  rightGround.setFriction(1);
  rightGround.setRestitution(0);
  rightGround.setStatic(true);
  world.add(rightGround);

  net = new FBox(25, 240);
  net.setPosition(0.5*width, 0.717*height);
  net.setStroke(0);
  net.setStrokeWeight(1);
  net.setFillColor(white);
  net.setDensity(0.2);
  net.setFriction(1);
  net.setRestitution(0);
  net.setStatic(true);
  world.add(net);

  ball = new FCircle(75);
  ball.setPosition(0.5*width, 240);
  ball.setStroke(0);
  ball.setStrokeWeight(1);
  ball.setFillColor(white);
  ball.setDensity(0.2);
  ball.setFriction(1);
  ball.setRestitution(1);
  world.add(ball);
}

void runWorld() {
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}

void reset() {
  println("r");
  leftPlayer.setPosition(0.25*width, 0.9*height);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setPosition(0.75*width, 0.9*height);
  rightPlayer.setVelocity(0, 0);
  ball.setPosition(0.5*width, 240);
  ball.setVelocity(0, 0);
}
