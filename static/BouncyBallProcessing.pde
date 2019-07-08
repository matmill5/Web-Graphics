float framerate = 24; // our "sketch" will have a framerate of 24 frames per second.
 
int ball_x; //Admins the ball's location
int ball_y; //Admins the ball's location
int ball_radius = 20; //Admins the ball's size

void setup(){
    size(200,200);  //Sets up the draw area size
    frameRate(framerate); //Sets the animation framerate
    ball_x = width/2; //Set the initial ball x-coordinate
    ball_y = ball_radius; //Set the initial ball y-coordinate
    stroke(#00330); //Set the default shape outline color
    fill(#0000FF); //Sets the default shape fill color
}

void draw(){
    float bounce_height = height/2 * abs(sin(PI*frameCount/framerate)); //Computes the bounce height as a function of the frame

    float ball_height = height - (bounce_height+ball_radius); //Computes the ball's height based on the height, bounceheight and ball-radi

    background(#FFFFEE); //Clears the drawing area

    ball_y = (int) (ball_height); //Sets the new ball y-position

    ellipse(ball_x, ball_y, ball_radius, ball_radius); //Draws the ball
}