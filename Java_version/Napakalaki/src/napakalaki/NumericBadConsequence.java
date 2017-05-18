// begin NumericBadConsequence.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;

public class NumericBadConsequence extends BadConsequence {
    // Nº de tesoros visibles perdidos
    private int nVisibleTreasures;
    // Nº de tesoros ocultos perdidos
    private int nHiddenTreasures;
    
    // Constructor tipo 1: tesoros no específcos
    public NumericBadConsequence(String t, int l, int nVisible, int nHidden) {
        super(t, l);
        this.nVisibleTreasures = nVisible;
        this.nHiddenTreasures = nHidden;
    }
    
    public int getNVisibleTreasures() {
        return nVisibleTreasures;
    }
    
    public int getNHiddenTreasures() {
        return nHiddenTreasures;
    }
    
    @Override
    boolean isEmpty() {
        return nVisibleTreasures == 0 && nHiddenTreasures == 0;
    }
    
    @Override
    public void substractVisibleTreasure(Treasure t) {
        if (nVisibleTreasures > 0)
            nVisibleTreasures -= 1;            
    }
    
    @Override
    public void substractHiddenTreasure(Treasure t) {
        if (nHiddenTreasures > 0)
            nHiddenTreasures -= 1;  
    }
    
    @Override
    public BadConsequence adjustToFitTreasureLists(ArrayList<Treasure> v,
            ArrayList<Treasure> h) {
        BadConsequence bd = new NumericBadConsequence(getText(), getLevels(), 
                nVisibleTreasures, nHiddenTreasures);
        if (((NumericBadConsequence) bd).nVisibleTreasures > v.size())
            ((NumericBadConsequence) bd).nVisibleTreasures = v.size();
        if (((NumericBadConsequence) bd).nHiddenTreasures > h.size())
            ((NumericBadConsequence) bd).nHiddenTreasures = h.size();
        return bd;
    }
}

// end NumericBadConsequence.java