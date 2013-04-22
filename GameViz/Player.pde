class Player {

  String id;
  String moveString;
  String benDesc;
  String moveList[];
  String missions[];
  Boolean valid; // invalid means more than 4 missions.
  HashMap movesCounts;
  int numberOfMoves;
  int numMissions;
  ArrayList missionMovesList;  // [ [Mission1 moves] [Mission2 moves] .... [Mission n moves] ]
  ArrayList<String[]> movesListsByMission;
  HashMap<Integer, HashMap> movesCountsByMission;

  //NOTE MISSIONS SRTART AT 0 

  public Player(String _id, String _benDesc, String _moveString) {
    this.id = _id;
    this.moveString = _moveString;
    this.benDesc = _benDesc;
    this.missions = this.moveString.split(" M M P");
    this.numMissions = this.missions.length;
    if (this.numMissions > 4)
      this.valid = false;
    else
      this.valid = true;
    this.movesListsByMission = new ArrayList<String[]>();

    for (int i =0; i<missions.length; i++) {
      String[] ms = missions[i].split(" ");
      this.movesListsByMission.add(i, ms);
    }
    this.numberOfMoves = 0;
    movesCountsByMission = new HashMap();
    for (int i=0; i < this.numMissions; i++) {
      movesCountsByMission.put(i, new HashMap());
    }
    calcAverages();
  }


  /*Calculates the number of each move in the moveList */
  public void calcAverages() {

    for (int i=0; i<this.numMissions; i++) { //  first mission is mission 1.
      String[] movesList = this.movesListsByMission.get(i);
      for (int j=0; j<movesList.length;j++) {
        incrementMove(movesList[j], i);
        this.numberOfMoves+=1;
      }
    }
  }


  /*Increments "move" in the hash map*/
  public void incrementMove(String _move, int _missionNum) {
    HashMap missionMovesCounts = movesCountsByMission.get(_missionNum); 

    if (missionMovesCounts.containsKey(_move)) {
      Object count = missionMovesCounts.get(_move);
      count = (Integer)count + 1;
      missionMovesCounts.put(_move, count);
    } 
    else {
      missionMovesCounts.put(_move, 0);
    }
    movesCountsByMission.put(_missionNum, missionMovesCounts);
  }

  public void getMoves() {
    Set s = movesCounts.entrySet();
    Iterator i = s.iterator();
    while (i.hasNext ()) {
      Map.Entry me = (Map.Entry)i.next();
      println(me.getKey() + ": " + me.getValue());
    }
  }

  public String[] getMovesListsForMission(int _m) {
    return this.movesListsByMission.get(_m);
  }


  public int getCountForMove(String _s, int _missionNum) {
    if (!movesCountsByMission.containsKey(_missionNum))//TODO: this gives 0 to stages they haven't completed. Re-evaluate!!
      return 0; 
    HashMap h = movesCountsByMission.get(_missionNum);
    if (h.containsKey(_s))
      return (Integer)h.get(_s);
    else
      return 0;
  }

  public Boolean isValid() {
    return this.valid;
  }
  public String getId() {
    return this.id;
  }
  public String getMoveString() {
    return this.moveString;
  }
  public String getBenDesc() {
    return this.benDesc;
  }
  public String getMove(int i) {
    return this.moveList[i];
  }
  public int getNumMissions() {
    return this.numMissions;
  }
  
  public void printInfo(int x, int y){
    fill(0);
    text("Player "+id, x, y);
  }
}

