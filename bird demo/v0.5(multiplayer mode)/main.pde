void setup(){
  size(1000, 600);
  frameRate(30);
  
  objSpeed = 4;
  p1score = 0;
  p2score = 0;  
  bestScore = 0;
  isdouble = false;
  
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
  settingToMainButton = new Button(width/2, height*3/4 , 350, 50, 150, "Back To Main Menu");
  playAgainButton = new Button(width/2, height/2 + 130, 350, 50, 150, "Play Again");
  backToMainMenuButton = new Button(width/2, height/2 + 200, 350, 50, 150, "Back To Main Menu");
  singleButton = new Button(width*2/6, height*1/4 , 250, 50, 150, "Single Player");
  doubleButton = new Button(width*4/6, height*1/4 , 250, 50, 150, "Two Players");
  
  //Buttons to choose bird1's colour
  buttons1 = new Button[7];
  for(int i = 0; i < 7; i++){
    if(i == 0){
      buttons1[i] = new Button(width/2, 300, 20, 20, numGetColor(i), "");    
    } else {
      buttons1[i] = new Button(buttons1[i-1].x+30, buttons1[i-1].y, buttons1[i-1].w, 
      buttons1[i-1].h, numGetColor(i), "");       
    }
  }
  //Buttons to choose bird2's colour  
  buttons2 = new Button[7];
  for(int i = 0; i < 7; i++){
    if(i == 0){
      buttons2[i] = new Button(width/2, 350, 20, 20, numGetColor(i), "");    
    } else {
      buttons2[i] = new Button(buttons2[i-1].x+30, buttons2[i-1].y, buttons2[i-1].w, 
      buttons2[i-1].h, numGetColor(i), "");       
    }
  }

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
  settingButton.display();
}

//Setting menu display
void drawSettingMenu(){
  background(255);

  singleButton.display();
  doubleButton.display();
  settingToMainButton.display();
  for(int i = 0; i < 7; i++){
    fill(0);
    text("Player 1", width/2-200, 300);
    fill(bird1.birdColour);
    ellipse(width/2 - 80, 300, 40, 40);
    buttons1[i].display();
    if(isdouble){
      buttons2[i].display(); 
      fill(0);
      text("Player 2", width/2-200, 350); 
      fill(bird2.birdColour);
      ellipse(width/2 - 80, 350, 40, 40);
    }  
  }
}

//End menu display
void drawEnd(){
  background(255);
  fill(255, 0, 0);
  textSize(40);
  text("GAME OVER", width/2, 100);
  fill(0);
  textSize(20);
  if(!isdouble){
    text("Your Score: " + p1score, width/2, 150);
    if(p1score > bestScore){
      bestScore = p1score;
    }
    text("Best Score: " + bestScore, width/2, 180);    
  } else {
    text("Player1 Score: " + p1score, width/2, 150);  
    text("Player2 Score: " + p2score, width/2, 180); 
    if(p1score > bestScore){
      bestScore = p1score;
    }
    if(p2score > bestScore){
      bestScore = p2score;
    } 
    text("Best Score: " + bestScore, width/2, 210); 
  }

  playAgainButton.display();
  backToMainMenuButton.display();
}

//In game:
void drawLevel(){
  
  //The speed of object movement increases with the increase of score
  if(p1score <= 10 && p2score <= 10){
    objSpeed = 4;
  } else if (p1score <=30 && p2score <= 30){
    objSpeed = 5;
  } else if (p1score <=50 && p2score <=50){
    objSpeed = 6;
  } else if (p1score <=80 && p2score <=80){
    objSpeed = 7;
  } else {
    objSpeed = 8;
  }
  
  //Set the generation interval for objects. 
  //Default to generate every 320/4=80 frames.
  interval = 320 / objSpeed;
  
  //Switch to end menu when bird is dead
  if(bird1.isDead && isdouble == false){
    currentState = STATE_END;
  }
  if(bird1.isDead && bird2.isDead &&isdouble){
    currentState = STATE_END;  
  }
  background(255);
  
  if(bird1.isDead == false){
    bird1.display();
    bird1.move();  
  }
  if(isdouble && bird2.isDead == false){
    bird2.display();
    bird2.move();  
  }

  //Update all pipes
  for(int i = pipes1.size() -1; i >= 1; i--){
    Pipe pipe = pipes1.get(i);
    pipe.update();
    pipe.display();
      if(pipe.hits(bird2) && (pipe.pipeColour == bird2.birdColour)){
        bird2.isDead = true;
      } 
      if(pipe.hits(bird1) && (pipe.pipeColour == bird1.birdColour)){
        bird1.isDead = true;
      }

    //Remove pipe when it leaves the screen
  if(pipe.offscreen()){
      pipes1.remove(pipe);
      if(!bird1.isDead){
        p1score++;        
      }
    }
  }  
 
  if(isdouble){
    for(int i = pipes2.size() -1; i >= 1; i--){
      Pipe pipee = pipes2.get(i);
      pipee.update();
      pipee.display();
      if(pipee.hits(bird2) && (pipee.pipeColour == bird2.birdColour)){
        bird2.isDead = true;
      } 
      if(pipee.hits(bird1) && (pipee.pipeColour == bird1.birdColour)){
        bird1.isDead = true;
      }     
      if(pipee.offscreen()){
        pipes2.remove(pipee);
        if(!bird2.isDead){
          p2score++;        
        }

      }
    }   
  }

  //add new pipes periodically
  //The interval between object generation will change 
  //with the speed of object movement.
  if (frameCount % interval == 0 || pipes1.size() == 0) {
    Pipe newPipe = new Pipe();
    pipes1.add(newPipe);
    newPipe.pipeColour = bird1.birdColour;
  }
  
  if (((frameCount+20) % interval == 0 || pipes2.size() == 0) && isdouble) {
    Pipe newPipee = new Pipe();
    pipes2.add(newPipee);
    newPipee.pipeColour = bird2.birdColour;
  }
  
  //Update all coins
  for(int i = coins.size() -1; i >= 1; i--){
    Coin coin = coins.get(i);
    coin.update();
    coin.display();
    if(coin.hits(bird1) && !bird1.isDead){
      p1score += 5;
      coins.remove(coin);
    }
    if(coin.hits(bird2) && !bird2.isDead){
      p2score += 5;
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
  
  textSize(30);
  fill(0);
  text("P1 Score: " + p1score, 100, 30); 
  if(isdouble){
  text("P2 Score: " + p2score, 100, 60);    
  }
}

void reset (){
  //Reset bird and score
  bird1.location = new PVector(width/10, height/4);
  bird1.isDead = false;
  bird1.fallSpeed = 1;
  bird1.jump = 0;
  p1score = 0;
  if(isdouble){
  bird2.location = new PVector(width/10, height/4);
  bird2.isDead = false;
  bird2.fallSpeed = 1;
  bird2.jump = 0;
  p2score = 0;  
  }
  
  //Remove all pipes and coins
  for(int i = pipes1.size() -1; i >= 1; i--){
    Pipe pipe = pipes1.get(i);
    pipes1.remove(pipe);
  }
  if(isdouble){  
    for(int i = pipes2.size() -1; i >= 1; i--){
      Pipe pipe = pipes2.get(i);
      pipes2.remove(pipe);    
    }
  }
  

  for(int i = coins.size() -1; i >= 1; i--){
    Coin coin = coins.get(i);
      coins.remove(coin);
  }
}
