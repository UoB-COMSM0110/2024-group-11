class Bird{
  PVector location;
  int fallSpeed;
  int jump;
  int diameter;
  boolean isDead;
  
  Bird(){
    //initialize
    location = new PVector(width/10, height/4);
    fallSpeed = 1;
    jump = 0;
    diameter = 50;
    isDead = false;
  }

  //draw bird
  void display(){
    fill(255, 255, 0);//Bird's colour
    noStroke();
    ellipse(location.x, location.y, diameter, diameter);//Draw a circle as a bird
  }
  
  //Movement of bird
  void move(){
    //When the space key is pressed, the value of jump will be set to 1. 
    //In the next 15 frames(0.5s), the bird will continue to rise and cannot jump again during this process.
    if(jump >= 1){
      location.y -= (15-jump);
      jump ++;   
      //Stop rising when touching the ceiling
      if(location.y - diameter/2 <= 0){
        location.y = 0 + diameter/2;
        jump = 0;
      }
      if(jump > 15){
        jump = 0; 
      }
    }else { 
      //If the player does not take any action, the bird will fall at an increasing speed
      location.y += fallSpeed;
      if(fallSpeed < 30){
        fallSpeed ++;
      }
      //Prevent falling off the floor
      if(location.y + diameter/2 >= height){
        location.y = height - diameter/2;
      }
    }
  }
}