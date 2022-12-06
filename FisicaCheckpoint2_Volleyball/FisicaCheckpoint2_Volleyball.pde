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
  showScores();

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

void runWorld() {
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
}

void reset() {
  println("r");
  leftPlayer.setPosition(0.25*width, 500);
  leftPlayer.setVelocity(0, 0);
  rightPlayer.setPosition(0.75*width, 500);
  rightPlayer.setVelocity(0, 0);
  ball.setPosition(0.5*width, 220);
  ball.setVelocity(0, 0);
}

void showScores(){
  textSize(40);
  text(rightScore, 0.75*width, 80);
  text(leftScore, 0.25*width, 80);
}
