int p1score;
int p2score;
int bestScore;
//Object movement speed
int objSpeed;
//Object generation interval
int interval;
//true for 2 players, false for 1 player.
boolean isdouble;

final int STATE_MAIN_MENU = 0;
final int STATE_SETTING_MENU = 1;
final int STATE_LEVEL = 2;
final int STATE_END = 3;
int currentState = STATE_MAIN_MENU;

Bird bird1;
Bird bird2;

Button startButton;
Button playAgainButton;
Button backToMainMenuButton;
Button settingButton;
Button settingToMainButton;
Button singleButton;
Button doubleButton;
Button[] buttons1;
Button[] buttons2;

ArrayList<Pipe> pipes1;
ArrayList<Pipe> pipes2;
ArrayList<Coin> coins;

void reset () {
  //Reset bird and score
  bird1.location = new PVector(width/10, height/4);
  bird1.isDead = false;
  bird1.fallSpeed = 1;
  bird1.jump = 0;
  p1score = 0;
  bird1.life = 3;
  if (isdouble) {
    bird2.location = new PVector(width/10, height/4);
    bird2.isDead = false;
    bird2.fallSpeed = 1;
    bird2.jump = 0;
    p2score = 0;
    bird2.life = 3;
  }

  //Remove all pipes and coins
  for (int i = pipes1.size() -1; i >= 1; i--) {
    Pipe pipe = pipes1.get(i);
    pipes1.remove(pipe);
  }
  if (isdouble) {
    for (int i = pipes2.size() -1; i >= 1; i--) {
      Pipe pipe = pipes2.get(i);
      pipes2.remove(pipe);
    }
  }

  for (int i = coins.size() -1; i >= 1; i--) {
    Coin coin = coins.get(i);
    coins.remove(coin);
  }
}
