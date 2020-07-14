class Lives
{
  PImage heart;
  int x=50;
  int y=50;
  int w=32;
  int h=32;
  int count=4;
  
  Lives()
  {
    heart=loadImage("heart.png");
    heart.resize(w,h);
  }
  
private  void render()
  {
    switch(count)//switch case depending on the count and drawing correspondingly the hearts
    {
      case 4: image(heart,x+2*w,y);
              image(heart,x+w,y);
              image(heart,x,y);
      break;
      case 3:image(heart,x+w,y);
             image(heart,x,y);
      break;
      case 2:image(heart,x,y);
      break;
      case 1:
      break;
    }
  }
}