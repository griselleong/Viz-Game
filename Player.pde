class Player {
  
  String id;
  String moveString;
  String benDesc;
  String moveList[];
  String missions[];
  HashMap movesCounts;
  int numberOfMoves;
  
  public Player(String _id, String _benDesc, String _moveString){
    this.id = _id;
    this.moveString = _moveString;
    this.benDesc = _benDesc;
    this.missions = this.moveString.split(" M M P");
    this.moveList = this.moveString.split(" ");
    this.numberOfMoves = 0;
    movesCounts = new HashMap();
    calcAverages();
  }
  
  /*Calculates the number of each move in the moveList */
  public void calcAverages(){
    for(int i=0; i<moveList.length;i++){
     incrementMove(moveList[i]);
     this.numberOfMoves+=1;
    }
  }
  
  /*Increments "move" in the hash map*/
  public void incrementMove(String move){
   Object count = movesCounts.get(move);
   if(count != null){
    count = (Integer)count + 1;
    movesCounts.put(move,count);
   }
  else{
   movesCounts.put(move,0);
  } 
  }
  
  public void getMoves(){
   Set s = movesCounts.entrySet();
   Iterator i = s.iterator();
   while(i.hasNext()){
    Map.Entry me = (Map.Entry)i.next();
    println(me.getKey() + ": " + me.getValue()); 
   }
  }
  
  public String getId(){
    return this.id;
  }
  public String getMoveString(){
    return this.moveString;
  }
  public String getBenDesc(){
    return this.benDesc;
  }
  public String getMove(int i){
   return this.moveList[i]; 
  }
  public int getNumMissions(){
   return missions.length; 
  }
}
