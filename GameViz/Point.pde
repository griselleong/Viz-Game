class Point{

 //one color for now, but this can be a parameter
 //passed for multiple colors in the future
 Player player;
 color c = color(255, 0, 0);
 float diameter = 8;
 float xLoc;
 float yLoc;

 Point(float x, float y, Player _player){
   xLoc = x;
   yLoc = y;
   player = _player;
 }

 boolean draw(){
   boolean x;
   x = itest();
   stroke(c);
   fill(c);
   ellipse(xLoc, yLoc, diameter, diameter);
   return x;
 }

 boolean itest(){
  if(mouseX > xLoc - diameter/2 && mouseX < xLoc + diameter/2 && mouseY > yLoc - diameter/2 && mouseY < yLoc + diameter/2){
    c = color(255, 95, 0);
    return true;
  }
  c = color(5, 125, 159);
  return false;
 }

}
