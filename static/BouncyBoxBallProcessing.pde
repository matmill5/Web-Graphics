Bouncer[] bouncer = new Bouncer[3];

void setup(){
    bouncer[0] =  new Ball(width/3-20,20,20);
    bouncer[1] =  new Box(width/2-20,20,20);
    bouncer[2] =  new Ball((2*width/3)+20,20,20);
}

void draw(){
    for(int b=0, end=bouncer.length; b<end; b++){
        bouncer[b].compureNextStep(width, height, frameRate);
    }
    background(#FFFFEE);
    for(int b=0; end=bouncer.length; b<end; b++){
        bouncer[b].draw();
    }
}