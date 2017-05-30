// begin CultistPlayer.java
package NapakalakiGame;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;
import java.lang.Math;

public class CultistPlayer extends Player {
    private static int totalCultistPlayers = 0;
    Cultist myCultistCard;
    
    public CultistPlayer(Player p, Cultist c) {
        super(p);
        myCultistCard = c;
        totalCultistPlayers++;
    }
    
    @Override
    public int getCombatLevel() {
        return (int)Math.round(1.7*super.getCombatLevel() + 
                myCultistCard.getGainedLevels()*totalCultistPlayers);
    }
    
    @Override
    protected int getOponentLevel(Monster m) {
        return m.getCombatLevelAgainstCultistPlayer();
    }

    @Override
    protected boolean shouldConvert() {
        return false;
    }
    
    @Override
    protected Treasure giveMeATreasure() {
        Treasure t = visibleTreasures.get(new Random().nextInt(
            visibleTreasures.size()));
        visibleTreasures.remove(t);
        return t;
    }
    
    @Override
    protected boolean canYouGiveMeATreasure(){
        return !visibleTreasures.isEmpty();
    }
    
    static public int getTotalCultistPlayers() {
        return totalCultistPlayers;
    }
    
    @Override
    public String toString() {
        return super.toString() + "\n I´m a cultist.";
    }
}

// end CultistPlayer.java