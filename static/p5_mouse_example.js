let angle = 45;

function setup(){
    createCanvas(800,400);
}

function draw(){
    background(0);
    fill(255);
    //rotate(angle);
    //rect(50,50,100,50);
  
    translate(mouseX,mouseY);
    rect(0,0,100,100);
}