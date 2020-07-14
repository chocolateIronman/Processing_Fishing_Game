class Bubbles extends Projectile
{
  PImage bubbles;
  int w=25;
  int h=25;
  
  Bubbles(int x, int y)
  {
    super(x,y);
    bubbles=loadImage("bubble.png");
    bubbles.resize(w,h);
  }
 
 @Override //overriding the method from class Projectile
  void render()
  {
    image(bubbles,x,y);
  }
  
private  boolean move() 
  {
    y=y-dy;
    return(y>=165+h);
  }
}