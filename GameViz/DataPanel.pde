
class DataPanel {


  float startX, startY;
  boolean isPie;

  //correlation graph hover info
  ArrayList<Point> hoveredPs; 

  //legend info
  String [] moves;
  color [] colors;

  String xopt, yopt;
  boolean pointsSet;

  public DataPanel (String _x, String _y) {
    hoveredPs = new ArrayList<Point>();
    pointsSet = false;
    xopt = _x;
    yopt = _y;
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

  public void updateOpts(String _x, String _y) {
    xopt = _x;
    yopt = _y;
  }

  //    dataPanel.setHoveredPlayers(hovered);
  public void setHoveredPoints(ArrayList<Point> _hoveredPs) {
    hoveredPs = _hoveredPs;
    pointsSet = true;
  }

  public void draw() {
    fill(255);
    stroke(0);
    if (this.isPie) {
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
      rect(width*.75, height*.1, width*.23, height*.52);
      fill(0);
      text("Number of Moves per Player", width*.77, height*.13);

      if (pointsSet) {
        fill(0);
        for (int i=0; i<hoveredPs.size(); i++) {
          fill(255, 0, 0);
          text("Player " + hoveredPs.get(i).player.getId(), width*.76, height*.2 + i*20); 
          fill(0);
          text( xopt + ":" + hoveredPs.get(i).player.getCountForMove(xopt, 2) + "   " + yopt+":" + hoveredPs.get(i).player.getCountForMove(yopt, 2), width*.86, height*.2 + i*20);
        }
      }
    }
  }
}

