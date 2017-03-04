# begin pruebaNapakalaki.rb

# Includes
# -------------------------------------------------------
require_relative 'treasure_kind'
require_relative "prize"
require_relative 'bad_consequence'
require_relative 'monster'
# -------------------------------------------------------

# Clase PruebaNapakalaki para probar el juego
class PruebaNapakalaki
  
  # Array de todos los monstruos
  attr_reader :monsters
  
  # "Main"
  def initialize
    createMonsters
    puts "Monstruos que solo hacen perder niveles: "
    printMonsters(justLooseLevels)   
    puts "\nMonstruos que te hacen ganar mas de un nivel: "
    printMonsters(winLevelsOver1)
    puts "\nMonstruos con poder de combate mayor de 10: "
    printMonsters(combatLevelOver10)
    puts "\nMonstruos que te hacen perder el casco: "
    printMonsters(looseTreasureType(TreasureKind::HELMET))
    puts "\nMonstruos que te hacen perder la armadura: "
    printMonsters(looseTreasureType(TreasureKind::ARMOR))
    puts "\nMonstruos que te hacen perder armas de 1 mano: "
    printMonsters(looseTreasureType(TreasureKind::ONEHAND))
    puts "\nMonstruos que te hacen perder armas de 2 manos: "
    printMonsters(looseTreasureType(TreasureKind::BOTHHANDS))
    puts "\nMonstruos que te hacen perder el calzado: "
    printMonsters(looseTreasureType(TreasureKind::SHOES))

  end
  
  # Crea todos los monstruos y los mete en el array
  private def createMonsters
     @@monsters = Array.new
    
    # 3 Byakhees de bonanza
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible" \
        " y otra oculta.", 1, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    @@monsters << Monster.new("3 Byakhees de bonanza", 8, prize, bC)
    
    # Tenochtitlan
    prize = Prize.new(1,1)
    bC = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo " \
        "primigenio te descartas de tu casco visible.", 1, [TreasureKind::ARMOR], 
        [])
    @@monsters << Monster.new("Tenochtitlan", 2, prize, bC)
    
    # El sopor de Dunwich
    prize = Prize.new(1,1)
    bC = BadConsequence.newLevelSpecificTreasures("El primodial bostezo " \
        "contagioso. Pierdes el calzado visible.", 1, [TreasureKind::SHOES], [])
    @@monsters << Monster.new("El sopor de Dunwich", 2, prize, bC)
    
    # Demonios de Magaluf
    prize = Prize.new(4, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte " \
        "de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible" \
        " y 1 mano oculta.", 1, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    @@monsters << Monster.new("Demonios de Magaluf", 2, prize, bC)
    
    # El gorrón en el umbral
    prize = Prize.new(3, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros " \
        "visibles.", 1, 6, 0)
    @@monsters << Monster.new("El gorrón en el umbral", 13, prize, bC)
    
    # H.P. Munchcraft
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",
        1, [TreasureKind::ARMOR], [])
    @@monsters << Monster.new("H.P. Munchcraft", 6, prize, bC)
    
    # Necrófago
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa." \
        " Descarta la armadura visible.", 1, [TreasureKind::ARMOR], [])
    @@monsters << Monster.new("Necrófago", 13, prize, bC)
    
    # El rey de rosado
    prize = Prize.new(3, 2)
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3" \
        " tesoros visibles.", 5, 3, 0)
    @@monsters << Monster.new("El rey de rosado", 11, prize, bC)
    
    # Flecher
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y " \
        "pierdes 2 niveles.", 2, 0, 0)
    @@monsters << Monster.new("Flecher", 2, prize, bC)
    
    # Los hondos
    prize = Prize.new(2, 1)
    bC = BadConsequence.newDeath("Estos monstruos resultan bastante " \
        "superficiales y te aburren mortalmente. Estas muerto.")
    @@monsters << Monster.new("Los hondos", 8, prize, bC)
    
    # Semillas Cthulhu
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 "\
        "tesoros ocultos.", 2, 0, 2)
    @@monsters << Monster.new("Semillas Cthulhu", 4, prize, bC)
    
    # Dameargo
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear." \
        " Pierdes una mano visible.", 1, [TreasureKind::ONEHAND], [])
    @@monsters << Monster.new("Dameargo", 1, prize, bC)
    
    # Pollipólipo volante
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes" \
        " 3 niveles.", 3, 0, 0)
    @@monsters << Monster.new("Pollipólipo volante", 3, prize, bC)
    
    # Yskhtihyssggoth
    prize = Prize.new(3, 1)
    bC = BadConsequence.newDeath("No le hace gracia que pronuncien mal su " \
        "nombre. Estas muerto.")
    @@monsters << Monster.new("Yskhtihyssggoth", 14, prize, bC)
    
    # Familia feliz
    prize = Prize.new(3, 1)
    bC = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
    @@monsters << Monster.new("Familia feliz", 1, prize, bC)
    
    # Roboggoth
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria" \
        " te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2,
        [TreasureKind::BOTHHANDS], [])
    @@monsters << Monster.new("Roboggoth", 8, prize, bC)
    
    # El espía sordo
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. " \
        "Pierdes un casco visible.", 1, [TreasureKind::HELMET], [])
    @@monsters << Monster.new("El espía sordo", 5, prize, bC)
    
    # Tongue
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas." \
        " Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
    @@monsters << Monster.new("Tongue", 19, prize, bC)
    
    # Bicéfalo
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta" \
        " cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3,
        [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, 
        TreasureKind::ONEHAND], [])
    @@monsters << Monster.new("Bicéfalo", 21, prize, bC)
  end
  
  # Lista todos los monstruos que tengan un nivel de combate superior a 10
  private def combatLevelOver10
    @@monsters.select { |monster| monster.combatLevel > 10}
  end
  
  # Lista todos los monstruos que tengan un mal rollo que implique sólo pérdida
  # de niveles
  private def justLooseLevels
    @@monsters.select {|monster| monster.badConsequence.nVisibleTreasures == 0 and
        monster.badConsequence.nHiddenTreasures == 0 and 
        monster.badConsequence.specificVisibleTreasures.empty? and
        monster.badConsequence.specificHiddenTreasures.empty? and 
        !monster.badConsequence.death }
  end
 
  # Lista todos los monstruos que tengan un buen rollo que indique una ganacia
  # de niveles superior a 1
  private def winLevelsOver1
    @@monsters.select { |monster| monster.prize.level > 1}
  end
  
  # Lista todos los monstruos que tengan un mal rollo que suponga la pérdida
  # del tipo de tesoro que se pasa como parámetro, ya sean visibles y/o ocultos
  private def looseTreasureType(treasureType)
    @@monsters.select { |monster| 
      monster.badConsequence.specificVisibleTreasures.include?(treasureType) or
      monster.badConsequence.specificHiddenTreasures.include?(treasureType) }
  end
  
  # Imprime la lista de monstruos que se la pasa como parámetro
  private def printMonsters(monsters)
    monsters.each {|monster| puts monster }
  end
  
end

PruebaNapakalaki.new

# end pruebaNapakalaki.rb