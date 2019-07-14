//Author:  Matthew E. Miller
//Date:  7/14/2019
//Desc:  This is a snake game.  It's implemented using processing.js

Snake aSnake;
Food aFood;
int difficulty;

void setup(){
  //Sets Base Game Speed
  difficulty = 10;
  
  //Sets Arena Size
  size(500, 300);
  
  //Sets Max FrameRate
  frameRate(60);
  
  //Creates a new snake instance
  aSnake = new Snake();

  //Creates a new food instance
  aFood = new Food();
  
  //Sets rectangle draw mode
  rectMode(CENTER);
  
  //Sets text alignment
  textAlign(CENTER, CENTER);
}

void draw(){
  //This if statement controls the pace of the game
  if(frameCount % difficulty == 0){
    //Draw background
    background(50, 200, 50);
    
    //Draw score
    drawScore();
    
    //Conduct snake movement and display 
    aSnake.move();
    aSnake.display();
    
    //Display some snake-food
    aFood.display();
    
    //Snake eats some food
    if(dist(aFood.x, aFood.y, aSnake.x.get(0), aSnake.y.get(0)) < aSnake.sidelen){
      aFood.reset();
      aSnake.addLink();
    }
  }
}

//---------------------------- FOOD CLASS BEGIN -----------------------------------//
class Food{
  //Class variables
  float x, y;

  //Food Constructor
  Food(){
    x = random(100, width-100);
    y = random(100, height-100);
  }

  //Display Food
  void display(){   
    fill(250, 0, 0);
    ellipse(x, y, 20, 20);
  }

  //Place Food Somewhere Else
  void reset(){
    x = random(100, width-100);
    y = random(100, height-100);
  }   
}
//---------------------------- FOOD CLASS END -----------------------------------//

//---------------------------- SNAKE CLASS BEGIN -----------------------------------//
class Snake{
  //Class variables
  int len;
  float sidelen;
  String dir; 
  ArrayList <Float> x, y;
  
  //Snake Constructor
  Snake(){
    len = 1;
    sidelen = 20;
    dir = "right";
    x = new ArrayList();
    y = new ArrayList();
    x.add(random(width));
    y.add(random(height));
  }

  //Move Snake
  void move(){
   for(int i = len-1; i > 0; i = i-1 ){
    x.set(i, x.get(i-1));
    y.set(i, y.get(i-1));  
   } 
   if(dir == "left"){
     x.set(0, x.get(0) - sidelen);
   }
   if(dir == "right"){
     x.set(0, x.get(0) + sidelen);
   }
   if(dir == "up"){
     y.set(0, y.get(0) - sidelen);
   }
   if(dir == "down"){
     y.set(0, y.get(0) + sidelen);
   }

   x.set(0, (x.get(0) + width) % width);
   y.set(0, (y.get(0) + height) % height);
   
   //Check If Hit, Cut Tail
   if(checkHit() == true){
     len = 1;
     float xtmp = x.get(0);
     float ytmp = y.get(0);
     x.clear();
     y.clear();
     x.add(xtmp);
     y.add(ytmp);
     difficulty = 10;
   }
  }

  //Display Snake
  void display(){
    for(int i = 0; i < len; i++){
      stroke(0, 0, 0);
      fill(0, 0, 0, map(i-1, 0, len-1, 250, 50));
      rect(x.get(i), y.get(i), sidelen, sidelen);
    }  
  }

  //Add Snake Link
  void addLink(){
    x.add(x.get(len-1) + sidelen);
    y.add(y.get(len-1) + sidelen);
    len++;
    //Increase Difficulty, Snake Speed
    if(aSnake.len % 10 == 0  && difficulty > 2){
      difficulty -= 2;
    }
  }

  //Check For Collision
  boolean checkHit(){
    for(int i = 1; i < len; i++){
      if( dist(x.get(0), y.get(0), x.get(i), y.get(i)) < sidelen){
        return true;
      } 
    }
    return false;
  }
}
//---------------------------- SNAKE CLASS END -----------------------------------//

//Keyboard Interface
void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      aSnake.dir = "left";
    }
    if(keyCode == RIGHT){
      aSnake.dir = "right";
    }
    if(keyCode == UP){
      aSnake.dir = "up";
    }
    if(keyCode == DOWN){
      aSnake.dir = "down";
    }
  }
}

//Score Display
void drawScore(){
  //Draw Score
  fill(255,255,255);
  stroke(0,0,0);
  rect((width/2), 100, 150, 60);
  fill(0, 0, 0);
  textSize(30);
  text("Score: " + aSnake.len, width/2, 100);
}