class Bird {
  int x;
  int y;
  int fallSpeed;
  int jump;
  final int diameter = 50;
  int life;
  int invincibleTime;
  boolean isDead;
  boolean isInvincible;
  String colour;
  boolean isPlayer1;
  int score;
  final int fallTime = 70;
  final int rebornTime = 50;

  Bird(int isPlayer1) {
    x = width/10;
    y = height/4;
    fallSpeed = 1;
    jump = 0;
    life = 3;
    isDead = false;
    colour = "red";
    if (isPlayer1 == 1) {
      this.isPlayer1 = true;
    } else {
      this.isPlayer1 = false;
    }
    score = 0;
  }

  void display() {
    if (isDead) {
      return;
    }
    PImage shield = loadImage("Birds/"+ colour + ".png");
    if (isInvincible) {
      if (invincibleTime<fallTime&&invincibleTime>rebornTime) {
        shield = loadImage("Shield/invincible_shield1.png");
      } else if (invincibleTime>30) {
        shield = loadImage("Shield/invincible_shield2.png");
      } else if (invincibleTime>15) {
        shield = loadImage("Shield/invincible_shield3.png");
      } else {
        shield = loadImage("Shield/invincible_shield4.png");
      }
      invincibleTime--;
      if (invincibleTime<=0) {
        isInvincible = false;
      }
    }
    String picPath = "Birds/" + colour + ".png";
    if (!(invincibleTime > rebornTime)) {
      if (y<=-25) {
        y = y + height + 25;
      }
      if (y>=height + 25) {
        y =  0;
        y = y - height - 25;
      }
    }
    pushMatrix();
    translate(x, y);
    float angle;
    if (jump >= 15) {
      angle = -(jump * 1.2)/(jump*3);
    } else {
      angle =(fallSpeed - jump * 1.2)/30;
    }
    rotate(angle);
    image(loadImage("Birds/"+ colour + ".png"), 0, 0);
    popMatrix();
    if (isInvincible&&!(invincibleTime > fallTime)) {
      image(shield, x, y);
    }
    if (y>= height - 25 && !(invincibleTime > fallTime)) {
      pushMatrix();
      translate(x, height - y);
      image(loadImage("Birds/"+ colour + ".png"), 0, 0);
      rotate(angle);
      popMatrix();
      if (isInvincible&&!(invincibleTime > rebornTime)) {
        image(shield, x, height - y);
      }
    }
    if (y<=25 && !(invincibleTime > fallTime)) {
      pushMatrix();
      translate(x, height + y);
      image(loadImage(picPath), 0, 0);
      rotate(angle);
      popMatrix();
      if (isInvincible&&!(invincibleTime > rebornTime)) {
        image(shield, x, height + y);
      }
    }
  }

  void move() {
    if (isDead) {
      return ;
    }
    if (invincibleTime >110) {
      y -= 1;
      fallSpeed = 0;
      return;
    } else if (invincibleTime >fallTime) {
      y += fallSpeed;
      fallSpeed ++;
      return;
    } else if (invincibleTime > rebornTime) {
      y = height/4;
      fallSpeed = 0;
      return;
    }else {
    }
    if (isPlayer1 && spacePressed && jump == 0) {
      jump = 1;
      birdJumpSound.play();
      fallSpeed = 0;
    }
    if (!isPlayer1 && upPressed && jump == 0) {
      jump = 1;
      birdJumpSound.play();
      fallSpeed = 0;
    }

    //When the space key is pressed, the value of jump will be set to 1.
    //In the next 15 frames(0.5s), the bird will continue to rise and cannot jump again during this process.
    if (jump >= 1) {
      y -= (20-jump);
      jump += 2;
      if (jump > 20) {
        jump = 0;
      }
    } else {
      //If the player does not take any action, the bird will fall at an increasing speed
      y += fallSpeed;
      if (fallSpeed < 30) {
        fallSpeed ++;
      }
    }
  }

  void showScore() {
    fill(0);
    textSize(30);
    if (isPlayer1) {
      text("Player1 Score: " + score, 120, 30);
      text("Life: " + life, 300, 30);
    } else {
      text("Player2 Score: " + score, 120, 60);
      text("Life: " + life, 300, 60);
    }
  }

  void reduceLife() {
    life--;
    birdDieSound.play(); 
    if (life <= 0) {
      isDead = true;
    } else {
      makeInvincible();
    }
  }

  void makeInvincible() {
    invincibleTime = 120;
    isInvincible = true;
  }
}
