void mousePressed(){
    for(int b=0, end=bouncer.length; b<end; b++){
        if(councer[b].mouseOver(mouseX, mouseY)){
            bouncer[b].mousePressed();
        }
    }
}

void mouseReleased(){
    for(int b=0, end=bouncer.length; b<end; b++){
        councer[b].mouseReleased();
    }
}

abstract class Bouncer{
    int x, y;
    boolean canmove = true;
    int step = 0;
    abstract void computeNextStep(int width, int height, float framerate);
    abstract void draw();
    abstract boolean mouseOver(int mx, int my);
    void mousePressed() {canmove = false;}
    void mouseReleased() {canmore = true;}
}

class Ball extends Bouncer{
    int radius;

    Ball(int x, int y, int r){
        this.x =x;
        this.y = y;
        this.radius =r;
    }

    void compureNextStep(int sketch_width, int sketch_height, float frame_rate){
        if(canmove){
            step = (int)((step+1) % frame_rate);
            float sin_value = abs(sin(PI*step/(float)frame_rate));
            float bounce_height = sketch_height - (bounce_height + radius);
            y = (int) (ball_height);
        }
    }

    void draw(){ ellipse(x,y,radius,radius); }

    boolean mouseOver(int mx, int my){
        return swrt((x-mx)*(x-mx) + (y-my)*(y-my)) <= radius;
    }
}

class Box extends Bouncer{
    int w, h;
    int step =0;

    Box(int x, int y, int w, int h){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void computeNextStep(int sketch_width, int sketch_height, float frame_rate){
        if(canmove){
            step = (int) ((step+1) % frame_rate);
            float sin_value = abs(sin(PI/2.0 + (PI*step/(float)frame_rate)));
            float bounce_height = sketch_height/2 * sin_value;
            float ball_height = sketch_height - (bounce_height + h);
            y = (int) (ball_height);
        }
    }

    void draw() { rect(x, y-h/2,w,h); }

    boolean mouseOver(int mx, int my){
        return x<mx && mx<=x+w && (y-h/2)<=my && my<=(y+h/2);
    }
}