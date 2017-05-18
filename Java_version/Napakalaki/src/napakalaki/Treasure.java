// begin Treasure.java
package napakalaki;

// Representa una carta de Tesoro
public class Treasure {
    
    private String name;
    private int bonus;
    private TreasureKind type;
    
    public Treasure(String n, int bonus, TreasureKind t) {
        this.name = n;
        this.bonus = bonus;
        this.type = t;
    }
    
    public String getName() {
        return name;
    }
    
    public int getBonus() {
        return bonus;
    }
    
    public TreasureKind getType() {
        return type;
    }
    
}

// end Treasure.java
