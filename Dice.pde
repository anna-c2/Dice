Die bob;
int dots;
int totalDots;
String message = "";
String pinkMsg = "";
String blackMsg = "";
int dotSize = 15;
int dieSize = 90;

boolean pinkDot;
boolean pinkBg;
boolean shift = false;

int pinkDotSum;

void setup()
  {
      size(670,670);
      noLoop();
     // dice1 = new Die(10,10);
  }
  void draw()
  {
      //your code here
      background(0);
      int start;
      int num = (int)((Math.random()*3)+3);
      for(int j = 0; j < num; j++){
        for(int i = 0; i < num; i++){
           
          if(i==0){
            if(shift==false){
                start = 0;
                shift = true;                
              }
             else{
                start = 55;
                shift = false;
              }
          }
          else{
            if(shift==true)
              start = i*110;
            else
              start = (i*110)+55;
          }
                     
            bob = new Die(start,j*110);
            bob.roll();
            bob.show();
           
        }
      }
      totalDotsSum();
     
  }
  void mousePressed()
  {
      redraw();
      totalDots = 0;
      pinkDotSum = 0;
      message = "";
  }
  class Die //models one single dice cube
  {
      //member variable declarations here
      int myX, myY;
      Die(int x, int y) //constructor
      {
          //variable initializations here
         
            myX = x;
            myY = y;
      }
      void roll()
      {
          //your code here
          dots = (int)(Math.random()*6+1);                    
      }
      void show()
      {
          //your code here
          int ranNum = (int)(Math.random()*10);
          if(ranNum >= 5){
            pinkDot = true;
            pinkBg = false;
          }
          else{
            pinkDot = false;
            pinkBg = true;
          }
         
         
          if(pinkBg == true){
            fill(#FA79BA);
          }else{
            fill(0);
          }
          stroke(255);
          strokeWeight(2);
          rect(myX, myY, dieSize, dieSize);  
         
          noStroke();
          if(pinkDot == true){
            fill(#FA79BA);
          }else{
            fill(0);
          }
          if(dots==1){
            oneDot();
            totalDots=totalDots+1;
            if(pinkDot == true)
              pinkDotSum+=1;            
          }
          else if (dots==2){
            twoDots();
            totalDots=totalDots+2;
            if(pinkDot == true)
              pinkDotSum+=2;
          }
          else if(dots==3){
            oneDot();
            twoDots();
            totalDots=totalDots+3;
            if(pinkDot == true)
              pinkDotSum+=3;
          }
          else if(dots==4){
            cornerDots();
            twoDots();
            totalDots=totalDots+4;
            if(pinkDot == true)
              pinkDotSum+=4;
          }
          else if(dots==5){
            oneDot();
            twoDots();
            cornerDots();
            totalDots=totalDots+5;
            if(pinkDot == true)
              pinkDotSum+=5;
          }
          else if(dots==6){
            twoDots();
            cornerDots();
            ellipse(myX+20,myY+45,dotSize,dotSize);
            ellipse(myX+70,myY+45,dotSize,dotSize);
            totalDots=totalDots+6;
            if(pinkDot == true)
              pinkDotSum+=6;
          }
                   
      }
     
      void oneDot(){
            ellipse(myX+45,myY+45,dotSize,dotSize);
      }
      void twoDots(){
            ellipse(myX+70,myY+20,dotSize,dotSize);
            ellipse(myX+20,myY+70,dotSize,dotSize);
      }
      void cornerDots(){
        ellipse(myX+20,myY+20,dotSize,dotSize);
        ellipse(myX+70,myY+70,dotSize,dotSize);
      }
     
  }
  void totalDotsSum(){
         System.out.println(totalDots);
          println(pinkDotSum);
         
          message = "Total Number of Dots: " + totalDots;
          pinkMsg = "Number of Pink Dots: " + pinkDotSum;
          blackMsg = "Number of Black Dots: " + (totalDots-pinkDotSum);
          
         
          fill(255);
          textSize(35);
          text(message, 190, 590);
          textSize(20);
          text(pinkMsg, 200, 620);
          text(blackMsg, 200, 640);
         
      }
 
  
