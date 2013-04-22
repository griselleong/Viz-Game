/**
TAKE NOTE: translate and scale are bad if we want
to do any mouseover mouseX and mouseY do not translate or scale
**/
ArrayList<Player> allplayers;
ArrayList<Player> players; //valid players

HashMap moveCountsByMission;
ArrayList<HashMap<String, float[]>> moveCountsHashes;
ArrayList<HashMap<String, Float>> moveTotals;


boolean pie_view;
int pie;
String xopt;
String yopt;
Options opt1; 
Options opt2;

void setup(){
  size(1024, 800);
  frame.setResizable(true);
  background(255, 255, 255);
  pie_view = true;
  pie = 1;
  xopt = "U-M";
  yopt = "U-C";
  opt1 = new Options("X", 50, height-80);
  opt2 = new Options("Y", 50, height-50);
  
  /*Noa's setup*/
  
  String[] moves = { 
    "U-M", "U-C", "P", "U-S", "D", "M", "O", "None", "U-G", "S", "C", "A"
  };

  moveCountsHashes = new ArrayList<HashMap<String, float[]>>();
  moveTotals = new ArrayList<HashMap<String, Float>>();

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
  /*  for (int i=0; i<moveCountsHashes.size(); i++) {
   for (int k = 0; k < moves.length; k++) {
   
   
   
   }
   }*/

  println("PRINTING HASHES.");
  for (int i=0; i<moveCountsHashes.size(); i++) 
    println("MISSION " + i + ": " + moveCountsHashes.get(i));

  println("PRINTIN G TOTOALS.");
  for (int i=0; i<moveTotals.size(); i++)
    println("MISSION " + i + ": " + moveTotals.get(i));

  
}

void draw(){
  background(255, 255, 255);
  draw_buttons(); 
  
  if(pie_view){
 
 /**** Pie Testing Code ****/ 
 
  float centerXCoord = width/2;
  float centerYCoord = height/2;
  float smallerDimension = 0;
  
  if (width < height){
    smallerDimension = width; 
  } else {
    smallerDimension = height;
  }
  
  //create new pie with percentages
  float [] percentages = {10, 2.5, 12.5, 25, 50};
  Pie p;
  if(pie == 1){
    text("Mission 1", width*.45, 30);
    p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.8);
  }
  else if(pie == 2){
    text("Mission 2", width*.45, 30);
    p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.8);
  }
  else{ //3rd pie
    text("Mission 3", width*.45, 30);
    p = new Pie(percentages, centerXCoord, centerYCoord, smallerDimension*0.8);    
  }
  
  p.drawPie();
 
  }
  else{
 /**** Correlation Graph Testing Code ****/
  float [] m1MData = moveCountsHashes.get(0).get(xopt);
  float [] m1DData = moveCountsHashes.get(0).get(yopt);

 float [] xData = {0.0, 1.0, 2.0, 3.0, 4.0};
 float [] yData = {0.0, 1.0, 2.0, 3.0, 4.0};
 
 //Correlation corr = new Correlation(xData, yData, 0, width*.9, 0, height*.9
  Correlation corr = new Correlation(m1MData, m1DData, players, 0, width*.7, height*.1 , height*.8);

 corr.plot();
 fill(0);
 text(xopt, 0, 10);
 text(yopt, 0, 50);

  }
 
}

void draw_buttons(){
 stroke(0);
 fill(255, 255, 255);
 rect(width-80, 20, 70,30); 
 fill(0);
 text("Toggle", width-75, 40);
 if(pie_view){
    stroke(0);
    fill(255, 255, 255);
    rect(width*.2, height-40, 70,30); 
    fill(0);
    text("Pie 1", width*.2+5, height-20);
    stroke(0);
    fill(255, 255, 255);
    rect(width*.4, height-40, 70,30); 
    fill(0);
    text("Pie 2", width*.4+5, height-20);
    stroke(0);
    fill(255, 255, 255);
    rect(width*.6, height-40, 70,30); 
    fill(0);
    text("Pie 3", width*.6+5, height-20);
 }
 else{ //correlation view
  draw_options(); 
 }
}

void draw_options(){
  opt1.print_options();
  opt2.print_options();
}

void mouseClicked(){
 if(mouseX < width-10 && mouseX > width-80 && mouseY > 20 && mouseY < 50){
    if(pie_view){
     pie_view = false; 
    }
    else{
     pie_view = true; 
    }
 }
 if(mouseX < width*.2 + 70 && mouseX > width*.2 && mouseY > height-40 && mouseY < height-10){
  pie = 1;
 } 
 if(mouseX < width*.4 + 70 && mouseX > width*.4 && mouseY > height-40 && mouseY < height-10){
  pie = 2;
 } 
 if(mouseX < width*.6 + 70 && mouseX > width*.6 && mouseY > height-40 && mouseY < height-10){
  pie = 3;
 } 
 optItest();
}

 /*runs an intersect test onclick for all option buttons*/
 void optItest(){
  for(int i=0; i<opt1.options.length;i++){
   if(opt1.options[i].itest()){
    xopt = opt1.options[i].getVal(); 
    opt1.selected = xopt; 

   }
  }
  for(int j=0; j<opt2.options.length;j++){
   if(opt2.options[j].itest()){
    yopt = opt2.options[j].getVal();
    opt2.selected = yopt; 
   }
  }
 }
