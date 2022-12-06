boolean hitGround(FBox ground){
  ArrayList<FContact> contactList = ball.getContacts();
  for(int i = 0; i < contactList.size(); i++){
    FContact c = contactList.get(i);
    if (c.contains(ground)) return true;
  }
  return false;
}

boolean touchGround(FBox player, FBox ground){
  ArrayList<FContact> contactList = player.getContacts();
  for(int i = 0; i < contactList.size(); i++){
    FContact c = contactList.get(i);
    if (c.contains(ground)) return true;
  }
  return false;
}
