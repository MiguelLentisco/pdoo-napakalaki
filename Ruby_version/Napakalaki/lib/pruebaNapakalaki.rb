# encoding: utf-8
# begin pruebaNapakalaki.rb

require_relative 'napakalaki' # Incluye todo (creo)

module NapakalakiGame
  # Clase PruebaNapakalaki para probar el juego
  class PruebaNapakalaki
    # Attr / datos miembro
    # -------------------------------------------------------
    
    @@monsters = []       # Mazo de monstruos
    
    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def self.getMonsters
      @@monsters
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Main
    def main
     depuracion    
    end
    
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
    
    # -------------------------------------------------------
    
    # Métodos privados
    # -------------------------------------------------------

    private :loseTreasureType
    private :winLevelsOver1
    private :justLoseLevels
    private :combatLevelOver10

    # -------------------------------------------------------

    # Método de Depuración
    # -------------------------------------------------------
    def depuracion
      # Depuración de dice
      Dice.depurar

      # Depuración de BadConsequence
      BadConsequence.depurar

      # Depuración de CardDealer (y de Treasure y Monster de forma implícita)
      CardDealer.depurar

      # Depuración de player
      Player.depurar
    end

    # -------------------------------------------------------
  end
  
  PruebaNapakalaki.new.main
end 

# end pruebaNapakalaki.rb