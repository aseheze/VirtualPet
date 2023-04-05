/*
--------Project B: Virtual Creature--------

My virtual creature was inspired by a toy as well as a pet aquarium called 
"Sea Monkeys Ocean Zoo." The animals in this aquarium called "sea monkeys", inspired 
the appearance and functionality of my virtual creatures. Additionally, I coded the 
creatures as if they are your virtual pet, where you have to take care of them in the 
most simple way!

The size of the display window is 400x400 to better reflect the real aquarium since it 
is also small due to sea monkeys being pretty small. I also designed the background as 
if it is that aquarium, where I also coded the creatures to bump to the sides, giving 
the idea of a closed enclosure.

To talk about the creatures, they are designed to reflect the appearance of a sea monkey.
They move around the "aquarium" randomly, bumping to the sides; they reproduce every 7 
seconds and need attention every 10 seconds. When they need attention, they stop moving 
where a text appears to remind you of that. By clicking on the screen, you can resolve 
this issue!

P.S. I kept the span of their need for attention and reproduction as brief as possible 
to present their functions faster.

REFERENCES:
to learn how to bump to sides:
https://happycoding.io/tutorials/processing/animation

to learn how to use time:
http://learningprocessing.com/examples/chp10/example-10-05-OOP-Timer
https://www.youtube.com/watch?v=Mnjiqlupol8

to learn how to append arrays:
http://learningprocessing.com/examples/chp09/example-09-11-array-append
*/


//--------THE CODE--------

//VARIABLES
/*
I declare the class as array since there will be more creatures ,or in other words
virtual sea monkeys, due to reproduction. However, for now I determine the number of 
elements as one at the beginning, to use the append() code easily and emphasize the 
reproduction better by showing the increasing number of virtual sea monkeys.
*/
Pet [] cell= new Pet[1];

//the variables for the time of their reproduction function 
int newcell;
int startTime;
int endTime;

//the variables for the images used for design
PImage heart,back;


void setup(){
  size(400,400);
  noStroke();
  rectMode(CENTER);
  
  //For the heart shape at the cursor be at the center when mouse is pressed
  imageMode(CENTER);
  
  //I chose the cursor as hand for design purposes
  cursor(HAND);
  
  /*
  I am displaying the classes, or the elements of the array, by determining the values
  I attributed in the class Pet. I determined the location and the speed
  of the virtual sea monkeys as random to give a natural feeling of a living creature.
  */
  cell[0] = new Pet(random(width),random(height),random(1,3),random(1,3));
  
  /*
  These are the values for the times used for the function of the creatures. 
  The startTime variable creates the timing for the code, while newcell determines the
  span of their reproduction which is every 7 seconds (7000 millis=7 seconds).
  */
  newcell=7000;
  startTime=millis();
  
  heart = loadImage("heart.png");
  back = loadImage("back1.png");
  
//end of void setup
}


void draw(){
//background of the code
background(135,206,250);
image(back,200,200,400,400); 
 
 /*
 I activate the function of the class Pet's array.The for statement help me to not write
 all of the elements' function codes one by one as there will be unlimited amount of
 creatures.
 I wrote "i < cell.length" to display and activate the function of all creatures,
 no matter the length of the array since there are no limits for the number of elements
 due to the following append() code.
 */
 for (int i = 0; i < cell.length; i++ ){ 
    cell[i].display();
    cell[i].move();
  }
  
  /*
  I determined the value of endTime in void draw because I will need the time after
  the animation has started as the difference between startTime and endTime will help
  me to activate the reproduction of the creature.
  */
  println(endTime);
  endTime=millis();
  
  /*
  This is the part where I use append() code and the combination of the time variables
  to finally activate the creatures' reproduction.
  By writing "endTime-startTime>=newcell"and using the append code() I try to say that 
  when the specific time passed after the animation started is equal or bigger than 
  7 seconds, add a new element to the array.
  */
  if(endTime-startTime>=newcell){
   Pet newcell = new Pet(200,0,random(1,3),random(1,3));
    cell = (Pet[]) append(cell, newcell);
    //This part help me to restart the 7 seconds reproduction and 
    //to make ONE cell created every 7 seconds not many.
    startTime = endTime;
  }
  
  //This part is for the design when the mouse is pressed as heart shape represents
  //attention.
  if(mousePressed){
  image(heart,mouseX,mouseY,40,40); 
  }
  
//end of void draw
}
