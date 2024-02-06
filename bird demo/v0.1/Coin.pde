class Coin{
  int x = width;
  int y;
  int speed = 4;
  int diameter = 20;

  //Height of each coin is random
  Coin(){
    y = floor(random(10, height - 10));   
  }

  void display(){
    fill(255, 255, 0);
    ellipse(x, y, diameter, diameter);
  }

  void update(){
    x -= speed;
  }

  boolean hits(Bird bird){
    if((bird.location.x-bird.diameter/2 < this.x+ diameter/2
    && bird.location.x+bird.diameter/2 > this.x- diameter/2)
    && (bird.location.y+bird.diameter/2 > this.y - diameter/2
    && bird.location.y-bird.diameter/2 < this.y + diameter/2)){
      return true;
    } else{
      return false;
    }   
  }

  //Determine if the coin is out of screen range
  boolean offscreen(){
    return (x + diameter < 0);
  }

}
