// begin Prize.java
package napakalaki;

// Clase Prize que representa la recompensa a obtener
public class Prize {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
    
    // Nº de tesoros obtenidos
    private int treasures;
    // Nº de niveles subidos
    private int level;
    
    /* ------------------------------------------------------ */
    
    /* Constructor */
    /* ------------------------------------------------------ */
    
    public Prize(int treasures, int level) {
        this.treasures = treasures;
        this.level = level;
    }
    
    /* ------------------------------------------------------ */
    
    /* Consulta */
    /* ------------------------------------------------------ */
    
    public int getTreasures() {
        return treasures;
    }
    
    public int getLevel() {
        return level;
    }
    /* ------------------------------------------------------ */
    
    /* Métodos */
    /* ------------------------------------------------------ */
    
    // Convierte a String
    public String toString() {
        return  "Treasures = " + Integer.toString(treasures) 
                + " levels = " + Integer.toString(level);
    }
    
    /* ------------------------------------------------------ */
}

// end Prize.java