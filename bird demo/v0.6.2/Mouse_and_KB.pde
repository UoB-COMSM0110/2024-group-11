//Respond when the mouse is pressed
void mousePressed() {
  if (currentState == STATE_MAIN_MENU) {
    if (startButton.isMouseOver()) {
      pressButton.play();
      reset();
      currentState = STATE_LEVEL;
    }
    if (settingButton.isMouseOver()) {
      pressButton.play();
      currentState = STATE_SETTING_MENU;
    }
  }

  if (currentState == STATE_SETTING_MENU) {
    if (settingToMainButton.isMouseOver()) {
      pressButton.play();
      currentState = STATE_MAIN_MENU;
    }
    for (int i = 0; i < 7; i++) {
      if (buttons1[i].isMouseOver()) {
        pressButton.play();
        bird1.birdColour = numGetColor(i);
      }
    }
    for (int i = 0; i < 7; i++) {
      if (buttons2[i].isMouseOver()) {
        pressButton.play();
        bird2.birdColour = numGetColor(i);
      }
    }
    if (singleButton.isMouseOver()) {
      pressButton.play();
      isdouble = false;
    }
    if (doubleButton.isMouseOver()) {
      pressButton.play();
      isdouble = true;
    }
    // iq23062 update
    if (backgroundButton.isMouseOver()) {
      pressButton.play();
      bgstr_cnt += 1;
      bgimg = loadImage(bgstr.get(bgstr_cnt%bgstr.size()));
    }
    
  }
  if (currentState == STATE_END) {
    if (playAgainButton.isMouseOver()) {
      pressButton.play();
      reset();
      currentState = STATE_LEVEL;
    }
    if (backToMainMenuButton.isMouseOver()) {
      pressButton.play();
      reset();
      currentState = STATE_MAIN_MENU;
    }
  }
}

//Check if the key has been pressed
void keyPressed() {
  if (key == ' ' && bird1.jump == 0) {
    bird1.jump = 1;
    bird1.fallSpeed = 0;
  }
  if (keyCode == UP && bird2.jump == 0 && isdouble) {
    bird2.jump = 1;
    bird2.fallSpeed = 0;
  }
}
