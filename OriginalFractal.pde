public void setup() {
  size(800,800);
  frameRate(60);
}

public void draw() {
  background(255);
  myFractal(200,250,300,350);
}
  
public void myFractal(int x, int y, int siz, int t) {
pushMatrix();
 translate(width*0.5, height*0.5);
 rotate(frameCount*0.40);
 star(x, y, x+30, siz*3, siz*3); 
 popMatrix();
 strokeWeight(1);
 fill((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
 if (siz > 100) {
   myFractal(x - siz/3, y, siz/2,t);
 }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
