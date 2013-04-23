import java.text.*;

ArrayList<Player> allplayers;
ArrayList<Player> players; //valid players
ControlPanel controlPanel;
DataPanel dataPanel;
HashMap moveCountsByMission;
ArrayList<HashMap<String, float[]>> moveCountsHashes;
ArrayList<HashMap<String, Float>> moveTotals;
ArrayList<float[]> movePercentages;  // <missionNum, floatarrayOfPercentages
int missionNum;
int totalNumMoves;
Button mission1Button, mission2Button, mission3Button;

String[] moves = { 
  "U-M", "U-C", "P", "U-S", "D", "M", "O", "None", "U-G", "S", "C", "A"
};


boolean pie_view;
int pie;
String xopt;
String yopt;
Options opt1; 
Options opt2;

void setup() {
  size(1024, 800);
  frame.setResizable(true);
  pie_view = true;
  pie = 1;  
  xopt = "U-M";
  yopt = "U-C";
  opt1 = new Options("X", int(width*.75), int(height*.66), xopt);//height-80);
  opt2 = new Options("Y", int(width*.75), int(height*.77), yopt);//height-50);
  controlPanel = new ControlPanel(width*.9, height*.7, opt1, opt2);
  dataPanel = new DataPanel(xopt, yopt);
  missionNum = 0;
  totalNumMoves = 0;
  /*Noa's setup*/

  moveCountsHashes = new ArrayList<HashMap<String, float[]>>();
  moveTotals = new ArrayList<HashMap<String, Float>>();
  movePercentages = new ArrayList<float[]>();

  Parser parser =  new Parser("progendata.csv");
  allplayers = parser.getPlayers();
  players = new ArrayList<Player>();

  /* Filter players; disregard those who went through more than 4 stages. */
  for (int i=0; i<allplayers.size(); i++) {
    Player p = allplayers.get(i);
    if (p.isValid())
      players.add(p);
  }
  println(players.size() + " valid players.");

  for (int i=0; i<4; i++) { // for each mission;
    HashMap<String, float[]> h = new HashMap<String, float[]>();
    HashMap<String, Float> hh = new HashMap<String, Float>();

    for (int j=0; j<moves.length; j++) {
      float[] b = new float[players.size()];
      h.put(moves[j], b);
    }
    moveCountsHashes.add(h);
    moveTotals.add(hh);
  }

  // Run through players to get data for MoveData objects.
  for (int i =0; i<players.size(); i++) {
    Player p = players.get(i);
    int numMissions = p.getNumMissions();
    for (int j=0; j<4; j++) { // what is this numMissions
      for (int k = 0; k < moves.length; k++) {
        int moveCount = p.getCountForMove(moves[k], j);
        totalNumMoves += moveCount;
        if (moveCountsHashes.get(j).containsKey(moves[k])) {
          float[] f = moveCountsHashes.get(j).get(moves[k]);
          moveCountsHashes.get(j).get(moves[k])[i] = moveCount;
        }  
        else {
          float[] a = new float[players.size()];
          a[i] =  moveCount;
          moveCountsHashes.get(j).put(moves[k], a);
        }
        /* Update totals */
        if (moveTotals.get(j).containsKey(moves[k])) 
          moveTotals.get(j).put(moves[k], (moveTotals.get(j).get(moves[k]) + moveCount));
        else 
          moveTotals.get(j).put(moves[k], 0.0);
      }
    }
  }

  /* Calculate aggregate counts. */
  for (int i=0; i<moveCountsHashes.size(); i++) {
    HashMap h = new HashMap();
    float[] percentages = new float[moves.length];
    for (int k = 0; k < moves.length; k++) {
      float p = moveTotals.get(i).get(moves[k]) / totalNumMoves;
      percentages[k] = p;
    }

    movePercentages.add(percentages);
  }
  /* Print move counts, move totals, and move percentages. */
  println("PRINTING HASHES.");
  for (int i=0; i<moveCountsHashes.size(); i++) 
    println("MISSION " + i + ": " + moveCountsHashes.get(i));

  println("PRINTING TOTOALS.");
  for (int i=0; i<moveTotals.size(); i++)
    println("MISSION " + i + ": " + moveTotals.get(i));

  println("PRINTIN G PERCENTAGES.");
  for (int i=0; i<movePercentages.size(); i++) {
    println("MISSION " + i + ": " + movePercentages.get(i));
    float[] d = movePercentages.get(i);
    for (int j=0; j<d.length; j++)
      print(d[j] + " " );
  }
}



void draw() {
  // background(255, 255, 255);
  background(200);
  this.controlPanel.draw();
  draw_buttons();
  mission1Button = new Button("Mission 1", width*.02, height*.1, width*.1, height*.05, 0);
  mission2Button = new Button("Mission 2", width*.125, height*.1, width*.1, height*.05, 0);
  mission3Button = new Button("Mission 3", width*.23, height*.1, width*.1, height*.05, 0);
  mission1Button.render();
  mission2Button.render();
  mission3Button.render();
  /* Draw title */
  fill(255);
  stroke(0);
  rect(width*.02, height*.02, width*.7, height*.06);
  fill(0);



  if (pie == 1) {
    text("Mission 1", width*.45, 30);
  }
  else if (pie == 2) {
    text("Mission 2", width*.45, 30);
  }
  else { //3rd pie
    text("Mission 3", width*.45, 30);
  }
  if (pie_view) {
    text("Progen Visualization", width*.10, height*.04);

    dataPanel.setIsPie(true);
    /**** Pie Testing Code ****/

    float centerXCoord = width*.38;
    float centerYCoord = height*.56;
    float smallerDimension = 0;

    if (width < height) {
      smallerDimension = width;
    } 
    else {
      smallerDimension = height;
    }

    //create new pie with percentages
    float [] percentages = movePercentages.get(pie);
    Pie p;
    if (pie == 1) {
      text("Mission 1", width*.45, 30);
      p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.75, width*.02, width*.73, height*.15, height*.97);
    }
    else if (pie == 2) {
      text("Mission 2", width*.45, 30);
      p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.75, width*.02, width*.73, height*.15, height*.97);
    }
    else { //3rd pie
      text("Mission 3", width*.45, 30);
      p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.75, width*.02, width*.73, height*.15, height*.97);
    }

    p.drawPie();  
    dataPanel.setColors(p.getColors());

    dataPanel.setMoves(moves);
    dataPanel.drawPanel();
  }
  else {
    textAlign(LEFT);
    text("Progen Visualization: "+xopt + " and " + yopt , width*.10, height*.04);

    dataPanel.setIsPie(false);
    /**** Correlation Graph Testing Code ****/
    float [] xData = moveCountsHashes.get(missionNum).get(xopt);
    float [] yData = moveCountsHashes.get(missionNum).get(yopt);

    Correlation corr = new Correlation(xData, yData, players, width*.02, width*.73, height*.15, height*.97);
    corr.dataPanel.updateOpts(xopt, yopt, missionNum);
    corr.draw();
    corr.plot();
    fill(0);
  }
}

void draw_buttons() {
  stroke(0);

  if (mouseX < width-160 + 140 && mouseX > width-160 &&
    mouseY < 20 + 30 && mouseY > 20) {
    fill(255, 255, 0);
  } 
  else {
    fill(255, 255, 255);
  }

  rect(width-160, 20, 140, 30); 
  fill(0);
  textAlign(CENTER, CENTER);

  if (pie_view) {
    text("Correlation Graph", (width-160) + 70, 20+15);
  }
  else { //correlation view
    text("Pie Graph", (width-160) + 70, 20+15);
    draw_options();
  }
}

void draw_options() {
  opt1.print_options();
  opt2.print_options();
}

void mouseClicked() {
  if (mouseX < width-160 + 140 && mouseX > width-160 &&
    mouseY < 20 + 30 && mouseY > 20) {
    if (pie_view) {
      pie_view = false;
    }
    else {
      pie_view = true;
    }
  }
  if (mission1Button.itest()) {
    pie = 1;
    missionNum = 0;
  } 
  if (mission2Button.itest()) {
    pie = 2;
    missionNum = 1;
  } 
  if (mission3Button.itest()) {
    pie = 3;
    missionNum = 2;
  }
  optItest();
}

/*runs an intersect test onclick for all option buttons*/
void optItest() {
  for (int i=0; i<opt1.options.length;i++) {
    if (opt1.options[i].itest()) {
      xopt = opt1.options[i].getVal(); 
      opt1.selected = xopt;
    }
  }
  for (int j=0; j<opt2.options.length;j++) {
    if (opt2.options[j].itest()) {
      yopt = opt2.options[j].getVal();
      opt2.selected = yopt;
    }
  }
}

