void setup(){
  size(1000, 600);
  frameRate(30);
  
  objSpeed = 4;
  score = 0;
  bestScore = 0;
  
  //Create an ArrayList to store Pipe objects.
  pipes = new ArrayList<Pipe>();
  
  //Create an ArrayList to store Coin objects. 
  coins = new ArrayList<Coin>();  
  
  //Create an instance of the Bird class named bird1.
  bird1 = new Bird();
  
  //Create instances of the Button class.
  startButton = new Button(width/2, height/2, 200, 50, 150, "START");
  playAgainButton = new Button(width/2, height/2 + 130, 350, 50, 150, "Play Again");
  backToMainMenuButton = new Button(width/2, height/2 + 200, 350, 50, 150, "Back To Main Menu");
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
  background(255);
  fill(255, 0, 0);
  textSize(40);
  text("GAME OVER", width/2, 100);
  fill(0);
  textSize(20);
  text("Your Score: " + score, width/2, 150);
  if(score > bestScore){
    bestScore = score;
  }
  text("Best Score: " + bestScore, width/2, 180);  
  playAgainButton.display();
  backToMainMenuButton.display();
}

//In game:
void drawLevel(){
  
  //The speed of object movement increases with the increase of score
  if(score <= 10){
    objSpeed = 4;
  } else if (score > 10 && score <=30){
    objSpeed = 5;
  } else if (score > 30 && score <=50){
    objSpeed = 6;
  } else if (score > 50 && score <=80){
    objSpeed = 7;
  } else {
    objSpeed = 8;
  }
  
  //Set the generation interval for objects. 
  //Default to generate every 320/4=80 frames.
  interval = 320 / objSpeed;
  
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
      score++;
    }
  }
  
  //add new pipes periodically
  //The interval between object generation will change 
  //with the speed of object movement.
  if (frameCount % interval == 0 || pipes.size() == 0) {
    pipes.add(new Pipe());
  }
  
  //Update all coins
  for(int i = coins.size() -1; i >= 1; i--){
    Coin coin = coins.get(i);
    coin.update();
    coin.display();
    if(coin.hits(bird1)){
      score += 5;
      coins.remove(coin);
    }
    //Remove pipe when it leaves the screen
    if(coin.offscreen()){
      coins.remove(coin);
    }
  }
  
  //add new coins randomly
  if ((frameCount-(interval/2)) % interval == 0) {
      //The probability of generating coins between every two pipes is 50%
      if(floor(random(0, 100)) <= 50){
        coins.add(new Coin());
      }
  }
  
   textSize(40);
   fill(0);
   text("Score: " + score, 80, 30); 
   
}

void reset (){
  //Reset bird and score
  bird1 = new Bird();
  score = 0;
  
  //Remove all pipes
  for(int i = pipes.size() -1; i >= 1; i--){
    Pipe pipe = pipes.get(i);
      pipes.remove(pipe);
  }
  for(int i = coins.size() -1; i >= 1; i--){
    Coin coin = coins.get(i);
      coins.remove(coin);
  }
}

//Respond when the mouse is pressed
void mousePressed(){
  if(startButton.isMouseOver() && currentState == STATE_MAIN_MENU){
    reset();
    currentState = STATE_LEVEL;
  }
  if(playAgainButton.isMouseOver() && currentState == STATE_END){
    reset();
    currentState = STATE_LEVEL;
  }  
  if(backToMainMenuButton.isMouseOver() && currentState == STATE_END){
    reset();
    currentState = STATE_MAIN_MENU;
  }
}
