/**
Correlation Graph Class
Inherits from generic Graph Class
**/

class Correlation extends Graph{
  
 //data 
 //precondition: xData and yData have the same length
 float [] xData;
 float [] yData;
 
 //max range of x and y data to be plotted
 float xRange;
 float yRange; 
  
 float xInterval;           //x axis label gap size
 float yInterval;         //y axis label gap size
 
 Correlation(float [] x, float [] y, float xStart, float xEnd, float yStart, float yEnd){
   super(xStart, xEnd, yStart, yEnd);
   xData = x;
   yData = y;
        
   //add 1 to the range so that max data points are not at the edges
   xRange = max(xData) + 1;
   yRange = max(yData) + 1;
   
   xInterval = xRange/graphGapWidth;
   yInterval = yRange/graphGapWidth;
 
 }
 
 //mapping function from x-value to x-coordinate in screen
 float mapXPos(float x){
   return graphXStart + graphWidth * (x / xRange);  
 }
 
 float mapYPos(float y){
   //subtraction from height of graph because graph (0, 0) is 
   //at top left corner but correlation graph (0, 0) is at 
   //bottom left corner
   return graphYStart + graphHeight - (graphHeight * (y / yRange));
 }
 
 void plot(){
   super.draw();
   for (int i = 0; i < xData.length; i++){
     float xLoc = mapXPos(xData[i]);
     float yLoc = mapYPos(yData[i]);
     Point p = new Point(xLoc, yLoc);
     p.draw();
   } 
 }

}


