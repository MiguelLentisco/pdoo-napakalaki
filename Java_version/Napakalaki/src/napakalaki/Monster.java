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
    
    public Monster(String name, int level, BadConsequence bc, Prize prize)
    {
        this.name = name;
        this.combatLevel = level;
        this.badConsequence = bc;
        this.prize = prize;
    }
    
    /* ------------------------------------------------------- */
    
    /* Consulta */
    /* ------------------------------------------------------- */
    
    public String getName()
    {
        return name;
    }
    
    public int getCombatLevel()
    {
        return combatLevel;
    }
    
    public Prize getPrize()
    {
        return prize;
    }
    
    public BadConsequence getBadConsequence()
    {
        return badConsequence;
    }
    
    /* ------------------------------------------------------- */
    
    
    /* Métodos */
    /* ------------------------------------------------------- */
    
    // Convierte a String
    public String toString()
    {
        return  "Name = " + name 
                + " levels = " + Integer.toString(combatLevel)
                + " prize = " + prize.toString() 
                + " badConsequence = " + badConsequence.toString();
    }
    
    /* ------------------------------------------------------- */
}

// end Monster.java