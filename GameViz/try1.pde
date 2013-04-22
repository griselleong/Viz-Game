/* Commented out to test Pie
Parser parser;
int ahhh = 0;

void setup() {
//  size (500, 500);
  parser = new Parser ("progendata.csv");
  ArrayList<Player> ps = parser.getPlayers();
  for (int i=0; i<ps.size(); i++){
    println("Player " + ps.get(i).getId());
   // + " move string: " + ps.get(i).getNumber());
   if(ps.get(i).getNumMissions() > 4){
    ahhh += 1; 
   }
  }
     println(ahhh);

//  int maxofcol2 = parser.getMaxOverCol(1);
//  println(maxofcol2);
}

void draw() {
  background(255, 255, 255);
}
*/
