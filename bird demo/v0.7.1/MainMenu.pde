class MainMenu {
  private ArrayList<Button> buttons;
  private Button startGameButton;
  private Button settingsMenuButton;

  public MainMenu() {
    buttons = new ArrayList<Button>();
    buttons.add(startGameButton = new Button(width/2, height*2/3, 1, "start_blue"));
    buttons.add(settingsMenuButton = new Button(width/2, height*2/3 + 75, 1, "setting_blue"));
  }
  void display() {
    image(loadImage("Other/mainLogo.png"), (width/2)+10, height/3);
    for (Button button : buttons) {
      button.display();
    }
  }
}
