// begin SpecificBadConsequence.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;

public class SpecificBadConsequence extends BadConsequence {
    // Tesoros visibles específicos perdidos
    private ArrayList<TreasureKind> specificVisibleTreasures = new ArrayList();
    // Tesoros ocultos específicos perdidos
    private ArrayList<TreasureKind> specificHiddenTreasures = new ArrayList();
    
    // Constructor tipo 2: tesoros específicos
    public SpecificBadConsequence(String t, int l, ArrayList<TreasureKind> v,
                               ArrayList<TreasureKind> h) {
        super(t, l);
        this.specificHiddenTreasures = v;
        this.specificVisibleTreasures = h;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures() {
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures() {
        return specificVisibleTreasures;
    }
    
    boolean isEmpty() {
        return specificHiddenTreasures.isEmpty() &&
                specificVisibleTreasures.isEmpty();
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t) {
        if (!specificVisibleTreasures.isEmpty())
            specificVisibleTreasures.remove(t.getType());
    }
    
    @Override
    public void substractHiddenTreasure(Treasure t) {
        if (!specificHiddenTreasures.isEmpty())
            specificHiddenTreasures.remove(t.getType());
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v,
            ArrayList<Treasure> h) {
        BadConsequence bd = new SpecificBadConsequence(getText(), getLevels(), 
                    specificVisibleTreasures, specificHiddenTreasures);
        
        
        return bd;
    }
}

// end SpecificBadConsequence.java