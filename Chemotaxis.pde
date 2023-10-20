void setup()   
{  
  size(600, 600);
  rectMode(CENTER);
  noStroke();
  frameRate(26);
  //initialize bacteria variables here 
  circles = new Bacteria[100];
  squares = new Virus[100];
  for (int i = 0; i<circles.length; i++) {
    circles[i] = new Bacteria();
    squares[i] = new Virus();
  }
}   
void draw()   
{    
  background(#A9C8E8);
  //move and show the bacteria  
  for (int i = 0; i<circles.length; i++) {
    circles[i].move();
    circles[i].show();
    squares[i].move();
    squares[i].show();
  }
  if (mouseButton == LEFT) {
    fill(255);
    ellipse(mouseX, mouseY, 15, 15);
    ellipse(mouseX, mouseY-7, 15, 15);
    ellipse(mouseX+7, mouseY, 15, 15);
    ellipse(mouseX-7, mouseY, 15, 15);
  } else {
    fill(#EAD393);
    ellipse(mouseX,mouseY,20,20);
  }
}  

class Bacteria    
{     
  int myX, myY, myColor1;
  Bacteria()
  {
    myX = (int)(Math.random()*600);
    myY = (int)(Math.random()*600);
    myColor1 = color(150);
  }
  void move()
  {
    if (mouseButton == LEFT) {
      if (mouseX > myX) {
        myX = myX + (int)(Math.random()*5)-1;
      } else if ( mouseX < myX) {
        myX = myX + (int)(Math.random()*5)-4;
      }
      if (mouseY > myY) {
        myY = myY + (int)(Math.random()*5)-1;
      } else if ( mouseY < myY) {
        myY = myY + (int)(Math.random()*5)-4;
      }
    } else {
      myX = myX + (int)(Math.random()*5)-2;
      myY = myY + (int)(Math.random()*5)-2;
    }
  }
  void show()
  {
    fill(myColor1);
    ellipse(myX, myY, 15, 15);
    ellipse(myX, myY-7, 15, 15);
    ellipse(myX+7, myY, 15, 15);
    ellipse(myX-7, myY, 15, 15);
  }
}    

class Virus    
{     
  int vX, vY, myColor2;
  Virus()
  {
    vX = (int)(Math.random()*600);
    vY = (int)(Math.random()*600);
    myColor2 = color(#FFE979);
  }
  void move()
  {
    if (mouseButton == LEFT) {
      vX = vX + (int)(Math.random()*5)-2;
      vY = vY + (int)(Math.random()*5)-2;
    } else {
      if (mouseX > vX) {
        vX = vX + (int)(Math.random()*5)-1;
      } else if ( mouseX < vX) {
        vX = vX + (int)(Math.random()*5)-4;
      }
      if (mouseY > vY) {
        vY = vY + (int)(Math.random()*5)-1;
      } else if ( mouseY < vY) {
        vY = vY + (int)(Math.random()*5)-4;
      }
    }
  }
  void show()
  {
    fill(myColor2);
    triangle(15+vX, 37+vY, 29+vX, 10+vY, 43+vX, 37+vY);
    triangle(15+vX, 18+vY, 42+vX, 18+vY, 29+vX, 46+vY);
  }
}    

