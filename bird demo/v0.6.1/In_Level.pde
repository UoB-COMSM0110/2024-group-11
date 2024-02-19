//In game:
void drawLevel() {

  //The speed of object movement increases with the increase of score
  if (p1score <= 10 && p2score <= 10) {
    objSpeed = 4;
  } else if (p1score <=30 && p2score <= 30) {
    objSpeed = 5;
  } else if (p1score <=50 && p2score <=50) {
    objSpeed = 6;
  } else if (p1score <=80 && p2score <=80) {
    objSpeed = 7;
  } else {
    objSpeed = 8;
  }

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
  background(255);

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

    if (pipe.hits(bird1) && (pipe.pipeColour == bird1.birdColour) && !bird1.isInvincible && !bird1.isDead) {
      bird1.life--;
      if (bird1.life > 0) {
        bird1.rebirth();
      } else {
        bird1.isDead = true;
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
      if (pipee.hits(bird2) && (pipee.pipeColour == bird2.birdColour) && !bird2.isInvincible && !bird2.isDead) {
        bird2.life--;
        if (bird2.life > 0) {
          bird2.rebirth();
        } else {
          bird2.isDead = true;
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
  if ((frameCount-(interval/2)) % interval == 0) {
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
