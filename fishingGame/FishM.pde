class FishM extends Fish
{
  FishM(int x,int y)
  {
    super(x,y);
    fish=loadImage("fishM.png");
    fish.resize(w,h);
    fish1=loadImage("fishM1.png");
    fish1.resize(w,h);
    fish2=loadImage("fishM2.png");
    fish2.resize(w,h);
  }

}