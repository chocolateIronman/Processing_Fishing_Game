class Player
{
  PImage boat;
  int x;
  int y;
  int dx;
  int w=150;
  int h=90;
  
  Player(int x, int y)
  {
    this.x=x;
    this.y=y;
    dx=10;
    boat=loadImage("boat.png");
    boat.resize(w,h);
  }
  
private  void render()
  {
    image(boat,x,y);
  }
  
private  boolean eaten(Shark shark)//distance checking between the boat and the shark
  {
    if(x+w>shark.x && x<shark.x+shark.w && 
       y+h>shark.y && y<shark.y+shark.h)
      {
        return true;
      }
     return false; 
  }
  
private  boolean boom(Bubbles bubble)//distance checking between the boat and the bubbles
  {
    if(x+w>bubble.x && x<bubble.x+bubble.w && 
       y+h>bubble.y && y<bubble.y+bubble.h)
      {
        return true;
      }
     return false; 
  }
}