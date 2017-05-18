// begin BadConsequence.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;

// Clase BadConsequence que representa el mal rollo de los monstruos
public abstract class BadConsequence {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
  
    // Nº máximo de tesoros
    final static int MAXTREASURES = 10;
    // Descripción del mal rollo
    private String text;
    // Niveles a perder
    private int levels;    
    /* ------------------------------------------------------- */
    
    /* Constructores */
    /* ------------------------------------------------------- */
    protected BadConsequence(String t, int l) {
        this.text = t;
        this.levels = l;
    }
    /* ------------------------------------------------------- */
    
    /* Consulta */
    /* ------------------------------------------------------- */
    
    abstract boolean isEmpty();
     
    public int getLevels() {
        return levels;
    }
    
    protected String getText() {
        return text;
    }
    
    /* ------------------------------------------------------- */
    
    /* Métodos */
    /* ------------------------------------------------------- */
    
    abstract public void substractVisibleTreasure(Treasure t);
    
    abstract public void substractHiddenTreasure(Treasure t);
    
    abstract public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v,
            ArrayList<Treasure> h);
    
    // Convierte a String
    /*
    public String toString() {
        String message = "\nDescripción = " + text;
        if (!death)
        {
            message += "\nNiveles = " + Integer.toString(levels);
            if (!specificVisibleTreasures.isEmpty())
                message += "\nTesoros visibles = " + specificVisibleTreasures.toString();
            else if (nVisibleTreasures > 0)
                message += "\nTesoros visibles = " + Integer.toString(nVisibleTreasures);
            
            if (!specificHiddenTreasures.isEmpty())
               message += "\nTesoros ocultos = " + specificHiddenTreasures.toString();
            else if (nHiddenTreasures > 0)
                message += "\nTesoros ocultos = " + Integer.toString(nHiddenTreasures);
        }
        else
            message += "\nMuerte = sí";
                    
       return message;
    }*/
    
    /* ------------------------------------------------------- */
}

// end BadConsequence.java