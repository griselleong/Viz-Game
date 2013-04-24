/** 
 Generic Graph Class
 Sets up labels and intervals
 **/

class Graph {

  // keep track of what type
  boolean isCorrPlot;
  //total graph dimensions
  float totalXStart;
  float totalXEnd;
  float totalYStart;
  float totalYEnd;

  float totalHeight;
  float totalWidth;

  float graphGapWidth = 92;  //gap size of intervals in graph
  float labelWidth = width*.07; //width of label area of both axes
  float outerMargin = 30; //margin in top and right sides of graph

  //graph area only (without label area) dimensions
  float graphXStart;
  float graphXEnd;
  float graphYStart;
  float graphYEnd;

  float graphHeight;
  float graphWidth;
  float xS, yS, xE, yE;

  Graph(float xStart, float xEnd, float yStart, float yEnd, boolean _isCorrPlot) {
    //total graph dimensions
    isCorrPlot = _isCorrPlot;
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

    xS = xStart;
    yS = yStart;
    xE = xEnd;
    yE = yEnd;


    //graph area extended
    graphHeight = totalHeight - (labelWidth + outerMargin); 
    graphWidth =  totalWidth  - (labelWidth + outerMargin);
  }

  void draw() {
    stroke(0);

    fill(255);
    rect(xS, yS, xE-xS, yE-yS);

    fill(0);


/* correlation specific stuff moved to Correlation class
    if (isCorrPlot) {
      //draw x-axis line
      line(graphXStart, graphYEnd, graphXEnd, graphYEnd);

      //draw y-axis line
      line(graphXStart, graphYStart, graphXStart, graphYEnd);
    }
    */
  }

  void drawIntervals() {
  }
}

