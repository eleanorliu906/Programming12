//=====================================================================================================================================
void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);
  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);
  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);
  //add to world
  world.add(circle);
}
//=====================================================================================================================================
void makeBlob() {
  FBlob blob = new FBlob();
  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);
  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);
  //add to the world
  world.add(blob);
}
//=====================================================================================================================================
void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), -5);
  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);
  box.attachImage(yellowBird);
  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}
//=====================================================================================================================================
void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);
  //set visuals
  bird.attachImage(redBird);
  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
//=====================================================================================================================================
void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}
//=====================================================================================================================================
void makeTopPlatform() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(100, 100);
  p.vertex(100, 400);
  p.vertex(400, 400);
  p.vertex(400, 100);
  p.vertex(375, 100);
  p.vertex(375, 375);
  p.vertex(125, 375);
  p.vertex(125, 100);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0.1);
  //put it in the world
  world.add(p);
}
//=====================================================================================================================================
void makeBottomPlatform() {
  FPoly p = new FPoly();
  //plot the vertices of this platform
  p.vertex(width+100, height*0.6);
  p.vertex(300, height*0.8);
  p.vertex(300, height*0.8+100);
  p.vertex(width+100, height*0.6+100);
  // define properties
  p.setStatic(true);
  p.setFillColor(brown);
  p.setFriction(0);
  //put it in the world
  world.add(p);
}
