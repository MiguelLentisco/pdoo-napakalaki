// begin Player.java
package napakalaki;

import java.util.ArrayList;

// Representación de un jugador
public class Player {
    
    static final int MAXLEVEL = 10;
    private String name;
    private int level;
    private boolean dead = true;
    private boolean canISteal = true;
    private Player enemy;
    private BadConsequence pendingBadConsequence;
    private ArrayList<Treasure> visibleTreasures;
    private ArrayList<Treasure> hiddenTreasures;

    public Player(String name) {
        
    }
    
    private String getName() {
        
    }
    
    private void bringToLife() {
        
    }
    
    private int getCombatLevel() {
        
    }
    
    private void incrementLevels(int l) {
        
    }
    
    private void decrementLevels(int l) {
        
    }
    
    private void setPendingBadConsequence(BadConsequence b) {
        
    }
    
    private void applyPrize(Monster m) {
        
    }
    
    private void applyBadConsequence(Monster m) {
        
    }
    
    private boolean canMakeTreasureVisible(Treasure t) {
        
    }
    
    private int howManyVisibleTreasures(TreasureKind tKind) {
        
    }
    
    private void dieIfNoTreasures() {
        
    }
    
    public boolean isDead() {
        
    }
    
    public ArrayList<Treasure> getVisibleTreasures() {
        
    }
    
    public ArrayList<Treasure> getHiddenTreasures() {
        
    }
    
    public CombatResult combat(Monster m)
    {
        
    }
    
    public void makeTreasureVisible(Treasure t) {
        
    }
    
    public void discardVisibleTreasure(Treasure t) {
        
    }
    
    public void discardHiddenTreasure(Treasure t) {
        
    }
    
    public boolean validState() {
        
    }
    
    public void initTreasures() {
        
    }
    
    public int getLevels() {
        
    }
    
    public Treasure stealTreasures() {
        
    }
    
    public void setEnemy(Player enemy) {
        
    }
    
    private Treasure giveMeATreasure() {
        
    }
    
    public boolean canISteal() {
        
    }
    
    private boolean canYouGiveMeATreasure() {
        
    }
    
    private void haveStolen() {
        
    }
    
    public void discardAllTreasures() {
        
    }
    
}

// end Player.java
