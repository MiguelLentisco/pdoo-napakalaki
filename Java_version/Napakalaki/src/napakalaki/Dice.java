// begin Dice.java
package napakalaki;

// Número aleatorio
import java.util.Random;

// Representación de un dado
public class Dice {

    private static final Dice instance = new Dice();
    private static final Random random = new Random();
   
    private Dice() {
    }
    
    public static Dice getInstance() {
        return instance;
    }
    
    public int nextNumber() {
        return random.nextInt(6) + 1;
    } 
}


// end Dice.java