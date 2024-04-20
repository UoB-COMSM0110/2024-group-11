class SettingsMenu {
  private ArrayList<Button> buttons;
  private ArrayList<Button> bird1ColourSelector;
  private ArrayList<Button> bird2ColourSelector;
  private Button backToMainMenuButton;
  private Button changeBGButton;
  private Button singlePlayerButton;
  private Button twoPlayersButton;
  private Button normalModeButton;
  private Button difficultModeButton;

  public SettingsMenu() {
    buttons = new ArrayList<Button>();
    bird1ColourSelector = new ArrayList<Button>();
    bird2ColourSelector = new ArrayList<Button>();
    buttons.add(backToMainMenuButton = new Button(width/2, height * 9/10, 3, "backtomainmenu_blue"));
    buttons.add(changeBGButton = new Button(width/5, height/10, 2, "changeground_blue"));
    buttons.add(singlePlayerButton = new Button((width/2)-150, height * 1/5 + 50, 2, "singleplayer_orange"));
    buttons.add(twoPlayersButton = new Button((width/2)+150, height * 1/5 + 50, 2, "twoplayers_blue"));
    buttons.add(normalModeButton = new Button((width/2)-150, height * 2/5, 2, "normalmode_orange"));
    buttons.add(difficultModeButton = new Button((width/2)+150, height * 2/5, 2, "difficultmode_blue"));

    bird1ColourSelector.add(new Button((width/2)-30, height * 3/5, 4, "red"));
    bird1ColourSelector.add(new Button((width/2)+5, height * 3/5, 4, "orange"));
    bird1ColourSelector.add(new Button((width/2)+40, height * 3/5, 4, "yellow"));
    bird1ColourSelector.add(new Button((width/2)+75, height * 3/5, 4, "green"));
    bird1ColourSelector.add(new Button((width/2)+110, height * 3/5, 4, "cyan"));
    bird1ColourSelector.add(new Button((width/2)+145, height * 3/5, 4, "blue"));
    bird1ColourSelector.add(new Button((width/2)+180, height * 3/5, 4, "purple"));

    for (Button button : bird1ColourSelector) {
      Button buttonpocy = new Button(button.x, button.y + 60, button.size, button.path);
      bird2ColourSelector.add(buttonpocy);
    }
  }

  void display() {
    for (Button button : buttons) {
      button.display();
    }
    for (Button button : bird1ColourSelector) {
      button.display();
    }
    fill(0);
    textSize(20);
    text("Player1 [SPACE]", (width/2)- 190, height * 3/5);
    image(loadImage("Birds/"+ level.bird1Colour + ".png"), (width/2)-80, height * 3/5);
    if (level.isTwoPlayers) {
      for (Button button : bird2ColourSelector) {
        button.display();
      }
      text("Player2 [UP]", (width/2)- 190, height * 3/5 +60);
      image(loadImage("Birds/"+ level.bird2Colour + ".png"), (width/2)-80, height * 3/5 +60);
    }
  }
}
