// begin Monster.java
package napakalaki;

// Clase Monster que representa una carta de monstruo
public class Monster {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
    
    // Nombre del monstruo
    private String name;
    // Nivel de combate
    private int combatLevel;
    // Recompensa por derrotarlo
    private Prize prize;
    // Mal rollo
    private BadConsequence badConsequence;
    
    /* ------------------------------------------------------ */
    
    /* Constructor */
    /* ------------------------------------------------------ */
    
    public Monster(String n, int l, BadConsequence b, Prize p) {
        this.name = n;
        this.combatLevel = l;
        this.badConsequence = b;
        this.prize = p;
    }
    
    /* ------------------------------------------------------- */
    
    /* Consulta */
    /* ------------------------------------------------------- */
    
    public String getName() {
        return name;
    }
    
    public int getCombatLevel() {
        return combatLevel;
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
    
    
    
    /* ------------------------------------------------------- */
    
    
    /* Métodos */
    /* ------------------------------------------------------- */
    
    // Convierte a String
    public String toString() {
        return  "\nNombre = " + name 
                + "\nPoder de combate = " + Integer.toString(combatLevel)
                + "\n--Recompensa--" + prize.toString() 
                + "\n--Mal rollo--" + badConsequence.toString();
    }
    
    /* ------------------------------------------------------- */
}

// end Monster.java