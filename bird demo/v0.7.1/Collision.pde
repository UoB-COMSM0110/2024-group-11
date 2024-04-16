public static boolean BirdPipeCollision(Bird bird, Pipe pipe) {
  if (bird.isDead|| bird.isInvincible) {
    return false;
  }
  int birdX = bird.x;
  int birdY = bird.y;
  int diameter = bird.diameter;
  int pipeX = pipe.x;
  int pipeY = pipe.y;
  int pipeW = pipe.w;
  int pipeH = pipe.h;
  int windowHeight = 600;
  float nearestX = max(pipeX - pipeW / 2, min(birdX, pipeX + pipeW / 2));
  float nearestY = max(pipeY - pipeH / 2, min(birdY, pipeY + pipeH / 2));
  float distX = birdX - nearestX;
  float distY = birdY - nearestY;
  float distance = sqrt((distX * distX) + (distY * distY));
  if (birdY<diameter/2) {
    float nearestY2 = max(pipeY - pipeH / 2, min(birdY + windowHeight, pipeY + pipeH / 2));
    float distY2 = birdY + windowHeight - nearestY2;
    float distance2 = sqrt((distX * distX) + (distY2 * distY2));
    return distance < diameter/2 || distance2 < diameter/2;
  }
  if (birdY>windowHeight - diameter/2) {
    float nearestY3 = max(pipeY - pipeH / 2, min(birdY - windowHeight, pipeY + pipeH / 2));
    float distY3 = birdY - windowHeight - nearestY3;
    float distance3 = sqrt((distX * distX) + (distY3 * distY3));
    return distance < diameter/2 || distance3 < diameter/2;
  }
  return distance < diameter/2;
}

public static boolean BirdCoinCollision(Bird bird, Coin coin) {
  if(bird.invincibleTime > 70){
  return false;
  }
  return (bird.diameter / 2 + coin.diameter / 2) > sqrt((bird.x-coin.x) * (bird.x-coin.x) + (bird.y - coin.y) * (bird.y - coin.y));
}

public static boolean BirdEagleCollision(Bird bird, Eagle eagle) {
  if(bird.isInvincible){
  return false;
  }
  return (bird.diameter / 2 + eagle.diameter / 2) > sqrt((bird.x-eagle.x) * (bird.x-eagle.x) + (bird.y - eagle.y) * (bird.y - eagle.y));
}
