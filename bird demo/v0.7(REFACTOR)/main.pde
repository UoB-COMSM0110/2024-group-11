void setup() {
  size(1000, 600);
  frameRate(30);
  loadResources();
  mainMenu = new MainMenu();
  settingsMenu = new SettingsMenu();
  level = new Level();
  gameOverMenu = new GameOverMenu();
  textAlign(CENTER, CENTER);
  currentBGM = menuBGM;
  currentBGM.amp(0.2);
  currentBGM.loop();
}
void draw() {
  currentBGM.amp(0.2);
  background(BG);
  switch (currentUI) {
  case MainMenuState:
    mainMenu.display();
    break;

  case SettingsMenuState:
    settingsMenu.display();
    break;

  case InLevel:
    level.display();
    break;

  case GameOverMenuState:
    gameOverMenu.display();
    break;
  }
}
