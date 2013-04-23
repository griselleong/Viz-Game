
class DataPanel {


  float startX, startY;
  boolean isPie;
  ArrayList<Point> hoveredPs;
  boolean pointsSet;
  public DataPanel () {
    hoveredPs = new ArrayList<Point>();
    pointsSet = false;
  }


  public void setIsPie(boolean _isPie) {
    this.isPie = _isPie;
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
    } 
    else {
      rect(width*.75, height*.1, width*.23, height*.52);
      if (pointsSet) {
        fill(0);
        for (int i=0; i<hoveredPs.size(); i++) {
          text("Player " + hoveredPs.get(i).player.getId(), width*.76, height*.2 + i*11);
        }
      }
    }
  }
}

