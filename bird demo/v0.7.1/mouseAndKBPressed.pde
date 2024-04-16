void mousePressed() {
  switch (currentUI) {
  case MainMenuState:
    if (mainMenu.startGameButton.isClicked(mouseX, mouseY)) {
      level.reset();
      currentBGM.stop();
      if (!level.isDifficult) {
        currentBGM = normalModeLevelBGM;
      } else {
        currentBGM = difficultModeLevelBGM;
      }
      currentBGM.loop();
      currentUI = InLevel;
    }
    if (mainMenu.settingsMenuButton.isClicked(mouseX, mouseY)) {
      currentUI = SettingsMenuState;
    }
    break;

  case SettingsMenuState:
    if (settingsMenu.backToMainMenuButton.isClicked(mouseX, mouseY)) {
      currentUI = MainMenuState;
    }
    if (settingsMenu.changeBGButton.isClicked(mouseX, mouseY)) {
      if (currentBG == bgStr.size() - 1) {
        currentBG = 0;
      } else {
        currentBG++;
      }
      BG = loadImage(bgStr.get(currentBG));
    }
    if (settingsMenu.singlePlayerButton.isClicked(mouseX, mouseY)) {
      level.isTwoPlayers = false;
      settingsMenu.buttons.set(2, new Button((width/2)-150, height * 1/5, 2, "singleplayer_orange"));
      settingsMenu.buttons.set(3, new Button((width/2)+150, height * 1/5, 2, "twoplayers_blue")) ;
    }
    if (settingsMenu.twoPlayersButton.isClicked(mouseX, mouseY)) {
      level.isTwoPlayers = true;
      settingsMenu.buttons.set(2, new Button((width/2)-150, height * 1/5, 2, "singleplayer_blue"));
      settingsMenu.buttons.set(3, new Button((width/2)+150, height * 1/5, 2, "twoplayers_orange"));
    }
    String[] colours= {"red", "orange", "yellow", "green", "cyan", "blue", "purple"};
    for (int i = 0; i < settingsMenu.bird1ColourSelector.size(); i++) {
      if (settingsMenu.bird1ColourSelector.get(i).isClicked(mouseX, mouseY)) {
        level.bird1Colour = colours[i];
      }
      if (settingsMenu.bird2ColourSelector.get(i).isClicked(mouseX, mouseY)) {
        level.bird2Colour = colours[i];
      }
    }
    if (settingsMenu.normalModeButton.isClicked(mouseX, mouseY)) {
      level.isDifficult = false;
      settingsMenu.buttons.set(4, new Button((width/2)-150, height * 2/5, 2, "normalmode_orange"));
      settingsMenu.buttons.set(5, new Button((width/2)+150, height * 2/5, 2, "difficultmode_blue"));
    }
    if (settingsMenu.difficultModeButton.isClicked(mouseX, mouseY)) {
      level.isDifficult = true;
      settingsMenu.buttons.set(4, new Button((width/2)-150, height * 2/5, 2, "normalmode_blue"));
      settingsMenu.buttons.set(5, new Button((width/2)+150, height * 2/5, 2, "difficultmode_orange"));
    }
    break;

  case GameOverMenuState:
    if (gameOverMenu.backToMainMenuButton.isClicked(mouseX, mouseY)) {
      currentBGM.stop();
      currentBGM = menuBGM;
      currentBGM.loop();
      currentUI = MainMenuState;
    }
    if (gameOverMenu.playAgainButton.isClicked(mouseX, mouseY)) {
      level.reset();
      currentUI = InLevel;
    }
    break;
  }
}

void keyPressed() {
  if (key == ' ') {
    spacePressed = true;
  }
  if (keyCode == UP) {
    upPressed = true;
  }
  if (currentUI == InLevel && (key == 'p' || key == 'P')) {
    fill(248,248,250,150);
    textSize(200);
    text("Pause",width/2,(height/2)-50);
    textSize(50);
    text("Press C to continue",width/2,(height/2)+100);
    noLoop();
  }
  if (currentUI == InLevel && (key == 'c' || key == 'C')) {
    loop();
  }
}

void keyReleased() {
  if (key == ' ') {
    spacePressed = false;
  }
  if (keyCode == UP) {
    upPressed = false;
  }
}
