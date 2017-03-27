# encoding: utf-8
# begin player.rb

require_relative 'treasure'
require_relative 'bad_consequence'
require_relative 'dice'
require_relative 'combat_result'

module NapakalakiGame
  # Clase Player que representa un jugador
  class Player
    # Attr / datos miembro
    # -------------------------------------------------------
    
    @@MAXLEVEL = 10                     # Número máximo de niveles

    #attr_reader :name                  # Nombre del jugador            
    #attr_reader :level                 # Nivel del jugador
    #attr_reader :visibleTreasures      # Tesoros visibles del jugador
    #attr_reader :hiddenTreasures       # Tesoros ocultos del jugador
    #attr_writer :enemy                 # Archienemigo del jugador
    
    # -------------------------------------------------------
   
    # Constructor
    # -------------------------------------------------------
    
    def initialize(name)
      @name = name
      @level = 1
      @dead = true
      @canISteal = true
      @enemy = nil
      @visibleTreasures = []
      @hiddenTreasures = []
      @pendingBadConsequence = nil
    end
    
    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def self.getMaxLevel
      @@MAXLEVEL
    end
    
    def getName
      @name
    end
    
    def getLevels
      @level
    end
    
    def isDead
      @dead
    end
    
    def canISteal
      @canISteal
    end
    
    def getHiddenTreasures
      @hiddenTreasures
    end

    def getVisibleTreasures
      @visibleTreasures
    end
 
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Aplica un nuevo mal rollo
    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end
    
    # El poder de combate total del jugador
    def getCombatLevel
      bonus = @level
      @visibleTreasures.each {|treasure| bonus += treasure.getBonus }
      bonus
    end

    # Resucita
    def bringToLife
      @dead = false
    end

    # Incrementa 'l' niveles
    def incrementLevels(l)
      @level += l
      if (@level > 10)
        @level = 10
      end
    end

    # Decrementa 'l' niveles
    def decrementLevels(l)
      @level -= l
      if (@level < 1)
        @level = 1
      end
    end

    def applyPrize(m)

    end

    def applyBadConsequence(m)

    end

    def canMakeTreasureVisible(t)

    end

    # Devuelve el numero de tipos de tesoro pasado que tiene el jugador
    def howManyVisibleTreasures(tKind)
      var = 0
      @visibleTreasures.each { |treasure| 
        if treasure.getType == tKind
          var += 1 
        end
      }
      var
    end

    # Si no tiene tesoros mata al jugador
    def dieIfNoTreasures
      if (@visibleTreasures.empty? and @hiddenTreasures.empty?)
        @dead = true
      end
    end

    def combat(m)

    end

    def makeTreasureVisible(t)

    end

    def discardVisibleTreasure(t)

    end

    def discardHiddenTreasure(t)

    end

    # Si está en un estado válido el jugador
    def validState
      @pendingBadConsequence.isEmpty and @hiddenTreasures.size < 4
    end

    def initTreasures

    end

    def stealTreasure

    end

    def giveMeATreasure

    end

    # Si el jugador puede dar tesoros
    def canYouGiveMeATreasure
      !@visibleTreasures.empty?
    end

    # El jugador ya no puede robar
    def haveStolen
      @canISteal = false
    end

    def discardAllTreasures

    end
    
    # -------------------------------------------------------
    
    # Métodos privados
    # -------------------------------------------------------
    
    private :bringToLife
    private :getCombatLevel
    private :incrementLevels
    private :decrementLevels
    private :setPendingBadConsequence
    private :applyPrize
    private :applyBadConsequence
    private :canMakeTreasureVisible
    private :howManyVisibleTreasures
    private :dieIfNoTreasures
    private :giveMeATreasure
    private :canYouGiveMeATreasure
    private :haveStolen
    
    # ---------------------------------------------------
  end
end

# end player.rb