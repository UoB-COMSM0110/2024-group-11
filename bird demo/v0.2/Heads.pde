int score;
int bestScore;

final int STATE_MAIN_MENU = 0;    
final int STATE_SETTING_MENU = 1; 
final int STATE_LEVEL = 2;        
final int STATE_END = 3;          
int currentState = STATE_MAIN_MENU;

Bird bird1;

Button startButton;
Button playAgainButton;
Button backToMainMenuButton;

ArrayList<Pipe> pipes;
ArrayList<Coin> coins;

//Check if the key has been pressed
void keyPressed(){
  if(key == ' ' && bird1.jump == 0){
    bird1.jump = 1;
    bird1.fallSpeed = 0;
  }
}
