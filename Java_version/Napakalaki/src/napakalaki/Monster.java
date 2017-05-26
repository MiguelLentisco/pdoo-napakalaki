// begin Monster.java
package napakalaki;

// Clase Monster que representa una carta de monstruo
public class Monster {
    
    private String name;
    private int combatLevel;
    private Prize prize;
    private BadConsequence badConsequence;
    private int levelChangeAgainstCultistPlayer;
    
    public Monster(String n, int l, BadConsequence b, Prize p) {
        this.name = n;
        this.combatLevel = l;
        this.badConsequence = b;
        this.prize = p;
        this.levelChangeAgainstCultistPlayer = 0;
    }
    
    public Monster(String n, int l, BadConsequence b, Prize p, int IC) {
        this.name = n;
        this.combatLevel = l;
        this.badConsequence = b;
        this.prize = p;
        this.levelChangeAgainstCultistPlayer = IC;
    }

    public String getName() {
        return name;
    }
    
    public int getCombatLevel() {
        return combatLevel;
    }
    
    public int getCombatLevelAgainstCultistPlayer() {
        return combatLevel + levelChangeAgainstCultistPlayer;
    }
    
    public BadConsequence getBadConsequence() {
        return badConsequence;
    }
    
    public int getLevelsGained() {
        return prize.getLevels();
    }
    
    public int getTreasuresGained() {
        return prize.getTreasures();
    }
    
    public int getLevelChangeAgainstCultistPlayer() {
        return levelChangeAgainstCultistPlayer;
    }
    
    public Prize getPrize() {
        return prize;
    }
    
    public String toString() {
        return "\nNombre: " + name + "\nPoder de combate: " + 
                Integer.toString(combatLevel) + "(Contra sectarios: " +
                Integer.toString(getCombatLevelAgainstCultistPlayer()) + ")\n" +
                "--Recompensa--#" + prize.toString() + "\n--Mal rollo--" +
                badConsequence.toString();
    }
}

// end Monster.java