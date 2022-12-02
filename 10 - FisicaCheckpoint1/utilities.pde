void click() {
  mouseReleased = false; // to prevent spilling over, reset every frame. assume the mouse is not released
  if (mousePressed) wasPressed = true; // remember that at some point we pushed down the mouse
  if (wasPressed && !mousePressed) { // the mouse was pressed in a previos frame, but is no longer pressed; can't be mousePressed and not mousePressed the same time
    mouseReleased = true;
    wasPressed = false; // reset wasPressed to prevent spilling over
  }
}
