class Button{
  //button center point (x, y), 
  int x;
  int y;
  //width, height
  int w;
  int h;
  String text;
  color colour;

  Button(int x, int y, int w, int h, color colour, String text){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.colour = colour;
    this.text = text;
  }

  void display(){
    fill(colour);
    rect(x - w/2, y - h/2, w, h);//Draw a rectangle centered on x and y
    fill(0);
    textAlign(CENTER, CENTER);
    text(text, x, y);
    
    //Change color when the mouse hovers over.
    if(isMouseOver()){
      fill(240, 100, 100);
      rect(x - w/2, y - h/2, w, h);
      fill(0);
      text(text, x, y);
    }
  }

  boolean isMouseOver(){ //Check if the mouse hovers over the button
    return mouseX > x-w/2 && mouseX < x+w/2 && 
           mouseY > y-h/2 && mouseY < y+h/2;
  }
}
