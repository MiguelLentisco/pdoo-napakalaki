// begin BadConsequence.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;

// Clase BadConsequence que representa el mal rollo de los monstruos
public class BadConsequence {
    
    /* Datos miembro */
    /* ------------------------------------------------------ */
    
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
    public BadConsequence(String text, int levels, int nVisible, int nHidden)
    {
        this.text = text;
        this.levels = levels;
        this.nVisibleTreasures = nVisible;
        this.nHiddenTreasures = nHidden;
        this.death = false;
    }
    
     // Constructor tipo 2: tesoros específicos
    public BadConsequence(String text, int levels, ArrayList<TreasureKind> tVisible,
                               ArrayList<TreasureKind> tHidden)
    {
        this.text = text;
        this.levels = levels;
        this.nHiddenTreasures = 0;
        this.nVisibleTreasures = 0;
        this.specificHiddenTreasures = tHidden;
        this.specificVisibleTreasures = tVisible;
        this.death = false;
    }
    
    // Constructor tipo 3: muerte
    public BadConsequence(String text, boolean death)
    {
        this.text = text;
        this.levels = 0;
        this.nVisibleTreasures = 0;
        this.nHiddenTreasures = 0;
        this.death = death;
    }
    
    // ?¿?¿?¿
    public BadConsequence(String text)
    {
        this.text = text;
        this.levels = 0;
        this.nVisibleTreasures = 0;
        this.nHiddenTreasures = 0;
        this.death = true;
    }
    
    /* ------------------------------------------------------- */
    
    /* Consulta */
    /* ------------------------------------------------------- */
    
    public String getText()
    {
        return text;
    }
    
    public int getLevels()
    {
        return levels;
    }
    
    public int getNVisibleTreasures()
    {
        return nVisibleTreasures;
    }
        
    public int getNHiddenTreasures()
    {
        return nHiddenTreasures;
    }
    
    public boolean getDeath()
    {
        return death;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures()
    {
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures()
    {
        return specificVisibleTreasures;
    }
    
    /* ------------------------------------------------------- */
    
    /* Métodos */
    /* ------------------------------------------------------- */
    
    // Convierte a String
    public String toString()
    {
        String message = "Text = " + text;
        if (!death)
        {
            message += " levels = " + Integer.toString(levels);
            message += "visibleTreasures = ";
            if (specificVisibleTreasures.size() > 0)
                message += specificVisibleTreasures.toString();
            else
                message += Integer.toString(nVisibleTreasures);
            message += " hiddenTreasures = ";
            if (specificHiddenTreasures.size() > 0)
               message += specificHiddenTreasures.toString();
            else
                message += Integer.toString(nHiddenTreasures);
        }
       message += " death = " + Boolean.toString(death);
       
       return message;
    }
    
    /* ------------------------------------------------------- */
}

// end BadConsequence.java