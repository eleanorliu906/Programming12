boolean touchingButton(float x, float y, float w, float h) {
  return (mouseX > x - 0.5*w && mouseX < x + 0.5*w && mouseY > y - 0.5*h && mouseY < y + 0.5*h);
}

void tactileButton(float x, float y, float w, float h, float t) {
  fill(tactileYellow, t);
  rect(x, y, w, h);
}

int max(ArrayList<Integer> arr) {
  int l = arr.size();
  int max = Integer.MIN_VALUE;
  for (int i = 0; i < l; i++) {
    if (arr.get(i) > max) max = arr.get(i);
  }
  return max;
}
