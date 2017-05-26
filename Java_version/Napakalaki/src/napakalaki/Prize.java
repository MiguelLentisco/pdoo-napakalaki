// begin Prize.java
package napakalaki;

// Clase Prize que representa la recompensa a obtener
public class Prize {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
    
    // Nº de tesoros obtenidos
    private int treasures;
    // Nº de niveles subidos
    private int levels;
    
    
    public Prize(int t, int l) {
        this.treasures = t;
        this.levels = l;
    }
   
    
    public int getTreasures() {
        return treasures;
    }
    
    public int getLevels() {
        return levels;
    }

    public String toString() {
        return  "\n Tesoros = " + Integer.toString(treasures) 
                + "\n Niveles = " + Integer.toString(levels);
    }
    
    /* ------------------------------------------------------ */
}

// end Prize.java