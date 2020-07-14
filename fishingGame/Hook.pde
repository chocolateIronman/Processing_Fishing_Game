class Hook extends Player
{
  
  int dy;
  int hy;
  int hy2;
  int hx;
  
  Hook(int x,int y)
  {
    super(x,y);
    dy=15;
    hy=y+10;//115+10=125
    hy2=y+110;
    hx=x+dy;
  }
  
  void render()
  {
    line(hx,hy,hx,hy2);//225
  }
  
}