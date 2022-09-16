boolean touchingButton(float x, float y, float w, float h) {
  return (mouseX > x - 0.5*w && mouseX < x + 0.5*w && mouseY > y - 0.5*h && mouseY < y + 0.5*h);
}

void tactileButton(float x, float y, float w, float h, float t) {
  fill(tactileYellow, t);
  rect(x, y, w, h);
}
