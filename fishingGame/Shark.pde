class Shark extends Projectile
{
  PImage shark;
  int w=55;
  int h=120;
  
  Shark(int x, int y)
  {
    super(x,y);
    shark=loadImage("shark.jpg");
    shark.resize(w,h);
  }

  @Override //overriding the method from class Projectile
  void render()
  {
    image(shark,x,y);
  }
  
private  boolean move()
  {
    y=y-dy;
    return(y>=80+h);
  }
}