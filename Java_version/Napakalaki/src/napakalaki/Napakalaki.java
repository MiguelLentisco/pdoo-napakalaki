// begin Napakalaki.java
package napakalaki;

import java.util.ArrayList;
import java.util.Random;
import java.util.Iterator;

// Representación del juego
public class Napakalaki {
    
   private static final Napakalaki instance = new Napakalaki();
   private Player currentPlayer = null;
   private int indexCurrentPlayer = -1; //No aparece en el diagrama, para el método 
                                   //nextPlayer, comentado con el profesor.
   private ArrayList<Player> players = new ArrayList();
   private CardDealer dealer = CardDealer.getInstance();
   private Monster currentMonster;
   
   private void initPlayers(ArrayList<String> names) {
       for (String name : names) {
           players.add(new Player(name));
       }
   }
   
   //Podríamos implementar esto con un nuevo atributo de instance
   private Player nextPlayer() {
       if (indexCurrentPlayer == -1) {
           indexCurrentPlayer = new Random().nextInt(players.size());
       } else {
           indexCurrentPlayer++;
           if (indexCurrentPlayer == players.size()) 
               indexCurrentPlayer = 0;
       }
       currentPlayer = players.get(indexCurrentPlayer);
       return currentPlayer;
   }
   
   private boolean nextTurnAllowed() {
       boolean result;
       if (currentPlayer == null)
           result = true;
       else
           result = currentPlayer.validState();
       return result;
   }
   
   private void setEnemies() {
       Random rand = new Random();
       Player enemy;
       for (Player p : players) {
            do {
               enemy = players.get(rand.nextInt(players.size()));
            } while (p == enemy);
           p.setEnemy(enemy);
       }
   }
   
   public static Napakalaki getInstance() {
       return instance;
   }
   
   public CombatResult developCombat() {
       CombatResult cr = currentPlayer.combat(currentMonster);
       if (cr == CombatResult.LOSEANDCONVERT) {
            CultistPlayer sectario = new CultistPlayer (currentPlayer,
                dealer.nextCultist());
            players.set(players.indexOf(currentPlayer), sectario);
            for (int i = 0; i < players.size(); i++) {
                if (players.get(i).getEnemy() == currentPlayer)
                    players.get(i).setEnemy(sectario);
            }
            currentPlayer = sectario;
       }
       dealer.giveMonsterBack(currentMonster);
       return cr;
   }
   
   public void discardVisibleTreasures(ArrayList<Treasure> treasures) {
       Iterator <Treasure> i = treasures.iterator();
       Treasure t;
       while (i.hasNext()) {
           t = i.next();
           currentPlayer.discardVisibleTreasure(t);
           dealer.giveTreasureBack(t);
       }
   }
   
   public void discardHiddenTreasures(ArrayList<Treasure> treasures) {
       
   }
   
   public void makeTreasuresVisible(ArrayList<Treasure> treasures) {
       for (Treasure t : treasures)
           currentPlayer.makeTreasureVisible(t);
   }
   
   public void initGame(ArrayList<String> players) {
       initPlayers(players);
       setEnemies();
       dealer.initCards();
       nextTurn();
   }
   
   public Player getCurrentPlayer() {
       return currentPlayer;
   }
   
   public Monster getCurrentMonster() {
       return currentMonster;
   }
   
   public boolean nextTurn() {
       boolean stateOK = nextTurnAllowed();
       if (stateOK) {
           currentMonster = dealer.nextMonster();
           currentPlayer = nextPlayer();
           if (currentPlayer.isDead()) {
               currentPlayer.initTreasures();
           }
       }
       return stateOK;
   }
   
   public boolean endOfGame(CombatResult result) {
       return result == CombatResult.WINGAME;
   }
   
}

// end Napakalaki.java
