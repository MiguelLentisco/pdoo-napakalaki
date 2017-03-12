// begin BadConsequence.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;

// Clase BadConsequence que representa el mal rollo de los monstruos
public class BadConsequence {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
    
    // Nº máximo de tesoros
    final static int MAXTREASURES = 10;
    // Descripción del mal rollo
    private String text;
    // Niveles a perder
    private int levels;
    // Nº de tesoros visibles perdidos
    private int nVisibleTreasures;
    // Nº de tesoros ocultos perdidos
    private int nHiddenTreasures;
    // Tesoros visibles específicos perdidos
    private ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    // Tesoros ocultos específicos perdidos
    private ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList();
    // Si se produce muerte
    private boolean death;
    
    /* ------------------------------------------------------- */
    
    /* Constructores */
    /* ------------------------------------------------------- */
    
    // Constructor tipo 1: tesoros no específcos
    public BadConsequence(String t, int l, int nVisible, int nHidden) {
        this.text = t;
        this.levels = l;
        this.nVisibleTreasures = nVisible;
        this.nHiddenTreasures = nHidden;
        this.death = false;
    }
    
     // Constructor tipo 2: tesoros específicos
    public BadConsequence(String t, int l, ArrayList<TreasureKind> v,
                               ArrayList<TreasureKind> h) {
        this.text = t;
        this.levels = l;
        this.nHiddenTreasures = 0;
        this.nVisibleTreasures = 0;
        this.specificHiddenTreasures = v;
        this.specificVisibleTreasures = h;
        this.death = false;
    }
    
    // Constructor tipo 3: muerte
    public BadConsequence(String t, boolean death) {
        this.text = t;
        this.levels = 0;
        this.nVisibleTreasures = 0;
        this.nHiddenTreasures = 0;
        this.death = death;
    }
    
    /* ------------------------------------------------------- */
    
    /* Consulta */
    /* ------------------------------------------------------- */
    
    boolean isEmpty() {
        return nVisibleTreasures == 0 && nHiddenTreasures == 0 &&
                specificHiddenTreasures.isEmpty() &&
                specificVisibleTreasures.isEmpty();
    }
    
    
    public int getLevels() {
        return levels;
    }
    
    public int getNVisibleTreasures() {
        return nVisibleTreasures;
    }
    
    public int getNHiddenTreasures() {
        return nHiddenTreasures;
    }
    
    
    public String getText() {
        return text;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures() {
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures() {
        return specificVisibleTreasures;
    }
      
    /*
    public boolean getDeath() {
        return death;
    }
    */   
    
    /* ------------------------------------------------------- */
    
    /* Métodos */
    /* ------------------------------------------------------- */
    
    void substractVisibleTreasure(Treasure t) {
        
    }
    
    void substractHiddenTreasure(Treasure t) {
        
    }
    
    BadConsequence adjustToFitTreasureLists(ArrayList<TreasureKind> v,
            ArrayList<TreasureKind> h) {
        
    }
    
    
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