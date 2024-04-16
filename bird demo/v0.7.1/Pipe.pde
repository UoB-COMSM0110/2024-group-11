class Pipe {
  int x = width;//Original x-value(On the far right side of the screen)
  final int w = 20;//width of pipe
  int y;//The y-value of the centre of the pipe
  int h;//Pipe length
  int verticalSpeed;
  String colour;

  Pipe() {
    //Randomly generate pipe positions within a certain range
    y = floor(random(0, height));
    //For the convenience of drawing art resources, the length of the pipe is set to a random number in 200, 250, 300 and 350
    h = int(random(4)) * 50 + 200;
    //If the center point of the pipeline is on the upper half of the screen,
    //the initial direction of movement is down and vice versa
    if (y <= height / 2) {
      verticalSpeed = 1;
    } else {
      verticalSpeed = -1;
    }
  }

  void display() {
    image(loadImage("Pipes/"+ colour + "_pipe_" + h + ".png"), x, y);
  }

  void horizontalMove(int speed) {
    x = x - speed;
  }

  void verticalMove() {
    y = y + verticalSpeed;
  }
  
  void setColour(String colour){
  this.colour = colour;
  }
}
