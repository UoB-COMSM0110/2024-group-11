//Respond when the mouse is pressed
void mousePressed() {
  if (currentState == STATE_MAIN_MENU) {
    if (startButton.isMouseOver()) {
      reset();
      currentState = STATE_LEVEL;
    }
    if (settingButton.isMouseOver()) {
      currentState = STATE_SETTING_MENU;
    }
  }

  if (currentState == STATE_SETTING_MENU) {
    if (settingToMainButton.isMouseOver()) {
      currentState = STATE_MAIN_MENU;
    }
    for (int i = 0; i < 7; i++) {
      if (buttons1[i].isMouseOver()) {
        bird1.birdColour = numGetColor(i);
      }
    }
    for (int i = 0; i < 7; i++) {
      if (buttons2[i].isMouseOver()) {
        bird2.birdColour = numGetColor(i);
      }
    }
    if (singleButton.isMouseOver()) {
      isdouble = false;
    }
    if (doubleButton.isMouseOver()) {
      isdouble = true;
    }
  }
  if (currentState == STATE_END) {
    if (playAgainButton.isMouseOver()) {
      reset();
      currentState = STATE_LEVEL;
    }
    if (backToMainMenuButton.isMouseOver()) {
      reset();
      currentState = STATE_MAIN_MENU;
    }
  }
}
