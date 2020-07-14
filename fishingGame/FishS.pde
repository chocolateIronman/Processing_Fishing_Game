class FishS extends Fish
{
  FishS(int x,int y)
  {
    super(x,y);
    fish=loadImage("fishS.png");
    fish.resize(w,h);
    fish1=loadImage("fishS1.png");
    fish1.resize(w,h);
    fish2=loadImage("fishS2.png");
    fish2.resize(w,h);
  }

}