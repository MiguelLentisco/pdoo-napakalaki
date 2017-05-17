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
    private ArrayList<Treasure> visibleTreasures = new ArrayList();
    private ArrayList<Treasure> hiddenTreasures = new ArrayList();

    public Player(String name) {
        this.name = name;
        this.level = 1;
    }
    
    public String getName() {
        return name;
    }
    
    private void bringToLife() {
        dead = false;
    }
    
    private int getCombatLevel() {
        int bonus_total = level;
        for (Treasure treasure: visibleTreasures)
            bonus_total += treasure.getBonus();
        return bonus_total;
    }
    
    private void incrementLevels(int l) {
        level += l;
        if (level > 10)
            level = 10;
    }
    
    private void decrementLevels(int l) {
        level -= l;
        if (level < 1)
            level = 1;
    }
    
    private void setPendingBadConsequence(BadConsequence b) {
        pendingBadConsequence = b;
    }
    
    private void applyPrize(Monster m) {
        
    }
    
    private void applyBadConsequence(Monster m) {
        
    }
    
    private boolean canMakeTreasureVisible(Treasure t) {
        
    }
    
    private int howManyVisibleTreasures(TreasureKind tKind) {
        int n = 0;
        for (Treasure treasure : visibleTreasures)
            if (treasure.getType() == tKind)
                n++;
        return n;
    }
    
    private void dieIfNoTreasures() {
        if (visibleTreasures.isEmpty() && hiddenTreasures.isEmpty())
            dead = true;
    }
    
    public boolean isDead() {
        return dead;
    }
    
    public ArrayList<Treasure> getVisibleTreasures() {
        return visibleTreasures;
    }
    
    public ArrayList<Treasure> getHiddenTreasures() {
        return hiddenTreasures;
    }
    
    public CombatResult combat(Monster m) {
        
    }
    
    public void makeTreasureVisible(Treasure t) {
        
    }
    
    public void discardVisibleTreasure(Treasure t) {
        
    }
    
    public void discardHiddenTreasure(Treasure t) {
        
    }
    
    public boolean validState() {
       return pendingBadConsequence.isEmpty() && hiddenTreasures.size() <= 4;
    }
    
    public void initTreasures() {
        
    }
    
    public int getLevels() {
        return level;
    }
    
    public Treasure stealTreasures() {
        
    }
    
    public void setEnemy(Player enemy) {
        this.enemy = enemy;
    }
    
    private Treasure giveMeATreasure() {
        
    }
    
    public boolean canISteal() {
        return canISteal;
    }
    
    private boolean canYouGiveMeATreasure() {
        return !hiddenTreasures.isEmpty();
    }
    
    private void haveStolen() {
        canISteal = false;
    }
    
    public void discardAllTreasures() {
        
    }
    
}

// end Player.java
