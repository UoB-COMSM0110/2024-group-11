class Coin{
  int x = width;
  int y;
  final int diameter = 50;
  
  Coin(){
    y = floor(random(50, height-50));
  }
  
  void move(int speed){
    x = x - speed;
  }
  
  void display(){
    image(loadImage("Coin/coin.png"), x, y);
  }
  
  
  
}
