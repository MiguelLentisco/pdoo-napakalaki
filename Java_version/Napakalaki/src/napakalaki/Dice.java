// begin Dice.java
package napakalaki;

// Número aleatorio
import java.util.Random;

// Representación de un dado
public class Dice {
    
    private static final Dice instance = null;
    private static final Random random = new Random();
   
    private Dice() {
        
    }
    
    public static Dice getInstance() {
        
    }
    
    int nextNumber() {
        return random.nextInt(7);
    } 
}


// end Dice.java