// begin PruebaNapakalaki.java
package napakalaki;

// Usar arrays
import java.util.ArrayList;
import java.util.Arrays;

public class PruebaNapakalaki {
    
    // Vector para almacenar todos los monstruos
    static ArrayList<Monster> monsters = new ArrayList();
    
    // Lista los monstruos con poder de combate mayor que 10
    private static ArrayList<Monster> combatLevelOver10() {
        ArrayList<Monster> list = new ArrayList();
        for (Monster monster : monsters)
            if (monster.getCombatLevel() > 10)
                list.add(monster);
        return list;
    }
    
    // Lista los monstruos que solo tienen un mal rollo de perder niveles
    private static ArrayList<Monster> justLoseLevels() {
        ArrayList<Monster> list = new ArrayList();
        for (Monster monster : monsters)
        {
            BadConsequence bC = monster.getBadConsequence();
            if (bC.getNVisibleTreasures() == 0 && bC.getNHiddenTreasures() == 0
                    && bC.getSpecificVisibleTreasures().isEmpty()
                    && bC.getSpecificHiddenTreasures().isEmpty()
                    && !bC.getDeath())
                list.add(monster);
        }
        return list;
    }
    
    // Lista los monstruos que tienen un buen rollo de niveles mayor que 1
    private static ArrayList<Monster> winLevelsOver1() {
        ArrayList<Monster> list = new ArrayList();
        for (Monster monster : monsters)
            if (monster.getPrize().getLevel() > 1)
                list.add(monster);
        return list;
    }
    
    // Lista los monstruos que te hacen perder un tipo específico de tesoro
    // pasado como parámetro
    private static ArrayList<Monster> loseTreasureType(TreasureKind t_type) {
        ArrayList<Monster> list = new ArrayList();
        for (Monster monster : monsters)
        {
            BadConsequence bC = monster.getBadConsequence();
            if (bC.getSpecificVisibleTreasures().contains(t_type) ||
                    bC.getSpecificHiddenTreasures().contains(t_type))
                list.add(monster);               
        }
        return list;
    }
    
    // Rellenamos el vector de monstruos
    private static void createMonsters() {
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
            " primigenio te descartas de tu casco visible.", 1, 
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
        bC = new BadConsequence("Te atrapan para llevarte " +
            "de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible" 
            + " y 1 mano oculta.", 1, 
            new ArrayList(Arrays.asList(TreasureKind.ONEHAND)), 
            new ArrayList(Arrays.asList(TreasureKind.ONEHAND)));
        monsters.add(new Monster("Demonios de Magaluf", 2, bC, prize));

        // El gorrón en el umbral
        prize = new Prize(3, 1);
        bC = new BadConsequence("Pierdes todos tus tesoros visibles.", 1, 
            6, 0);
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
        bC = new BadConsequence("Estos monstruos resultan bastante superficiales" +
            " y te aburren mortalmente. Estás muerto.", true);
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
            + "Estás muerto.", true);
        monsters.add(new Monster("Yskhtihyssg-Goth", 14, bC, prize));

        // Familia feliz
        prize = new Prize(3, 1);
        bC = new BadConsequence("La familia te atrapa. Estás muerto.", true);
        monsters.add(new Monster("Familia feliz", 1, bC, prize));

        // Roboggoth
        prize = new Prize(2, 1);
        bC = new BadConsequence("La quinta directiva primaria " +
            "te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2, 
            new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS)), new ArrayList());
        monsters.add(new Monster("Roboggoth", 8, bC, prize));

        // El espía sordo
        prize = new Prize(1, 1);
        bC = new BadConsequence("Te asusta en la noche. Pierdes " +
            "un casco visible", 1, new ArrayList(Arrays.asList(TreasureKind.HELMET)), 
            new ArrayList());
        monsters.add(new Monster("El espía sordo", 5, bC, prize));

        // Tongue
        prize = new Prize(2, 1);
        bC = new BadConsequence("Menudo susto te llevas. " +
            "Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0);
        monsters.add(new Monster("Tongue", 19, bC, prize));

        // Bicéfalo
        prize = new Prize(2, 1);
        bC = new BadConsequence("Te faltan manos para tanta " +
            "cabeza. Pierdes 3 nivels y tus tesoros visibles de las manos.", 3,
            new ArrayList(Arrays.asList(TreasureKind.BOTHHANDS, 
            TreasureKind.ONEHAND, TreasureKind.ONEHAND)), new ArrayList());
        monsters.add(new Monster("Bicéfalo", 21, bC, prize));
    }
    
    // Imprime la lista de monstruos que se le pasa como argumento
    private static void printMonsters(ArrayList<Monster> list) {
       for (Monster monster : list)
            System.out.println(monster.toString());
    }
    
    public static void main(String[] args) {
        createMonsters();
        System.out.print("Todos los monstruos:" +
                "\n--------------------------------------------------------");
        printMonsters(monsters);
        System.out.print("\nMonstruos que solo hacen perder niveles:" +
                "\n--------------------------------------------------------");
        printMonsters(justLoseLevels());
        System.out.print("\nMonstruos que te hacen ganar mas de un nivel:" +
                "\n--------------------------------------------------------");
        printMonsters(winLevelsOver1());
        System.out.print("\nMonstruos con poder de combate mayor de 10:" +
                "\n--------------------------------------------------------");
        printMonsters(combatLevelOver10());
        System.out.print("\nMonstruos que te hacen perder el casco:" +
                "\n--------------------------------------------------------");
        printMonsters(loseTreasureType(TreasureKind.HELMET));
        System.out.print("\nMonstruos que te hacen perder la armadura:" +
                "\n--------------------------------------------------------");
        printMonsters(loseTreasureType(TreasureKind.ARMOR));
        System.out.print("\nMonstruos que te hacen perder armas de 1 mano:" +
                "\n--------------------------------------------------------");
        printMonsters(loseTreasureType(TreasureKind.ONEHAND));
        System.out.print("\nMonstruos que te hacen perder armas de 2 manos:" +
                "\n--------------------------------------------------------");
        printMonsters(loseTreasureType(TreasureKind.BOTHHANDS));
        System.out.print("\nMonstruos que te hacen perder el calzado:" +
                "\n--------------------------------------------------------");
        printMonsters(loseTreasureType(TreasureKind.SHOES));
    }
}

// end PruebaNapakalaki.java