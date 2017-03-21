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
require_relative 'player'
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
      Dice.depurar

      # Depuración de BadConsequence
      BadConsequence.depurar

      # Depuración de CardDealer (y de Treasure y Monster de forma implícita)
      CardDealer.depurar

      # Depuración de player
      Player.depurar
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

    # Métodos privados
    # -------------------------------------------------------

    private :loseTreasureType
    #private :printList
    private :winLevelsOver1
    private :justLoseLevels
    private :combatLevelOver10

    # -------------------------------------------------------
  end

  PruebaNapakalaki.new.main
end 
# end pruebaNapakalaki.rb