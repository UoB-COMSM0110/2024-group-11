void setup(){
  size(1000, 600);
  frameRate(30);
  
  //Create an ArrayList to store Pipe objects.
  pipes = new ArrayList<Pipe>();
  
  //Create an instance of the Bird class named bird1.
  bird1 = new Bird();
  
  //Create instances of the Button class.
  startButton = new Button(width/2, height/2, 200, 100, 150, "START");
  playAgainButton = new Button(width/2, height/2, 200, 100, 150, "Play Again");
  backToMainMenuButton = new Button(width/2, height/2 + 200, 400, 100, 150, "Back To Main Menu");
}

void draw(){
  //Switch between different interfaces based on the value of currentState.
  switch (currentState){
    case STATE_MAIN_MENU:
      drawMainMenu();
      break;
    case STATE_SETTING_MENU:
      drawSettingMenu();    
      break;
    case STATE_LEVEL:
      drawLevel();    
      break;
    case STATE_END:
      drawEnd();    
      break;     
  }
}

//Main menu display
void drawMainMenu(){
  background(255);
  startButton.display();
}

//Setting menue display
void drawSettingMenu(){
  background(255);
}

//End menu display
void drawEnd(){
  reset();
  background(255);
  fill(0, 100, 100);
  textSize(40);
  text("GAME OVER", width/2, 100);
  playAgainButton.display();
  backToMainMenuButton.display();
}

//In game:
void drawLevel(){
  //Switch to end menu when bird is dead
  if(bird1.isDead){
    currentState = STATE_END;
  }
  background(255);
  bird1.display();
  bird1.move();
  
  //Update all pipes
  for(int i = pipes.size() -1; i >= 1; i--){
    Pipe pipe = pipes.get(i);
    pipe.update();
    pipe.display();
    if(pipe.hits(bird1)){
      bird1.isDead = true;
    }
    //Remove pipe when it leaves the screen
    if(pipe.offscreen()){
      pipes.remove(pipe);
    }
  }
  
  //add new pipes periodically
  if (frameCount % 60 == 0 || pipes.size() == 0) {
    pipes.add(new Pipe());
  }
  
}

void reset (){
  //Reset bird
  bird1 = new Bird();
  
  //Remove all pipes
  for(int i = pipes.size() -1; i >= 1; i--){
    Pipe pipe = pipes.get(i);
      pipes.remove(pipe);
  }
}

//Respond when the mouse is pressed
void mousePressed(){
  if(startButton.isMouseOver() && currentState == STATE_MAIN_MENU){
    currentState = STATE_LEVEL;
  }
  if(playAgainButton.isMouseOver() && currentState == STATE_END){
    currentState = STATE_LEVEL;
  }  
  if(backToMainMenuButton.isMouseOver() && currentState == STATE_END){
    currentState = STATE_MAIN_MENU;
  }
}
