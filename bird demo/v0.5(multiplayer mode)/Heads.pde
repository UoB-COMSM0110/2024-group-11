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

//Check if the key has been pressed
void keyPressed(){
  if(key == ' ' && bird1.jump == 0){
    bird1.jump = 1;
    bird1.fallSpeed = 0;
  }
  if(keyCode == UP && bird2.jump == 0 && isdouble){
    bird2.jump = 1;
    bird2.fallSpeed = 0;
  }
}

color stringGetColor(String name){
  int r, g, b;
  switch(name){
    case "red":
      r = 255;
      g = 0; 
      b = 0;
      break;
    case "orange":
      r = 255;
      g = 127; 
      b = 0;
      break;
    case "yellow":
      r = 255;
      g = 255; 
      b = 0;
      break;
    case "green":
      r = 0;
      g = 255; 
      b = 0;
      break;
    case "blue":
      r = 0;
      g = 0; 
      b = 255;
      break;
    case "indigo":
      r = 0;
      g = 255; 
      b = 255;
      break;
    case "violet":
      r = 148;
      g = 0; 
      b = 211;
      break;
    default:
      r = 255;
      g = 0; 
      b = 0;
      break;
  }
  return color(r, g, b);
}

color numGetColor(int num){
  int r, g, b;
  switch(num){
    case 0:
      r = 255;
      g = 0; 
      b = 0;
      break;
    case 1:
      r = 255;
      g = 127; 
      b = 0;
      break;
    case 2:
      r = 255;
      g = 255; 
      b = 0;
      break;
    case 3:
      r = 0;
      g = 255; 
      b = 0;
      break;
    case 4:
      r = 0;
      g = 0; 
      b = 255;
      break;
    case 5:
      r = 0;
      g = 255; 
      b = 255;
      break;
    case 6:
      r = 148;
      g = 0; 
      b = 211;
      break;
    default:
      r = 255;
      g = 0; 
      b = 0;
      break;
  }
  return color(r, g, b);
}

//Respond when the mouse is pressed
void mousePressed(){
  if(currentState == STATE_MAIN_MENU){
    if(startButton.isMouseOver()){
      reset();
      currentState = STATE_LEVEL;    
    }
    if(settingButton.isMouseOver()){
      currentState = STATE_SETTING_MENU;        
    }
  }
  
  if(currentState == STATE_SETTING_MENU){
    if(settingToMainButton.isMouseOver()){
      currentState = STATE_MAIN_MENU;        
    }
    for(int i = 0; i < 7; i++){
      if(buttons1[i].isMouseOver()){
        bird1.birdColour = numGetColor(i);
      }      
    }
    for(int i = 0; i < 7; i++){
      if(buttons2[i].isMouseOver()){
        bird2.birdColour = numGetColor(i);
      }      
    }    
    if(singleButton.isMouseOver()){
      isdouble = false;
    }
    if(doubleButton.isMouseOver()){
      isdouble = true;
    }
  }
  if(currentState == STATE_END){
    if(playAgainButton.isMouseOver()){
      reset();
      currentState = STATE_LEVEL;    
    }
    if(backToMainMenuButton.isMouseOver()){
      reset();
      currentState = STATE_MAIN_MENU;
    }
  }
}
