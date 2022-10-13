int n;
Button[] myButtons;

ArrayList<Gif> myGifs = new ArrayList<Gif>();

color darkblue = #587291;
color blue = #2F97C1;
color turquoise = #1CCAD8;
color aqua = #15E6CD;
color green = #0CF574;
color lime = #a4ed68;
color orange = #F7B267;
color salmon = #F27059;
color lightyellow = #FFFF82;
color yellow = #FFAE03;

color currBackground;

boolean mouseReleased, wasPressed;

PImage flower;

void setup() {
  size(600, 600);
  n = 5;
  myButtons = new Button[n];
  mouseReleased = false;
  wasPressed = false;
  currBackground = 255;
  
  flower =  loadImage("forget-me-not-flower.jpeg");

  // String t, int _x, int _y, int _w, int _h, color norm, color high
  myButtons[0] = new Button("Green", 170, 170, 120, 80, lime, green);
  myButtons[1] = new Button(flower, 300, 430, 120, 80, blue, darkblue);
  myButtons[2] = new Button("Turqoise", 430, 170, 120, 80, turquoise, aqua);
  myButtons[3] = new Button("Orange", 300, 70, 150, 120, orange, salmon);
  myButtons[4] = new Button("Yellow", 300, 300, 200, 100, lightyellow, yellow);
}

void draw() {
  background(currBackground);
  for (int i = 0; i < n; i ++) {
    myButtons[i].act();
    myButtons[i].show();
  }
  click();
}
