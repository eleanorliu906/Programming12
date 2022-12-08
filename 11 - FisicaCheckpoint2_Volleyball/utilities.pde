boolean hitGround(FBox ground) {
  ArrayList<FContact> contactList = ball.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    FContact c = contactList.get(i);
    if (c.contains(ground)) return true;
  }
  return false;
}

boolean touchGround(FBox player, FBox ground) {
  ArrayList<FContact> contactList = player.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    FContact c = contactList.get(i);
    if (c.contains(ground)) return true;
  }
  return false;
}

boolean touchingSomething(FBox player) {
  ArrayList<FContact> contactList = player.getContacts();
  for (int i = 0; i < contactList.size(); i++) {
    FContact c = contactList.get(i);
    if (c.contains(ball)) return false;
  }
  if (contactList.size() > 0) return true;
  return false;
}

void click() {
  mouseReleased = false; // to prevent spilling over, reset every frame. assume the mouse is not released
  if (mousePressed) wasPressed = true; // remember that at some point we pushed down the mouse
  if (wasPressed && !mousePressed) { // the mouse was pressed in a previos frame, but is no longer pressed; can't be mousePressed and not mousePressed the same time
    mouseReleased = true;
    wasPressed = false; // reset wasPressed to prevent spilling over
  }
}
