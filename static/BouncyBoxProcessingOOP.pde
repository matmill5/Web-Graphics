void setup(){

    counter = new Box(width/2,20,20,20);
}

class Box implements Bouncer{
    int x,y,w,h;

    int step=0;

    Box(int x, int y, int w, int h){
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
    }

    void computeNextStep(int sketch_width, int sketch_height, float frame_rate){
        step++;
        float sin_value =  abs(sin(PI/2 + (PI * step/(float)frame_rate));
        float bounce_height = sketch_height/2 * sin_value;
        float ball_height = sketch_height - (counce_height + h);
        y = (int) (ball_height);
    }

    void draw(){
        rect(x,y,w,h);
    }

}