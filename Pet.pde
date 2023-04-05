/*
This is the class of the virtual sea monkeys or creatures.
Below it can be seen how the creatures' appearance, movement, and other functions, like 
the need for attention, are coded.
*/

class Pet{
  //THE DATA
  //variables for the location of the creatures.
  float x;
  float y;
  
  //variables for their speed and movement.
  float movex;
  float movey;
  
  //variable set to stop or continue the movement of the creatures.
  boolean move;
  
  //variables for the span of the function of their need for attention.
  int life;
  int startTime;
  int endTime;
  
  //variable set for alerting their need for attention.
  String text= "Your sea monkey needs attention!";
  PFont font;
  
  
  //THE CONSTRUCTOR
  /*
  This is how some specific variables will be attributed for all of the 
  creatures by just one code. In order the variables that will be attributed for the 
  creatures' code is, x-y location and its speed according to the x-y axis.
  
  However, there are some more variables that is not seen in this code. This is because
  I realized that while coding the function of the class, this part is actually similar 
  to void setup in terms of activating the codes, while other voids in this class is 
  similar to void draw. Therefore, to activate/declare some variables, I wrote them here.
  */
  Pet(float x1, float y1, float movex1,float movey1){
  //the values for the code "Pet"
  x=x1;
  y=y1;
  movex=movex1;
  movey=movey1;
  
  //the value for the function's activeness
  move=true;
  
  /* 
  The startTime variable creates the timing for the code (same as the variable at
  "zimmermann" tab), while life determines the span of their attention need which is 
  every 10 seconds (10000 millis=10 seconds).
  */
  life=10000;
  startTime=millis();
  
  font = loadFont("LoRes12OT-Bold-20.vlw");
  }
  
  
  void display(){
  //head of the virtual sea monkey
  fill(225,153,128);
  ellipse(x,y,15.5231,15.5231);
  
  //eyes of the virtual sea monkey
  fill(0);
  ellipse(x-8.26,y-2.51,3.8487,3.8487);
  ellipse(x+8.22,y-2.51,3.8487,3.8487);
  }
  
  
  void move(){
  //the explanation for endTime is same as the endTime variable in the "zimmermann" tab
  endTime=millis();
  
    /*
    These if statements below determines the overall movement of the creatures such as
    moving around and bumping to the sides.
    The boolean variable called move is set as true as it allows the creatures to move
    until the varible turns to false.
    */
    if(move==true){
      println(endTime);
      x=x+movex;
      y=y+movey;
      
     //to bump to the left or right sides
      if(x<0 || x>width){
      movex=movex*-1;
      }
      //to bump to the sides above and below 
      if(y>height || y<0){
      movey=movey*-1;
      }
    }
    
    /*
    Again the use of the variables of time is just the same as the way I used in the
    "zimmermann" tab. However, the thing it causes is different as this statement makes
    the creatures stop moving after 10 seconds without clicking which happens by boolean
    move variable turning to false.
    */
    if(endTime-startTime>=life){
    move=false;
    //to make this action happen permanently until the mouse is pressed
    startTime=millis();
    }
    
    //this part is to create notification for attention when the creatures stop
    if(move==false){
     fill(255);
     textAlign(CENTER, BOTTOM);
     textFont(font, 16);
     textSize(16);
     text(text,200,30);
    }
    
    /*
    this part enables the creatures to continue to move after the mouse is pressed, 
    which allows the boolean move false to turn true.
    */
    if(mousePressed){
    move=true;
    endTime=millis();
    }
    
 //end of void move 
 }
  
//end of class Pet
}
