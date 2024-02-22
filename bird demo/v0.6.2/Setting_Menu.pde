//Setting menu display
void drawSettingMenu() {
  // iq23062 update
  background(bgimg);

  singleButton.display();
  doubleButton.display();
  settingToMainButton.display();
  
  // iq23062 update
  backgroundButton.display();
  
  for (int i = 0; i < 7; i++) {
    fill(0);
    text("Player 1", width/2-200, 300);
    fill(bird1.birdColour);
    ellipse(width/2 - 80, 300, 40, 40);
    buttons1[i].display();
    if (isdouble) {
      buttons2[i].display();
      fill(0);
      text("Player 2", width/2-200, 350);
      fill(bird2.birdColour);
      ellipse(width/2 - 80, 350, 40, 40);
    }
  }
}
