class FishL extends Fish
{
  FishL(int x,int y)
  {
    super(x,y);
    fish=loadImage("fishL.png");
    fish.resize(w,h);
    fish1=loadImage("fishL1.png");
    fish1.resize(w,h);
    fish2=loadImage("fishL2.png");
    fish2.resize(w,h);
  }

}