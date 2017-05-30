// begin NumericBadConsequence.java
package NapakalakiGame;

// Usar arrays
import java.util.ArrayList;

public class NumericBadConsequence extends BadConsequence {
    // Nº máximo de tesoros
    final static int MAXTREASURES = 10;
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
    public boolean isEmpty() {
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
        int nV = v.size() < nVisibleTreasures ? v.size() : nVisibleTreasures;
        int nH = h.size() < nHiddenTreasures ? h.size() : nHiddenTreasures;
        BadConsequence bd = new NumericBadConsequence(getText(), getLevels(), 
                nV, nH);
        return bd;
    }
    
    @Override
    public String toString() {
        return super.toString() + "\n Tesoros visibles perdidos: "+
                Integer.toString(nVisibleTreasures) + 
                "\n Tesoros ocultos perdidos: " + 
                Integer.toString(nHiddenTreasures);
    }
    
    @Override
    public String toDiscard() {
        return "Visibles: " + Integer.toString(nVisibleTreasures) +
            "\n Ocultos: " + Integer.toString(nHiddenTreasures);
    }
}

// end NumericBadConsequence.java