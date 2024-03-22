class Button {
  //Coordinates of the top left corner, Width, Height
  int x;
  int y;
  int w;
  int h;
  //Image of button
  String path;
  String colour;
  int size;

  //Constructor for button object, receiving location, size type, and image information
  Button(int x, int y, int size, String path) {
    this.x = x;
    this.y = y;
    this.path = path;
    this.size = size;
    switch (size) {
    case 1:
      this.w = 200;
      this.h = 50;
      break;
    case 2:
      this.w = 250;
      this.h = 50;
      break;
    case 3:
      this.w = 350;
      this.h = 50;
      break;
    case 4:
      this.w = 30;
      this.h = 30;
      break;
    default :
      System.out.println("ERROR, button size not match!");
      break;
    }
  }

  void display() {
    imageMode(CENTER);
    if (isMouseOver()) {
      image(loadImage("Buttons/" + path + ".png"), x, y, w*1.25, h*1.25);
    } else {
      image(loadImage("Buttons/" + path + ".png"), x, y);
    }
  }

  boolean isClicked(int mouseX, int mouseY) {
    boolean result = mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2;
    if(result){buttonClickSound.play();}
    return result;
    
  }

  //Check if the mouse hovers over the button
  boolean isMouseOver() {
    return mouseX > x-w/2 && mouseX < x+w/2 &&
      mouseY > y-h/2 && mouseY < y+h/2;
  }
}
