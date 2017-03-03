// begin PruebaNapakalaki.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;
import java.util.Arrays;

public class PruebaNapakalaki {
    
    // Vector para almacenar todos los monstruos
    static ArrayList<Monster> monsters = new ArrayList();
    
    private static ArrayList<Monster> combatLevelOver10() {
        ArrayList<Monster> list = new ArrayList();
        for (int i = 0; i < monsters.size(); ++i)
            if (monsters.get(i).getCombatLevel() > 10)
                list.add(monsters.get(i));
        return list;
    }
    
    private static ArrayList<Monster> justLooseLevels() {
        ArrayList<Monster> list = new ArrayList();
        for (int i = 0; i < monsters.size(); ++i)
        {
            BadConsequence bC = monsters.get(i).getBadConsequence();
            if (bC.getNVisibleTreasures() == 0 && bC.getNHiddenTreasures() == 0
                    && bC.getSpecificVisibleTreasures().isEmpty() == true
                    && bC.getSpecificHiddenTreasures().isEmpty() == true
                    && bC.getDeath() == false)
                list.add(monsters.get(i));
        }
        return list;
    }
    
    private static ArrayList<Monster> winLevelsOver1() {
        ArrayList<Monster> list = new ArrayList();
        for (int i = 0; i < monsters.size(); ++i)
            if (monsters.get(i).getPrize().getLevel() > 1)
                list.add(monsters.get(i));
        return list;
    }
    
    private static ArrayList<Monster> specificTreasures(TreasureKind t_type) {
        ArrayList<Monster> list = new ArrayList();
        for (int i = 0; i < monsters.size(); ++i)
        {
            BadConsequence bC = monsters.get(i).getBadConsequence();
            Boolean found = false;
            ArrayList<TreasureKind> lv = bC.getSpecificVisibleTreasures();
            ArrayList<TreasureKind> lh = bC.getSpecificHiddenTreasures();
            for (int j = 0; j < lv.size() && !found; ++j)
                found = lv.get(j) == t_type;
            for (int j = 0; j < lh.size() && !found; ++j)
                found = lh.get(j) == t_type;
            if (found)
                list.add(monsters.get(i));
        }
        return list;
    }
    
    
    public static void main(String[] args) {
        
    BadConsequence bC;
    Prize prize;
        
    // 3 Byakhees de bonanza
    prize = new Prize(2, 1);
    bC = new BadConsequence("Pierdes tu armadura visible" +
        " y otra oculta.", 1, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), 
        new ArrayList(Arrays.asList(TreasureKind.ARMOR)));
    monsters.add(new Monster("3 Byakhees de bonanza", 8, bC, prize));
    
    // Tenochtitlan
    prize = new Prize(1,1);
    bC = new BadConsequence("Embobados con el lindo" +
        "primigenio te descartas de tu casco visible.", 1, 
        new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
    monsters.add(new Monster("Tenochtitlan", 2, bC, prize));
    
    // El sopor de Dunwich
    prize = new Prize(1,1);
    bC = new BadConsequence("El primodial bostezo " +
        "contagioso. Pierdes el calzado visible.", 1, 
        new ArrayList(Arrays.asList(TreasureKind.SHOES)), new ArrayList());
    monsters.add(new Monster("El sopor de Dunwich", 2, bC, prize));
    
    // Demonios de Magaluf
    prize = new Prize(4, 1);
    bC = new BadConsequence("Te atrapan para llevarte" +
        "de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible" 
        + " y 1 mano oculta.", 1, 
        new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), 
        new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
    monsters.add(new Monster("Demonios de Magaluf", 2, bC, prize));
    
    // El gorrón en el umbral
    prize = new Prize(3, 1);
    bC = new BadConsequence("Pierdes todos tus tesoros visibles.", 1, 
        Integer.MAX_VALUE, 0);
    monsters.add(new Monster("El gorrón en el umbral", 13, bC, prize));
    
    // H.P. Munchcraft
    prize = new Prize(2, 1);
    bC = new BadConsequence("Pierdes la armadura visible.",
        1, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), new ArrayList());
    monsters.add(new Monster("H.P. Munchcraft", 6, bC, prize));
    
    // Necrófago
    prize = new Prize(1, 1);
    bC = new BadConsequence("Sientes bichos bajo la ropa. Descarta la armadura " 
        + "visible.", 1, new ArrayList(Arrays.asList(TreasureKind.ARMOR)), 
        new ArrayList());
    monsters.add(new Monster("Necrófago", 13, bC, prize));
    
    // El rey de rosado
    prize = new Prize(3, 2);
    bC = new BadConsequence("Pierdes 5 niveles y 3 tesoros visibles.", 5, 3, 0);
    monsters.add(new Monster("El rey de rosado", 11, bC, prize));
    
    // Flecher
    prize = new Prize(1, 1);
    bC = new BadConsequence("Toses los pulmones y pierdes 2 niveles.", 2, 0, 0);
    monsters.add(new Monster("Flecher", 2, bC, prize));
    
    // Los hondos
    prize = new Prize(2, 1);
    bC = new BadConsequence("Estos monstruos resultan bastante superficales" +
        "y te aburren mortalmente. Estas muerto.", true);
    monsters.add(new Monster("Los hondos", 8, bC, prize));
    
    // Semillas Cthulhu
    prize = new Prize(2, 1);
    bC = new BadConsequence("Pierdes 2 niveles y 2 tesoros ocultos.", 2, 0, 2);
    monsters.add(new Monster("Semillas Cthulhu", 4, bC, prize));
    
    // Dameargo
    prize = new Prize(2, 1);
    bC = new BadConsequence("Te intentas escaquear. Pierdes una mano visible.", 
        1, new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), new ArrayList());
    monsters.add(new Monster("Dameargo", 1, bC, prize));
    
    // Pollipólipo volante
    prize = new Prize(2, 1);
    bC = new BadConsequence("Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0);
    monsters.add(new Monster("Pollipólipo volante", 3, bC, prize));
    
    // Yskhtihyssg-Goth
    prize = new Prize(3, 1);
    bC = new BadConsequence("No le hace gracia que pronuncien mal su nombre. "
        + "Estas muerto.", true);
    monsters.add(new Monster("Yskhtihyssg-Goth", 14, bC, prize));
    
    // Familia feliz
    prize = new Prize(3, 1);
    bC = new BadConsequence("La familia te atrapa. Estás muerto.", true);
    monsters.add(new Monster("Familia feliz", 1, bC, prize));
    
    // Roboggoth
    prize = new Prize(2, 1);
    bC = new BadConsequence("La quinta directiva primaria" +
        "te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, 
        new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
    monsters.add(new Monster("Roboggoth", 8, bC, prize));
    
    // El espía sordo
    prize = new Prize(1, 1);
    bC = new BadConsequence("Te asusta en la noche. Pierdes " +
        "un casco visible", 1, new ArrayList(Arrays.asList(TreasureKind.HELMET)), 
        null);
    monsters.add(new Monster("El espía sordo", 5, bC, prize));
    
    // Tongue
    prize = new Prize(2, 1);
    bC = new BadConsequence("Menudo susto te llevas." +
        "Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0);
    monsters.add(new Monster("Tongue", 19, bC, prize));
    
    // Bicéfalo
    prize = new Prize(2, 1);
    bC = new BadConsequence("Te faltan manos para tanta" +
        "cabeza. Pierdes 3 nivels y tus tesoros visibles de las manos.", 3,
        new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS, 
        TreasureKind.ONEHAND, TreasureKind.ONEHAND)), new ArrayList());
    monsters.add(new Monster("Bicéfalo", 21, bC, prize));
    }
}

// end PruebaNapakalaki.java