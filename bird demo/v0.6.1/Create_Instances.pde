void createInstance() {
  //Create an ArrayList to store Pipe objects.
  pipes1 = new ArrayList<Pipe>();
  pipes2 = new ArrayList<Pipe>();
  //Create an ArrayList to store Coin objects.
  coins = new ArrayList<Coin>();

  //Create an instance of the Bird class named bird1.
  bird1 = new Bird();
  bird2 = new Bird();
  //bird2's default colour is green
  bird2.birdColour = stringGetColor("green");

  //Create instances of the Button class.
  startButton = new Button(width/2, height/2, 200, 50, 150, "START");
  settingButton = new Button(width/2, height/2+100, 200, 50, 150, "Setting");
  settingToMainButton = new Button(width/2, height*3/4, 350, 50, 150, "Back To Main Menu");
  playAgainButton = new Button(width/2, height/2 + 130, 350, 50, 150, "Play Again");
  backToMainMenuButton = new Button(width/2, height/2 + 200, 350, 50, 150, "Back To Main Menu");
  singleButton = new Button(width*2/6, height*1/4, 250, 50, 150, "Single Player");
  doubleButton = new Button(width*4/6, height*1/4, 250, 50, 150, "Two Players");
  // iq23062 update
  backgroundButton = new Button(width*2/6, height*1/8, 250, 50, 150, "Change BG");

  //Buttons to choose bird1's colour
  buttons1 = new Button[7];
  for (int i = 0; i < 7; i++) {
    if (i == 0) {
      buttons1[i] = new Button(width/2, 300, 20, 20, numGetColor(i), "");
    } else {
      buttons1[i] = new Button(buttons1[i-1].x+30, buttons1[i-1].y, buttons1[i-1].w,
        buttons1[i-1].h, numGetColor(i), "");
    }
  }
  //Buttons to choose bird2's colour
  buttons2 = new Button[7];
  for (int i = 0; i < 7; i++) {
    if (i == 0) {
      buttons2[i] = new Button(width/2, 350, 20, 20, numGetColor(i), "");
    } else {
      buttons2[i] = new Button(buttons2[i-1].x+30, buttons2[i-1].y, buttons2[i-1].w,
        buttons2[i-1].h, numGetColor(i), "");
    }
  }
}
