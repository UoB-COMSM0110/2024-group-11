void setup() {
  size(1000, 600);
  frameRate(30);

  objSpeed = 4;
  p1score = 0;
  p2score = 0;
  bestScore = 0;
  isdouble = false;
  createInstance();
  
  //iq23062 update
  bgstr = new ArrayList<String>();
  bgstr.add("bg_sunny.png");
  bgstr.add("bg_cloudy.png");
  bgimg = loadImage(bgstr.get(bgstr_cnt));

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
