# encoding: utf-8
# begin pruebaNapakalaki.rb

# Includes
# -------------------------------------------------------
require_relative 'treasure_kind'
require_relative 'prize'
require_relative 'bad_consequence'
require_relative 'monster'

require_relative 'dice'
require_relative 'card_dealer'
# -------------------------------------------------------

module NapakalakiGame

# Clase PruebaNapakalaki para probar el juego
class PruebaNapakalaki
  
  # Array de todos los monstruos
  attr_reader :monsters
  
  # Initialize
  def initialize
   @@monsters = []
  end
  
  # Main
  def main
   depuracion    
  end
  
  # Método de Depuración
  # -------------------------------------------------------
  def depuracion
    # Depuración de dice
    dice = Dice.instance
    i = 0
    while ( i < 50)
      puts dice.nextNumber
      i += 1
    end
  
    # Depuración de BadConsequence
    # depurarBadConsequence
    
    # Depuración de CardDealer (y de Treasure y Monster de forma implícita)
    # depurarCardDealer
  end
  
  
  # Depuración de BadConsequence
  def depurarBadConsequence
    bc1 = BadConsequence.newDeath("bc1")
    bc2 = BadConsequence.newLevelNumberOfTreasures("bc2", 0, 2, 3)
    bc3 = BadConsequence.newLevelNumberOfTreasures("bc3", 1, 0, 0)
    bc4 = BadConsequence.newLevelSpecificTreasures("bc4", 4, [TreasureKind::ONEHAND], \
        [TreasureKind::BOTHHANDS])
    bc5 = BadConsequence.newLevelSpecificTreasures("bc5", 4, [], [])
    
    puts bc1.to_s + "\n\n" + bc2.to_s + "\n\n" + bc3.to_s + "\n\n" + bc4.to_s + "\n\n"
    puts bc5.to_s + "\n\n"
    
    if (bc1.isEmpty) 
      puts "bc1 vacia \n"
    else
      puts "bc1 no vacia \n"
    end
    
    if (bc2.isEmpty) 
      puts "bc2 vacia \n"
    else
      puts "bc2 no vacia \n"
    end
    
    if (bc3.isEmpty) 
      puts "bc3 vacia \n"
    else
      puts "bc3 no vacia \n"
    end
    
    if (bc4.isEmpty) 
      puts "bc4 vacia \n"
    else
      puts "bc4 no vacia \n"
    end
    
    if (bc5.isEmpty) 
      puts "bc5 vacia \n"
    else
      puts "bc5 no vacia \n"
    end
  end
  
  # Depuración de CardDealer (y de Treasure y Monster de forma implícita)
  def depurarCardDealer
    cd = CardDealer.instance
   
    cd.initTreasuresCardDeck #Este método en realidad son privados, está publico para la depuración
    cd.shuffleTreasures #Este método en realidad son privados, está publico para la depuración
    printList(cd.unusedTreasures)
    
    cd.giveTreasureBack(Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET))
    printList(cd.usedTreasures)
    
    cd.initMonstersCardDeck #Este método en realidad son privados, está publico para la depuración
    cd.shuffleMonsters #Este método en realidad son privados, está publico para la depuración
    printList(cd.unusedMonsters)
    
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles.", 1, 6, 0)
    cd.giveMonsterBack(Monster.new("El gorrón en el umbral", 13, bC, Prize.new(3, 1)))
    printList(cd.usedMonsters)
  end
  
  # -------------------------------------------------------
  
  # Lista todos los monstruos que tengan un nivel de combate superior a 10
  def combatLevelOver10
    @@monsters.select { |monster| monster.combatLevel > 10}
  end
  
  # Lista todos los monstruos que tengan un mal rollo que implique sólo pérdida
  # de niveles
  def justLoseLevels
    @@monsters.select {|monster| monster.badConsequence.nVisibleTreasures == 0 and
        monster.badConsequence.nHiddenTreasures == 0 and 
        monster.badConsequence.specificVisibleTreasures.empty? and
        monster.badConsequence.specificHiddenTreasures.empty? and 
        !monster.badConsequence.death }
  end
 
  # Lista todos los monstruos que tengan un buen rollo que indique una ganacia
  # de niveles superior a 1
  def winLevelsOver1
    @@monsters.select { |monster| monster.prize.level > 1}
  end
  
  # Lista todos los monstruos que tengan un mal rollo que suponga la pérdida
  # del tipo de tesoro que se pasa como parámetro, ya sean visibles y/o ocultos
  def loseTreasureType(treasureType)
    @@monsters.select { |monster| 
      monster.badConsequence.specificVisibleTreasures.include?(treasureType) or
      monster.badConsequence.specificHiddenTreasures.include?(treasureType) }
  end
  
  # Imprime una lista
  def printList(list)
    list.each {|element| puts element }
  end
  
  # Métodos privados
  # -------------------------------------------------------
  
  private :loseTreasureType
  private :printList
  private :winLevelsOver1
  private :justLoseLevels
  private :combatLevelOver10
  
  # -------------------------------------------------------
end

PruebaNapakalaki.new.main

end 
# end pruebaNapakalaki.rb