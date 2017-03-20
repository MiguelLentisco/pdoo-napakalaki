// begin Napakalaki.java
package napakalaki;

import java.util.ArrayList;

// Representación del juego
public class Napakalaki {
    
   private static final Napakalaki instance = new Napakalaki();
   private Player currentPlayer;
   private ArrayList<Player> players = new ArrayList();
   private CardDealer dealer;
   private Monster currentMonster;
   
   private Napakalaki() {
   }
   
   private void initPlayers(ArrayList<String> names) {
       
   }
   
   private Player nextPlayer() {
       
   }
   
   private boolean nextTurnAllowed() {
       
   }
   
   private void setEnemies() {
       
   }
   
   public static Napakalaki getInstance() {
       return instance;
   }
   
   public CombatResult developCombat() {
       
   }
   
   public void discardVisibleTreasures(ArrayList<Treasure> treasures) {
       
   }
   
   public void discardHiddenTreasures(ArrayList<Treasure> treasures) {
       
   }
   
   public void makeTreasuresVisible(ArrayList<Treasure> treasures) {
       
   }
   
   public void initGame(ArrayList<String> players) {
       
   }
   
   public Player getCurrentPlayer() {
       return currentPlayer;
   }
   
   public Monster getCurrentMonster() {
       return currentMonster;
   }
   
   public boolean nextTurn() {
       
   }
   
   public boolean endOfGame(CombatResult result) {
       
   }
   
}

// end Napakalaki.java
