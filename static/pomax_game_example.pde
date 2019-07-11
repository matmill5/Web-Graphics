Bouncer[] bouncer = new Bouncer[100];
 
  void setup() {
    size(200,200);
    frameRate(24);
    stroke(#003300);
    fill(#0000FF);
    bouncer[0] = new Ball(0,20,20);
    int grabCount = 0;
    int grabMax = 1;
  }

  void draw() {
    if(grabMax == 99){
        grabMax = 1;
    }
    if(grabCount == grabMax){
        bouncer[grabMax] = new Ball(0,20,20);
        grabMax++;
    }
    for(int b=0, end=grabMax; b<end;b++) {
      bouncer[b].computeNextStep(width, height, frameRate);
    }
    background(#FFFFEE);
    for(int b=0, end=grabMax; b<end;b++) {
      bouncer[b].draw();
    }
  }

  void mousePressed() {
   for(int b=0, end=grabMax; b<end;b++) {
      if(bouncer[b].mouseOver(mouseX, mouseY)) {
        bouncer[b].mousePressed();
      }
    }
  }
 
  void mouseReleased() {
    for(int b=0, end=grabMax; b<end;b++) {
      bouncer[b].mouseReleased();
    }
  }

   abstract class Bouncer
   {
     int x, y;
     boolean canmove = true;
     int step = 0;
     abstract void computeNextStep(int width, int height, float framerate);
     abstract void draw();
     abstract boolean mouseOver(int mx, int my);
     void mousePressed() { canmove = false; grabCount++; }
     void mouseReleased() { canmove = true; grabCount--; }
   }

class Ball extends Bouncer
{
    int x,y,radius;
    int step = 0;

    Ball(int x, int y, int r) {
      this.x = x;
      this.y = y;
      this.radius = r;
    }

    void computeNextStep(int sketch_width, int sketch_height, float frame_rate) {
      if (canmove) {
        step++;
        float sin_value = abs(sin(PI*step/(float)frame_rate));
        float bounce_height = sketch_height/2 * sin_value;
        float ball_height = sketch_height - (bounce_height + radius);
        y = (int) (ball_height);
      }
    }

    void draw() {
      ellipse(x,y,radius,radius);
    }

    boolean mouseOver(int mx, int my) {
      return sqrt((x-mx)*(x-mx) + (y-my)*(y-my)) <= radius;
    }   
}

class Box extends Bouncer
{
    int x,y,w,h;
    int step=0;

    Box(int x, int y, int w, int h) {
      this.x = x;
      this.y = y;
      this.w = w;
      this.h = h;
    }

    void computeNextStep(int sketch_width, int sketch_height, float frame_rate) {
      if (canmove) {
        step++;
        float sin_value = abs(sin(PI/2.0 + (PI*step/(float)frame_rate)));
        float bounce_height = sketch_height/2 * sin_value;
        float ball_height = sketch_height - (bounce_height + h);
        y = (int) (ball_height);
      }
    }
    
    void draw() { 
      rect(x,y-h/2,w,h);
    }
 
    boolean mouseOver(int mx, int my) {
      return x<=mx && mx<=x+w && (y-h/2)<=my && my<=(y+h/2);
    }
}