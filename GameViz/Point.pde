class Point{
  
 //one color for now, but this can be a parameter
 //passed for multiple colors in the future
 color c = color(255, 0, 0);
 float diameter = 6;
 float xLoc;
 float yLoc;
 
 Point(float x, float y){
   xLoc = x;
   yLoc = y; 
 }
 
 void draw(){
   stroke(c);
   fill(c);
   ellipse(xLoc, yLoc, diameter, diameter);
 }
}
