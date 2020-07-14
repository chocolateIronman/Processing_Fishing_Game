//the background image and the start screen image are different
PImage backgroundImage;
PImage startScreen;

//all the components for the game:
Player p1;
Shark s1;
Bubbles b1;
Lives l1;
Hook h1;

//the rows and colums are numbers that cannot be changed 
final int cols=3;
final int rows=2;
FishS[][]f1=new FishS[cols][rows];
FishM[][]f2=new FishM[cols][rows];
FishL[][]f3=new FishL[cols][rows];

int Level=0;//level 0 is prior to the selected level
final int hScore=108;//the highest score cannot be changed as it has been calculated prior to writing the game code
int score=0;//score is a sum of score1 score2 and score3
int score1=0;
int score2=0;
int score3=0;
int resetHook=0;

final int Begin=0;//cannot be changed; references the splash screen
final int GameOn=1;//game on is when the player selects their level
final int GameOver=2;//game over is when the game is won or lost
int GameMode=Begin;

void setup()
{
  size(900,500);
  backgroundImage=loadImage("land.jpg");
  backgroundImage.resize(width,height);
  startScreen=loadImage("land2.png");
  startScreen.resize(width,height);
  
  p1=new Player(50,115);
  s1=new Shark(int(random(0,850)),450);
  b1=new Bubbles(int(random(0,700)),height);
  l1=new Lives();
  h1=new Hook(50,115);
  
  resetHook=h1.hy2;//used when reseting the hook
  score=0;
}
void fishSetup() //fish setup created for easily managable arrays of fishes
{
     for(int i=0;i<cols;i++)
  {
    for(int j=0;j<rows;j++)
    {
      f1[i][j]=new FishS(10+i*60,400+j*40);
    }
  }
  for(int k=0;k<cols;k++)
  {
    for(int l=0;l<rows;l++)
    {
      f2[k][l]=new FishM(200+k*60,350+l*40);
    }
  }
  for(int m=0;m<cols;m++)
  {
    for(int n=0;n<rows;n++)
    {
      f3[m][n]=new FishL(250+m*60,430+n*40);
    }
  }
}
void draw()
{
  if(GameMode==Begin) //drawing the splash screen
 { background(startScreen);}

 if(GameMode==GameOn) //starting the game 
{  if(Level==1 || Level==2)
{
  background(backgroundImage);
  
  textSize(32);
  fill(63,72,204);
  text("Score: "+score,700,80);
//rending all the objects as follows:  
  p1.render();
  h1.render();
  l1.render();
  
  s1.render();
    
  if(p1.eaten(s1)==true)//checking if the player is eaten by a shark(boolean can be found in the Player class)
    {
      s1=new Shark(int(random(0,850)),450);//creating a new shark at different possition 
      l1.count=l1.count-1;//decreasing the lives of the player
    }
    if(s1.move()==false)//checking the shark movemnt(boolean can be found in the Shark class)
      {
        s1=new Shark(int(random(0,850)),450);//creating a new shrak at different possition
      }
      else if (l1.count==0) //checking if the lives a 0
    {
      s1=new Shark(width,height);
      b1=new Bubbles(width,height);
      textSize(40);
      fill(63,72,204);
      text("YOU LOSE!",300,300);
      text("Press 'r' to play again",200,400);
      for(int i=0;i<cols;i++)
      {
        for(int j=0;j<rows;j++)
        {f1[i][j]=null;}
      }
      
      for(int k=0;k<cols;k++)
      {
        for(int l=0;l<rows;l++)
        {f2[k][l]=null;}
      }
      
      for(int m=0;m<cols;m++)
      {
        for(int n=0;n<rows;n++)
        {f3[m][n]=null;}
      }
      GameMode=GameOver;//end of game 
    }
    
    else if(score==hScore)//checking if the player's score is equal to the highest possible
    {
     
     textSize(40);
     text("YOU WIN!",300,300);
     text("Press 'r' to play again",200,400);
     s1=new Shark(width,height);
     b1=new Bubbles(width,height);
     GameMode=GameOver;//game over
    }
 //rending and moving the arrays of fishes   
    for(int i=0;i<cols;i++)
    {
      for(int j=0;j<rows;j++)
      {
        try{
            f1[i][j].render();
            f1[i][j].move();
            
            if(f1[i][j].caught(h1)==true)//checking if a fish is caught(boolean can be found in the Fish class)
            {
              f1[i][j]= null;//changing the value to the caught fish object to null
              h1.hy2=resetHook;//resetting the hook 
              score1+=3;//increasing the score
            }
           }
      catch(NullPointerException e){}//checking for null pointer exception
     }
    }
    
    for(int k=0;k<cols;k++)
    {
      for(int l=0;l<rows;l++)
      {
        try{
            f2[k][l].render();
            f2[k][l].move();
            
            if(f2[k][l].caught(h1)==true)
            {
              f2[k][l]= null;
              h1.hy2=resetHook;
              score2+=5;
            }
           }
      catch(NullPointerException e){}
     }
    }
    
   for(int m=0;m<cols;m++)
   {
    for(int n=0;n<rows;n++)
    {
      try{
            f3[m][n].render();
            f3[m][n].move();
            
            if(f3[m][n].caught(h1)==true)
            {
              f3[m][n]= null;
              h1.hy2=resetHook;
              score3+=10;
             }
          }
      catch(NullPointerException e){}
    }
  }
  score=score1+score2+score3;//summing up all the different scores
 }
 
 if(Level==2)
 {
    b1.render();//bubbles are drawn only if the player selects level 2
    
    if(p1.boom(b1)==true)//checking if the boat is hit by a bubble (boolean can be found in the Player class)
    {
      b1=new Bubbles(int(random(0,700)),450);//creating bubbles at random possition
      l1.count=l1.count-1;//decreasing player's lives
    }
    if(b1.move()==false)//checking the movement of bubbles (boolean can be found in the bubbles class)
      {
        b1=new Bubbles(int(random(0,700)),450);
      }
 }
}
}

void keyPressed()
{
  if(key==CODED)//checking if the keys are coded )pressed by the player)
  {
    if(keyCode==RIGHT && p1.x<width-p1.w) //situatiion when the player presses the right arrow
    {p1.x=p1.x+p1.dx;//moving the boat right
      h1.hx=p1.x;}//moving the hook accordingly to the boat to the right
    if(keyCode==LEFT && p1.x>0)//situation when the player presses the left arrow
    {p1.x=p1.x-p1.dx;//moving the boat left
      h1.hx=p1.x;}//moving the hook accordingly to the boat to the left
    if(keyCode==DOWN && h1.y<height)//situation when the player presses the down arrow
    {h1.hy2=h1.hy2+h1.dy;}//moving the hook downwards
    if(keyCode==UP && h1.hy2>h1.hy+h1.y)//situation when the player presses the up arrow
    {h1.hy2=h1.hy2-h1.dy;}//moving the hook upwards
  }
  
   if(GameMode==Begin)
   { 
     if(key=='1')
     {
      Level=1;
      GameMode=GameOn;
      fishSetup();
      score1=0;
      score2=0;
      score3=0;
      score=0;
      draw();
     }
     
     if(key=='2')
     {
      Level=2;
      GameMode=GameOn;
      fishSetup();
      score1=0;
      score2=0;
      score3=0;
      score=0;
      draw();
     }
   }
   
   if(key=='r' && GameMode==GameOver)//sitution when the player presses key r > resetting the game
   {
     p1=new Player(50,115);
     l1=new Lives();
     h1=new Hook(50,115);
     GameMode=Begin;
     draw();     
   }
}