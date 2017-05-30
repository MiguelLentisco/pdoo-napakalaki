// begin BadConsequence.java
package NapakalakiGame;

// Usar arrays
import java.util.ArrayList;

// Clase BadConsequence que representa el mal rollo de los monstruos
public abstract class BadConsequence {
    private String text;
    private int levels;    

    protected BadConsequence(String t, int l) {
        this.text = t;
        this.levels = l;
    }

    public int getLevels() {
        return levels;
    }
    
    public String getText() {
        return text;
    }
    
    abstract public boolean isEmpty();
    
    abstract public void substractVisibleTreasure(Treasure t);
    
    abstract public void substractHiddenTreasure(Treasure t);
    
    abstract public String toDiscard();
    
    abstract public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v,
            ArrayList<Treasure> h); 
    
    public String toString() {
        return "\nDescripción: " + text + "\n Niveles perdidos: " + 
                Integer.toString(levels);
    }
}

// end BadConsequence.java