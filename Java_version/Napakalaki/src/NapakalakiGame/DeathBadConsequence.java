// begin DeathBadConsequence.java
package NapakalakiGame;

public class DeathBadConsequence extends NumericBadConsequence {
    
    public DeathBadConsequence(String t) {
        super(t, Player.MAXLEVEL, NumericBadConsequence.MAXTREASURES, 
                    NumericBadConsequence.MAXTREASURES);
    }
    
    @Override
    public String toString() {
      return super.toString() + "\nEstás Muerto.";
    }
}

// begin DeathBadConsequence.java