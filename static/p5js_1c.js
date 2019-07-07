let angle = 45;

function setup(){
    createCanvas(400,400);
    angleMode(DEGREES);
}

function draw(){
    background(0);
  
  push();
    translate(50,50);
    rotate(angle);
    fill(255,100,50);
    rect(0,0,100,100);
  pop();
  
  push();
    translate(300,300);
    rotate(-angle * 3);
    fill(50,100,255);
    rect(0,0,100,50);
  pop();
  
    angle = angle  + 5;
}