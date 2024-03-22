class GameOverMenu {
  private Button playAgainButton;
  private Button backToMainMenuButton;


  public GameOverMenu() {
    backToMainMenuButton = new Button(width/2, height * 9/10, 3, "backtomainmenu_blue");
    playAgainButton = new Button(width/2, height * 8/10, 3, "playagain_blue");
  }

  void display() {
    playAgainButton.display();
    backToMainMenuButton.display();
    fill(0);
    textSize(80);
    text("GAME OVER", width/2, height*3/10);
    textSize(40);
    text("Best Score: " + level.bestScore, width/2, height*4/10);
    text("Player1 Score: " + level.bird1.score, width/2, height*5/10);
    if (level.isTwoPlayers) {
      text("Player2 Score: " + level.bird2.score, width/2, height*6/10);
    }
  }
}
