class Eagle {
  int timer;
  final int inix = width - 100;
  final int iniy = 100;
  int x;
  int y;
  final int diameter = 100;
  PImage pic;
  boolean isCatchBird1;
  boolean isLocated;
  final float xMoveSpeed = -100;
  float yMoveSpeed;
  final float rotationAngle = TWO_PI / 30;
  float currentAngle;

  Eagle() {
    timer = 0;
    currentAngle = 0;
    pic = loadImage("Eagle/eagle.png");
    isCatchBird1 = true;
    isLocated = false;
    x = inix;
    y = iniy;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(currentAngle);
    image(pic, 0, 0);
    popMatrix();
  }

  void move() {
    int outScreeny = -100;
    if (timer == 0) {
      x = inix;
      y = outScreeny;
    } else if (timer < 50) {
      y = y+4;
      timer++;
    } else if (timer < 80) {
      if (!isLocated) {
        if (isCatchBird1&&!level.bird1.isDead) {
          this.yMoveSpeed = (level.bird1.y - y) / 10;
        } else if (!isCatchBird1&&!level.bird2.isDead&&level.isTwoPlayers) {
          this.yMoveSpeed = (level.bird2.y - y) / 10;
        } else if (!level.bird1.isDead) {
          this.yMoveSpeed = (level.bird1.y - y) / 10;
        } else if (!level.bird2.isDead&&level.isTwoPlayers) {
          this.yMoveSpeed = (level.bird2.y - y) / 10;
        } else {
          timer = 0;
          return;
        }
        eagleSound.play();
        isLocated = true;
      }
      currentAngle += rotationAngle;
      timer++;
    } else if (timer < 180) {
      x += xMoveSpeed;
      y += yMoveSpeed;
      if ((!level.bird1.isDead)&&BirdEagleCollision(level.bird1, this)) {
        birdhitPipeSound.play();
        level.bird1.reduceLife();
      }
      if ((!level.bird2.isDead)&&BirdEagleCollision(level.bird2, this)&&level.isTwoPlayers) {
        birdhitPipeSound.play();
        level.bird2.reduceLife();
      }
      timer++;
    } else {
      isCatchBird1 = !isCatchBird1;
      currentAngle = 0;
      isLocated = false;
      timer = 0;
    }
  }
}
