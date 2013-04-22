import java.util.Iterator;
import java.util.Map;
import java.util.Set;


class Parser {

  //progdendata.csv

  ArrayList<Player> players;
  HashMap<String, String> playersIdToMoveStrings = new HashMap<String, String>();  


  public Parser(String filename) {

    players = new ArrayList<Player>();

    String lines[] = loadStrings(filename);
   // values = new String[lines.length][];

    for (int i=0; i<lines.length; i++) {
      String values[] = split(lines[i], ',');
      String pId = i + "";
      Player p = new Player(pId, values[0], values[1]);
      players.add(p);
      playersIdToMoveStrings.put(pId, values[1]);
    }
  }

  public ArrayList<Player> getPlayers() {
    return players;
  }
}

