class Pipe{
  int x = width;//Original x-value(On the far right side of the screen)
  int w = 40;//width of pipe
  int speed = 4;//Move speed of pipe
  int y;//The y-value of the centre of the pipe
  int h;//Pipe length

  Pipe(){
    //Randomly generate pipe positions and lengths within a certain range
    y = floor(random(0, height));
    h = floor(random(200,350));
  }
  
  //Draw pipe
  void display(){
    fill(0);
    rect(x, y-h/2, w, h);
  }
  
  //Pipe move leftward
  void update(){
    x -= speed;
  }
  
  //Collision detection between pipe and birds
  boolean hits(Bird bird){
    if((bird.location.x-bird.diameter/2 < this.x+this.w
    && bird.location.x+bird.diameter/2 > this.x)
    && (bird.location.y+bird.diameter/2 > this.y - h/2
    && bird.location.y-bird.diameter/2 < this.y + h/2)){
      return true;
    } else{
      return false;
    }   
  }

  //Determine if the pipe is out of screen range
  boolean offscreen(){
    return (x + w < 0);
  }

}
