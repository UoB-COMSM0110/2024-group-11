class Pipe{
  int x = width;//Original x-value(On the far right side of the screen)
  int w = 40;//width of pipe
  int y;//The y-value of the centre of the pipe
  int h;//Pipe length
  int verticalSpeed;
  color pipeColour;

  Pipe(){
    //Randomly generate pipe positions and lengths within a certain range
    y = floor(random(0, height));
    h = floor(random(200,350));
    //If the center point of the pipeline is on the upper half of the screen, 
    //the initial direction of movement is down and vice versa
    if(y <= height / 2){
      verticalSpeed = 1;
    } else {
      verticalSpeed = -1;
    }
  }
  
  //Draw pipe
  void display(){
    fill(pipeColour);
    rect(x, y-h/2, w, h);
  }
  
  //Pipe move leftward
  void update(){

    x -= objSpeed;;
    
    //Starting to move up and down when the score is between 30 and 60, 
    //and doubling the movement speed when the score is greater than 60
    if(score > 30 && score <= 60 && (frameCount % 2 == 0)){
      y += verticalSpeed;
    } 
    if (score > 60){
      y += verticalSpeed;      
    }
  }
  
  //Collision detection between pipe and birds
  boolean hits(Bird bird){
    if((bird.location.x - bird.diameter/2 < this.x + this.w
    && bird.location.x + bird.diameter/2 > this.x)
    && (bird.location.y + bird.diameter/2 > this.y - h/2
    && bird.location.y - bird.diameter/2 < this.y + h/2)){
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
