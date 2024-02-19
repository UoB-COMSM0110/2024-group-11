void setup() {
  size(1000, 600);
  frameRate(30);

  objSpeed = 4;
  p1score = 0;
  p2score = 0;
  bestScore = 0;
  isdouble = false;
  createInstance();
}

void draw() {
  //Switch between different interfaces based on the value of currentState.
  switch (currentState) {
  case STATE_MAIN_MENU:
    drawMainMenu();
    break;
  case STATE_SETTING_MENU:
    drawSettingMenu();
    break;
  case STATE_LEVEL:
    drawLevel();
    break;
  case STATE_END:
    drawEnd();
    break;
  }
}
