// in game.txt
void drawLevel() {
  // Replace the existing drawLevel() function with the updated one
  //The speed of object movement increases with the increase of score
  if (p1score <= 3 && p2score <= 3) {
    objSpeed = 4;
  } else if (p1score <= 5 && p2score <= 5) { // New score milestone added
    objSpeed = int(4.8); // 20% increase from previous speed, typecast to int
    // Change: Added new score milestone at 5, increasing objSpeed by 20%
  } else if (p1score <= 7 && p2score <= 7) { // New score milestone added
    objSpeed = int(5.76); // 20% increase from previous speed, typecast to int
    // Change: Added new score milestone at 7, increasing objSpeed by 20%
  } else if (p1score <= 10 && p2score <= 10) {
    objSpeed = int(6.912); // 20% increase from previous speed, typecast to int
    // Change: At score of 10, increasing objSpeed by 20%
  } else if (p1score <= 30 && p2score <= 30) {
    objSpeed = int(8.2944); // 20% increase from previous speed, typecast to int
    // Change: At score of 30, increasing objSpeed by 20%
  } else if (p1score <= 50 && p2score <= 50) {
    objSpeed = int(9.9532); // 20% increase from previous speed, typecast to int
    // Change: At score of 50, increasing objSpeed by 20%
  } else {
    objSpeed = int(11.9438); // 20% increase from previous speed, typecast to int
    // Change: After score of 50, increasing objSpeed by 20%
  }
  
  //increment per frame
  gameframeCount++;
  
  //Set the generation interval for objects.
  //Default to generate every 320/4=80 frames.
  interval = 320 / objSpeed;

  //Switch to end menu when bird is dead
  if (bird1.isDead && isdouble == false) {
    currentState = STATE_END;
  }
  if (bird1.isDead && bird2.isDead &&isdouble) {
    currentState = STATE_END;
  }
  // iq23062 update
  background(bgimg);

  if (bird1.invincibleTime < 90) {
    bird1.invincibleTime++;
  } else {
    bird1.isInvincible = false;
  }

  if (isdouble && bird2.invincibleTime < 90) {
    bird2.invincibleTime++;
  } else {
    bird2.isInvincible = false;
  }

  if (bird1.isDead == false) {
    if (bird1.isInvincible) {
      bird1.invincibleDisplay();
    } else {
      bird1.display();
    }
    bird1.move();
  }
  if (isdouble && bird2.isDead == false) {
    if (bird2.isInvincible) {
      bird2.invincibleDisplay();
    } else {
      bird2.display();
    }
    bird2.move();
  }

  //Update all pipes
  for (int i = pipes1.size() -1; i >= 1; i--) {
    Pipe pipe = pipes1.get(i);
    pipe.update();
    pipe.display();

    if (pipe.hits(bird1) && !bird1.isInvincible && !bird1.isDead) {
      bird1.life--;
      if (bird1.life > 0) {
        bird1.rebirth();
      } else {
        bird1.isDead = true;
      }
    }

    if (pipe.hits(bird2) && (pipe.pipeColour == bird2.birdColour) && !bird2.isInvincible && !bird2.isDead) {
      bird2.life--;
      if (bird2.life > 0) {
        bird2.rebirth();
      } else {
        bird2.isDead = true;
      }
    }

    //Remove pipe when it leaves the screen
    if (pipe.offscreen()) {
      pipes1.remove(pipe);
      if (!bird1.isDead) {
        p1score++;
      }
    }
  }

  if (isdouble) {
    for (int i = pipes2.size() -1; i >= 1; i--) {
      Pipe pipee = pipes2.get(i);
      pipee.update();
      pipee.display();
      if (pipee.hits(bird2) && !bird2.isInvincible && !bird2.isDead) {
        bird2.life--;
        if (bird2.life > 0) {
          bird2.rebirth();
        } else {
          bird2.isDead = true;
        }
      }
      
      if (pipee.hits(bird1) && (pipee.pipeColour == bird1.birdColour) && !bird1.isInvincible && !bird1.isDead) {
        bird1.life--;
        if (bird1.life > 0) {
          bird1.rebirth();
        } else {
          bird1.isDead = true;
        }
      }
      
      
      if (pipee.offscreen()) {
        pipes2.remove(pipee);
        if (!bird2.isDead) {
          p2score++;
        }
      }
    }
  }

  //add new pipes periodically
  //The interval between object generation will change
  //with the speed of object movement.
  if (gameframeCount % interval == 0 || pipes1.size() <= 1 ) {
    Pipe newPipe = new Pipe();
    pipes1.add(newPipe);
    newPipe.pipeColour = bird1.birdColour;
  }

  if (((gameframeCount - 20) % interval == 0 || (pipes2.size() <= 1 && gameframeCount > 20)) && isdouble) {
    Pipe newPipee = new Pipe();
    pipes2.add(newPipee);
    newPipee.pipeColour = bird2.birdColour;
  }

  //Update all coins
  for (int i = coins.size() -1; i >= 1; i--) {
    Coin coin = coins.get(i);
    coin.update();
    coin.display();
    if (coin.hits(bird1) && !bird1.isDead) {
      p1score += 5;
      coins.remove(coin);
    }
    if (coin.hits(bird2) && !bird2.isDead && isdouble) {
      p2score += 5;
      coins.remove(coin);
    }
    //Remove pipe when it leaves the screen
    if (coin.offscreen()) {
      coins.remove(coin);
    }
  }

  //add new coins randomly
  if ((gameframeCount - (interval/2)) % interval == 0) {
    //The probability of generating coins between every two pipes is 50%
    if (floor(random(0, 100)) <= 50) {
      coins.add(new Coin());
    }
  }

  textSize(30);
  fill(0);
  text("P1 Score: " + p1score, 100, 30);
  text("P1 Life: " + bird1.life, 250, 30);
  if (isdouble) {
    text("P2 Score: " + p2score, 100, 60);
    text("P2 Life: " + bird2.life, 250, 60);
  }
}
