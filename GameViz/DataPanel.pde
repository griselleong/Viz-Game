
class DataPanel {


  float startX, startY;
  boolean isPie;

  //correlation graph hover info
  ArrayList<Point> hoveredPs; 

  //legend info
  String [] moves;
  color [] colors;

  String xopt, yopt;
  int m;
  boolean pointsSet;

  public DataPanel (String _x, String _y) {
    hoveredPs = new ArrayList<Point>();
    pointsSet = false;
    xopt = _x;
    yopt = _y;
    //missionnum = 0;
  }


  public void setIsPie(boolean _isPie) {
    this.isPie = _isPie;
  }

  public void setColors(color [] _colors) {
    colors = _colors;
  }

  public void setMoves(String [] _moves) {
    moves = _moves;
  }

  public void updateOpts(String _x, String _y, int num) {
    xopt = _x;
    yopt = _y;
    this.m = num;
  }

  //    dataPanel.setHoveredPlayers(hovered);
  public void setHoveredPoints(ArrayList<Point> _hoveredPs) {
    hoveredPs = _hoveredPs;
    pointsSet = true;
  }

  public void drawPanel() {
    fill(255);
    stroke(0);
    if (this.isPie) {
      textAlign(LEFT, CENTER);
      rect(width*.75, height*.1, width*.23, height*.52);
      fill(0);
      text("LEGEND", width*.77, height*.13);

      float currHeight = height*0.16;

      for (int i = 0; i < moves.length; i++) {
        //text
        textAlign(LEFT, CENTER);
        stroke(0);
        fill(0);
        text(moves[i], width*.77, currHeight);

        //color boxes
        fill(colors[i]);
        rect(width*0.83, currHeight, 25, 12);

        currHeight += 28;
      }
    } 
    else {
      textAlign(LEFT, CENTER);
      rect(width*.75, height*.1, width*.23, height*.52);
      fill(0);
      text("Number of Moves per Player", width*.77, height*.13);

      if (pointsSet) {
        fill(0);
        for (int i=0; i<hoveredPs.size(); i++) {
          if(i < 15){
          fill(255, 95, 0);          
          text("Player " + hoveredPs.get(i).player.getId(), width*.76, height*.2 + i*20); 
          fill(0);
          text( xopt + ":" + hoveredPs.get(i).player.getCountForMove(xopt, this.m) + "   " + yopt+":" + hoveredPs.get(i).player.getCountForMove(yopt, this.m), width*.86, height*.2 + i*20);
          }
          if(i == 15){
           text("Plus " + str(hoveredPs.size()-15) + " others not shown", width*.76, height*.2 + i*20); 

          }
        }
      }
    }
  }
}

