int n;
Button[] myButtons;

color darkblue = #587291;
color blue = #2F97C1;

color turquoise = #1CCAD8;
color aqua = #15E6CD;

color green = #0CF574;
color lime = #B5D99C;

color orange = #F7B267;
color salmon = #F27059;

color lightyellow = #FFFF82;
color yellow = #FFAE03;

color currBackground;

boolean mouseReleased, wasPressed;

PImage flower = loadImage("forget-me-not-flower.jpeg");

void setup() {
  size(600, 600);
  n = 5;
  myButtons = new Button[n];
  mouseReleased = false;
  wasPressed = false;
  currBackground = 255;

  // String t, int _x, int _y, int _w, int _h, color norm, color high
  myButtons[0] = new Button("Green", 70, 70, 100, 60, green, lime);
  myButtons[1] = new Button("Blue", 250, 250, 100, 60, darkblue, blue);
  myButtons[2] = new Button("Turqoise", 100, 300, 150, 150, turquoise, aqua);
  myButtons[3] = new Button("Orange", 200, 50, 100, 100, salmon, orange);
  myButtons[4] = new Button("Yellow", 400, 400, 120, 100, yellow, lightyellow);
}

void draw() {
  background(currBackground);
  for (int i = 0; i < n; i ++) {
    myButtons[i].act();
    myButtons[i].show();
  }
  click();
}
