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
    
    /* ------------------------------------------------------ */
    
    /* Constructor */
    /* ------------------------------------------------------ */
    
    public Prize(int t, int l) {
        this.treasures = t;
        this.levels = l;
    }
    
    /* ------------------------------------------------------ */
    
    /* Consulta */
    /* ------------------------------------------------------ */
    
    public int getTreasures() {
        return treasures;
    }
    
    public int getLevels() {
        return levels;
    }
    /* ------------------------------------------------------ */
    
    /* Métodos */
    /* ------------------------------------------------------ */
    /*
    // Convierte a String
    public String toString() {
        return  "\nTesoros = " + Integer.toString(treasures) 
                + "\nNiveles = " + Integer.toString(level);
    }*/
    
    /* ------------------------------------------------------ */
}

// end Prize.java