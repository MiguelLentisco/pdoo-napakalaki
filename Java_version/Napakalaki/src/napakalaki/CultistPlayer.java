// begin CultistPlayer.java
package napakalaki;

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
    protected int getCombatLevel() {
        return (int) 1.7*super.getCombatLevel() + 
                myCultistCard.getGainedLevels()*totalCultistPlayers;
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
        Treasure t = getVisibleTreasures().get(new Random().nextInt(
            getVisibleTreasures().size()));
        getVisibleTreasures().remove(t);
        return t;
    }
    
    @Override
    protected boolean canYouGiveMeATreasure(){
        return !getVisibleTreasures().isEmpty();
    }
    
    static public int getTotalCultistPlayers() {
        return totalCultistPlayers;
    }
}

// end CultistPlayer.java