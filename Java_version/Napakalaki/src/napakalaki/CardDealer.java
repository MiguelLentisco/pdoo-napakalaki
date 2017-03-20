// begin CardDealer.java
package napakalaki;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Arrays;

// Representación del dealer
public class CardDealer {
    
    private static final CardDealer instance = new CardDealer();
    private ArrayList<Monster> unusedMonsters = new ArrayList();
    private ArrayList<Monster> usedMonsters = new ArrayList();
    private ArrayList<Treasure> unusedTreasures = new ArrayList();
    private ArrayList<Treasure> usedTreasures = new ArrayList();
    
    private CardDealer() {
    }
    
    private void initTreasureCardDeck() {
        // ¡Sí mi amo!
        unusedTreasures.add(new Treasure("¡Sí mi amo!", 4, 
                TreasureKind.HELMET));
        
        // Botas de investigación
        unusedTreasures.add(new Treasure("Botas de investigación", 4, 
                TreasureKind.SHOE));
        
        // Capucha de Cthulhu
        unusedTreasures.add(new Treasure("Capucha de Cthulhu", 3, 
                TreasureKind.HELMET));
        
        // A prueba de babas
        unusedTreasures.add(new Treasure("A prueba de babas", 2, 
                TreasureKind.ARMOR));
        
        // Botas de lluvia ácida
        unusedTreasures.add(new Treasure("Botas de lluvia ácida", 1, 
                TreasureKind.BOTHHANDS));
        
        // Casco minero
        unusedTreasures.add(new Treasure("Casco minero", 2, 
                TreasureKind.HELMET));
        
        // Ametralladora ACME
        unusedTreasures.add(new Treasure("Ametralladora ACME", 4, 
                TreasureKind.BOTHHANDS));
        
        // Camiseta de la ETSIIT
        unusedTreasures.add(new Treasure("Camiseta de la ETSIIT", 1, 
                TreasureKind.ARMOR));
        
        // Clavo de rail ferroviario
        unusedTreasures.add(new Treasure("Clavo de rail ferroviario", 3, 
                TreasureKind.ONEHAND));
        
        // Cuchillo de sushi arcano
        unusedTreasures.add(new Treasure("Cuchillo de sushi arcano", 2, 
                TreasureKind.ONEHAND));
        
        // Fez alópodo
        unusedTreasures.add(new Treasure("Fez alópodo", 3, 
                TreasureKind.HELMET));
        
        // Hacha prehistórica
        unusedTreasures.add(new Treasure("Hacha prehistórica", 2, 
                TreasureKind.ONEHAND));
        
        // El aparato del Pr. Tesla
        unusedTreasures.add(new Treasure("El aparato del Pr. Tesla", 4, 
                TreasureKind.ARMOR));
        
        // Gaita
        unusedTreasures.add(new Treasure("Gaita", 4, TreasureKind.BOTHHANDS));
        
        // Insecticida
        unusedTreasures.add(new Treasure("Insecticida", 2, 
                TreasureKind.ONEHAND));
        
        // Escopeta de 3 cañones
        unusedTreasures.add(new Treasure("Escopeta de 3 cañones", 4, 
                TreasureKind.BOTHHANDS));
        
        // Garabato místico
        unusedTreasures.add(new Treasure("Garabato místico", 2, 
                TreasureKind.ONEHAND));
        
        // La rebeca mística
        unusedTreasures.add(new Treasure("La rebeca mística", 2, 
                TreasureKind.ARMOR));
        
        // Lanzallamas
        unusedTreasures.add(new Treasure("Lanzallamas", 4, 
                TreasureKind.BOTHHANDS));
        
        // Necrocomicón
        unusedTreasures.add(new Treasure("Necrocomicón", 1, 
                TreasureKind.ONEHAND));
        
        // Necronomicón
        unusedTreasures.add(new Treasure("Necronomicón", 5, 
                TreasureKind.BOTHHANDS));
        
        // Linterna a 2 manos
        unusedTreasures.add(new Treasure("Linterna a 2 manos", 3, 
                TreasureKind.BOTHHANDS));
        
        // Necrognomicón
        unusedTreasures.add(new Treasure("Necrognomicón", 2, 
                TreasureKind.ONEHAND));
        
        // Necrotelecom
        unusedTreasures.add(new Treasure("Necrotelecom", 2, 
                TreasureKind.HELMET));
        
        // Mazo de los antiguos
        unusedTreasures.add(new Treasure("Mazo de los antiguos", 3, 
                TreasureKind.ONEHAND));
        
        // Necroplayboycón
        unusedTreasures.add(new Treasure("Necroplayboycón", 3, 
                TreasureKind.ONEHAND));
        
        // Porra preternatural
        unusedTreasures.add(new Treasure("Porra preternatural", 2, 
                TreasureKind.ONEHAND));
        
        // Shogulador
        unusedTreasures.add(new Treasure("Shogulador", 1, 
                TreasureKind.BOTHHANDS));
        
        // Varita de atizamiento
        unusedTreasures.add(new Treasure("Varita de atizamiento", 3, 
                TreasureKind.ONEHAND));
        
        // Tentáculo de pega
        unusedTreasures.add(new Treasure("Tentáculo de pega", 2, 
                TreasureKind.HELMET));
        
        // Zapato deja-amigos
        unusedTreasures.add(new Treasure("Zapato deja-amigos", 1, 
                TreasureKind.SHOE));
    }
    
    private void initMonsterCardDeck() {
        BadConsequence bC;
        Prize prize;

        // 3 Byakhees de bonanza
        prize = new Prize(2, 1);
        bC = new BadConsequence("Pierdes tu armadura visible" +
            " y otra oculta.", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), 
            new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
        unusedMonsters.add(new Monster("3 Byakhees de bonanza", 8, bC, prize));

        // Tenochtitlan
        prize = new Prize(1,1);
        bC = new BadConsequence("Embobados con el lindo" +
            " primigenio te descartas de tu casco visible.", 0, 
            new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        unusedMonsters.add(new Monster("Tenochtitlan", 2, bC, prize));

        // El sopor de Dunwich
        prize = new Prize(1,1);
        bC = new BadConsequence("El primodial bostezo " +
            "contagioso. Pierdes el calzado visible.", 0, 
            new ArrayList(Arrays.asList(TreasureKind.SHOE)), new ArrayList());
        unusedMonsters.add(new Monster("El sopor de Dunwich", 2, bC, prize));

        // Demonios de Magaluf
        prize = new Prize(4, 1);
        bC = new BadConsequence("Te atrapan para llevarte " +
            "de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible" 
            + " y 1 mano oculta.", 0, 
            new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), 
            new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        unusedMonsters.add(new Monster("Demonios de Magaluf", 2, bC, prize));

        // El gorrón en el umbral
        prize = new Prize(3, 1);
        bC = new BadConsequence("Pierdes todos tus tesoros visibles.", 0, 
                BadConsequence.MAXTREASURES, 0);
        unusedMonsters.add(new Monster("El gorrón en el umbral", 13, bC, prize));

        // H.P. Munchcraft
        prize = new Prize(2, 1);
        bC = new BadConsequence("Pierdes la armadura visible.",
            0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
        unusedMonsters.add(new Monster("H.P. Munchcraft", 6, bC, prize));

        // Necrófago
        prize = new Prize(1, 1);
        bC = new BadConsequence("Sientes bichos bajo la ropa. Descarta la armadura " 
            + "visible.", 0, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), 
            new ArrayList());
        unusedMonsters.add(new Monster("Necrófago", 13, bC, prize));

        // El rey de rosado
        prize = new Prize(3, 2);
        bC = new BadConsequence("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0);
        unusedMonsters.add(new Monster("El rey de rosado", 11, bC, prize));

        // Flecher
        prize = new Prize(1, 1);
        bC = new BadConsequence("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0);
        unusedMonsters.add(new Monster("Flecher", 2, bC, prize));

        // Los hondos
        prize = new Prize(2, 1);
        bC = new BadConsequence("Estos monstruos resultan bastante superficiales" +
            " y te aburren mortalmente. Estás muerto.", true);
        unusedMonsters.add(new Monster("Los hondos", 8, bC, prize));

        // Semillas Cthulhu
        prize = new Prize(2, 1);
        bC = new BadConsequence("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2);
        unusedMonsters.add(new Monster("Semillas Cthulhu", 4, bC, prize));

        // Dameargo
        prize = new Prize(2, 1);
        bC = new BadConsequence("Te intentas escaquear. Pierdes una mano visible.", 
            0, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
        unusedMonsters.add(new Monster("Dameargo", 1, bC, prize));

        // Pollipólipo volante
        prize = new Prize(2, 1);
        bC = new BadConsequence("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0);
        unusedMonsters.add(new Monster("Pollipólipo volante", 3, bC, prize));

        // Yskhtihyssg-Goth
        prize = new Prize(3, 1);
        bC = new BadConsequence("No le hace gracia que pronuncien mal su nombre. "
            + "Estás muerto.", true);
        unusedMonsters.add(new Monster("Yskhtihyssg-Goth", 14, bC, prize));

        // Familia feliz
        prize = new Prize(3, 1);
        bC = new BadConsequence("La familia te atrapa. Estás muerto.", true);
        unusedMonsters.add(new Monster("Familia feliz", 1, bC, prize));

        // Roboggoth
        prize = new Prize(2, 1);
        bC = new BadConsequence("La quinta directiva primaria " +
            "te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, 
            new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        unusedMonsters.add(new Monster("Roboggoth", 8, bC, prize));

        // El espía sordo
        prize = new Prize(1, 1);
        bC = new BadConsequence("Te asusta en la noche. Pierdes " +
            "un casco visible", 0, new ArrayList(Arrays.asList(TreasureKind.HELMET)), 
            new ArrayList());
        unusedMonsters.add(new Monster("El espía sordo", 5, bC, prize));

        // Tongue
        prize = new Prize(2, 1);
        bC = new BadConsequence("Menudo susto te llevas. " +
            "Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0);
        unusedMonsters.add(new Monster("Tongue", 19, bC, prize));

        // Bicéfalo
        prize = new Prize(2, 1);
        bC = new BadConsequence("Te faltan manos para tanta " +
            "cabeza. Pierdes 3 nivels y tus tesoros visibles de las manos.", 3,
            new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS, 
            TreasureKind.ONEHAND, TreasureKind.ONEHAND)), new ArrayList());
        unusedMonsters.add(new Monster("Bicéfalo", 21, bC, prize));
  
    }
    
    private void shuffleTreasures() {
        Collections.shuffle(unusedTreasures);
    }
    
    private void shuffleMonsters() {
        Collections.shuffle(unusedMonsters);
    }
    
    public static CardDealer getInstance() {
        return instance;
    }
    
    public Treasure nextTreasure() {
        
    }
    
    public Monster nextMonster() {
        
    }
    
    public void giveTreasureBack(Treasure t) {
        usedTreasures.add(t);
    }
    
    public void giveMonsterBack(Monster m) {
        usedMonsters.add(m);
    }
    
    public void initCards() {
        
    }
    
}

// end CardDealer.java