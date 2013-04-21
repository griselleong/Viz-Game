/** 
Generic Graph Class
Sets up labels and intervals
**/

class Graph{

    //total graph dimensions
     float totalXStart;
     float totalXEnd;
     float totalYStart;
     float totalYEnd;
     
     float totalHeight;
     float totalWidth;
     
     float graphGapWidth = 40;  //gap size of intervals in graph
     float labelWidth = 70; //width of label area of both axes
     float outerMargin = 30; //margin in top and right sides of graph
     
     //graph area only (without label area) dimensions
     float graphXStart;
     float graphXEnd;
     float graphYStart;
     float graphYEnd;
   
     float graphHeight;
     float graphWidth;
     
   Graph(float xStart, float xEnd, float yStart, float yEnd){
     //total graph dimensions
     totalXStart = xStart;
     totalXEnd   = xEnd;
     totalYStart = yStart;
     totalYEnd   = yEnd;
     
     totalHeight = yEnd - yStart;
     totalWidth  = xEnd - xStart;
     
     //graph area only (without label area) dimensions
     graphXStart = xStart + labelWidth;
     graphXEnd   = xEnd - outerMargin;
     graphYStart = yStart + outerMargin;
     graphYEnd   = yEnd - labelWidth;
   
     graphHeight = totalHeight - (labelWidth + outerMargin); 
     graphWidth =  totalWidth  - (labelWidth + outerMargin);
   }
   
   void draw(){
    stroke(0);
    
    //draw x-axis line
    line(graphXStart, graphYEnd, graphXEnd, graphYEnd);
   
   //draw y-axis line
    line(graphXStart, graphYStart, graphXStart, graphYEnd); 
     
   }
   
   void drawIntervals(){
          
   }
   
}
