public class Fish //main fish class
{
  PImage fish;
  PImage fish1;
  PImage fish2;
  int x;
  int y;
  int dx=1;
  int dy=1;
  int w=54;
  int h=29;
  int count=0;
  
  Fish(int x,int y)
  {
    this.x=x;
    this.y=y;
  }
  
  void render()
  {
    if(count<5) //sequence of images so the fishes appear animated
    {image(fish1,x,y);}
    else if(count<10)
    {image(fish,x,y);}
    else if(count<15)
    {image(fish2,x,y);}
    else if(count<20)
    {image(fish,x,y);}
    else{count=0;}
    count++;
  }
  
  void move()
  {
    if(x<10)
    {
     dx=-dx;
     y=y-h;
    }
    else if(x>width-2*w)
    {
      dx=-dx;
      y=y-h;
    }
     x+=dx;
  }
  
  boolean caught(Hook hook)
  {
    if(x+w>hook.x && x<hook.x+hook.hx && 
       y+h>hook.hy2 && y<hook.hy2)
      {
        return true;
      }
     return false; 
  }
}