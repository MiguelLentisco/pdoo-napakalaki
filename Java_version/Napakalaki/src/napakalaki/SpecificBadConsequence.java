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
        this.specificVisibleTreasures = v;
        this.specificHiddenTreasures = h;
    }
    
    public ArrayList<TreasureKind> getSpecificHiddenTreasures() {
        return specificHiddenTreasures;
    }
    
    public ArrayList<TreasureKind> getSpecificVisibleTreasures() {
        return specificVisibleTreasures;
    }
    
    @Override
    public boolean isEmpty() {
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
        
        ArrayList<TreasureKind> vTType = new ArrayList();
        ArrayList<TreasureKind> hTType = new ArrayList();
        for (Treasure t: v)
            vTType.add(t.getType());
        for (Treasure t: h)
            hTType.add(t.getType());

        vTType.retainAll(specificVisibleTreasures);
        hTType.retainAll(specificHiddenTreasures);
        
        BadConsequence bd = new SpecificBadConsequence(getText(), getLevels(), 
                    vTType, hTType);
        return bd;
    }
    
    @Override
    public String toString() {
        return super.toString() + "\n Tesoros visibles perdidos: " +
                specificVisibleTreasures.toString() +
                "\nTesoros ocultos perdidos: " +
                specificHiddenTreasures.toString();
    }
    
    @Override
    public String toDiscard() {
        return "Visibles: " + specificVisibleTreasures.toString() +
            "\n Ocultos: " + specificHiddenTreasures.toString();
    }
}

// end SpecificBadConsequence.java