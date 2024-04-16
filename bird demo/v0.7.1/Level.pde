public class Level {
  Bird bird1;
  Bird bird2;
  Eagle eagle;
  int inGameFrameCounter;
  int objSpeed;
  int interval;
  String bird1Colour;
  String bird2Colour;
  int bestScore;


  ArrayList<Pipe> pipes1;
  ArrayList<Pipe> pipes2;
  ArrayList<Coin> coins;
  boolean isDifficult;
  boolean isTwoPlayers;


  public Level() {
    inGameFrameCounter = 0;
    bestScore = 0;
    bird1 = new Bird(1);
    bird2 = new Bird(2);
    eagle = new Eagle();
    bird1Colour = "red";
    bird2Colour = "orange";
    pipes1 = new ArrayList<Pipe>();
    pipes2 = new ArrayList<Pipe>();
    coins = new ArrayList<Coin>();
    isTwoPlayers = false;
    isDifficult = false;
  }

  void display() {
    showInstructions();
    inGameFrameCounter++;
    //Single player display:
    bird1.display();
    bird1.move();
    bird1.showScore();
    //The second player display:
    if (isTwoPlayers) {
      bird2.display();
      bird2.move();
      bird2.showScore();
    }
    showHint();
    update();
    eagle.display();
    if (keyPressed && (key == 'q' || key == 'Q')) {
      currentBGM.stop();
      currentBGM = menuBGM;
      currentBGM.loop();
      currentUI = MainMenuState;
    }
    if ((bird1.isDead && !isTwoPlayers) || (bird1.isDead && bird2.isDead && isTwoPlayers)) {
      this.bestScore = max(bestScore, max(bird1.score, bird2.score));
      currentUI = GameOverMenuState;
    }
  }

  void update() {
    int pipesVerticalMoveTrigger = 7;
    changeSpeed();
    if (isTwoPlayers&&bird1.colour == bird2.colour) {
      interval = 600/objSpeed;
    } else if (isTwoPlayers) {
      interval = 375/objSpeed;
    } else {
      interval = 300/objSpeed;
    }

    if (inGameFrameCounter % 300 == 0 && objSpeed>= 10) {
      eagle.timer = 1;
    }
    eagle.move();

    if (inGameFrameCounter == 1 || inGameFrameCounter % interval == 0) {
      Pipe newPipe = new Pipe();
      newPipe.colour = bird1.colour;
      pipes1.add(newPipe);
    }
    for (int i = pipes1.size() -1; i >= 1; i--) {
      pipes1.get(i).display();
      pipes1.get(i).horizontalMove(objSpeed);
      if (objSpeed >=pipesVerticalMoveTrigger) {
        pipes1.get(i).verticalMove();
      }
      if (!bird1.isDead&&BirdPipeCollision(bird1, pipes1.get(i))) {
        birdhitPipeSound.play();
        bird1.reduceLife();
      }
      if (!bird2.isDead&&isTwoPlayers&&bird1.colour == bird2.colour&&BirdPipeCollision(bird2, pipes1.get(i))) {
        birdhitPipeSound.play();
        bird2.reduceLife();
      }
      if ( pipes1.get(i).x < 0) {
        pipes1.remove(i);
        if (!bird1.isDead) {
          bird1.score++;
        }
        i--;
      }
    }
    if (isTwoPlayers) {
      if (inGameFrameCounter == 1+interval*2/3 || (inGameFrameCounter-interval*2/3) % interval == 0) {
        Pipe newPipe = new Pipe();
        newPipe.setColour(bird2.colour);
        pipes2.add(newPipe);
      }
      for (int i = pipes2.size() -1; i >= 1; i--) {
        pipes2.get(i).display();
        pipes2.get(i).horizontalMove(objSpeed);
        if (objSpeed >=pipesVerticalMoveTrigger) {
          pipes2.get(i).verticalMove();
        }
        if (!bird2.isDead&&BirdPipeCollision(bird2, pipes2.get(i))) {
          birdhitPipeSound.play();
          bird2.reduceLife();
        }
        if (!bird1.isDead&&bird1.colour == bird2.colour&&BirdPipeCollision(bird1, pipes2.get(i))) {
          birdhitPipeSound.play();
          bird1.reduceLife();
        }
        if ( pipes2.get(i).x < 0) {
          pipes2.remove(i);
          if (!bird2.isDead) {
            bird2.score++;
          }
          i--;
        }
      }
    }
    if (floor(random(0, 3))==1 && (inGameFrameCounter-interval/3) % interval == 0) {
      coins.add(new Coin());
    }
    for (int i = coins.size() -1; i >= 1; i--) {
      coins.get(i).display();
      coins.get(i).move(objSpeed);
      if (!bird1.isDead&&BirdCoinCollision(bird1, coins.get(i))) {
        birdHitCoinSound.play();
        bird1.score = bird1.score + 5;
        coins.remove(i);
        i--;
      }
      if (!bird2.isDead&&isTwoPlayers&&BirdCoinCollision(bird2, coins.get(i))) {
        birdHitCoinSound.play();
        bird2.score = bird2.score + 5;
        coins.remove(i);
        i--;
      }
      if (coins.get(i).x < 0) {
        coins.remove(i);
        i--;
      }
    }
  }



  void reset() {
    inGameFrameCounter = 0;
    bird1 = new Bird(1);
    bird2 = new Bird(2);
    eagle = new Eagle();
    bird1.colour = bird1Colour;
    bird2.colour = bird2Colour;
    pipes1 = new ArrayList<Pipe>();
    pipes2 = new ArrayList<Pipe>();
    coins = new ArrayList<Coin>();
    objSpeed = 5;
    if (isDifficult) {
      bird1.life = 1;
      bird2.life = 1;
    } else {
      bird1.life = 3;
      bird2.life = 3;
    }
  }

  void changeSpeed() {
    int difficultSpeed = 0;
    if (isDifficult) {
      difficultSpeed = 4;
    }
    int biggerScore = max(bird1.score, bird2.score);
    if (biggerScore <= 15) {
      objSpeed = 6 + difficultSpeed;
    } else if (15 <biggerScore && biggerScore <= 30) {
      objSpeed = 7 + difficultSpeed;
    } else if (30 <biggerScore && biggerScore <= 50) {
      objSpeed = 8 + difficultSpeed;
    } else if (50 <biggerScore) {
      objSpeed = 10 + difficultSpeed;
    }
  }

  void showHint() {
    if (inGameFrameCounter < 120) {
      fill(0);
      textSize(20);
      text("Press [SPACE] to jump", bird1.x, bird1.y - 50);
      if (isTwoPlayers) {
        text("Press [UP] to jump", bird2.x, bird2.y - 50);
      }
    } else if (inGameFrameCounter < 240) {
      text("Avoid same colour PIPES!", width/2 + 200, height/2);
    }
  }

  void showInstructions(){
    fill(255);  
    noStroke(); 
    rect(0, height - 30, 180, 20);  
    fill(0); 
    textSize(20);
    text("[P]: pause / [Q]: quit", 90, height - 20);
  }
}
