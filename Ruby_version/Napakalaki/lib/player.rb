# encoding: utf-8
# begin player.rb

require_relative 'treasure'
require_relative 'bad_consequence'
require_relative 'dice'
require_relative 'card_dealer'
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
    
    def setEnemy(e)
      @enemy = e
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

    # Aplica el buen rollo
    def applyPrize(m)
      nLevels = m.getLevelsGained
      incrementLevels(nLevels)
      nTreasures = m.getTreasuresGained
      if nTreasures > 0
        dealer = CardDealer.instance
        (1..nLevels).each do |t|
          treasure = dealer.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end

    # Aplica el mal rollo
    def applyBadConsequence(m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      pendingBad = badConsequence.adjustToFitTreasureList(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end

    # Si se puede pasar el tesoto t de oculto a visible
    def canMakeTreasureVisible(t)
      tType = t.getType
      max = 1
      if tType == TreasureKind::ONEHAND
        max = 2
      end
      nObj = howManyVisibleTreasures(tType)
      nObj < max
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

    # Combate contra el monstruo
    def combat(m)
      myLevel = getCombatLevel
      monsterLevel = getCombatLevel
      
      if !canISteal
        dice = Dice.instance
        number = dice.nextNumber
        if number < 3
          enemyLevel = enemy.getCombatLevel
          monsterLevel += enemyLevel
        end
      end
      
      if myLevel > monsterLevel
        applyPrize(m)
        if @levels >= @@MAXLEVEL
          combatResult = CombatResult::WINGAME
        else
          combatResult = CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        combatResult = CombatResult::LOSE
      end
      combatResult
    end

    # Convierto un tesoro a visible
    def makeTreasuresVisible(t)
      canI = canMakeTreasureVisible(t)
      if canI
        @visibleTreasure << t
        @hiddenTreasure.delete(t)
      end
    end

    # Descarta el tesoro visible
    def discardVisibleTreasure(t)
      @visibleTreasure.delete(t)
      if @pendingBadConsequence != nil and !pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractVisibleTreasure(t)
      end
      dieIfNoTreasures
    end
    
    # Descarta el tesoro oculto
    def discardHiddenTreasure(t)
      @hiddenTreasure.delete(t)
      if @pendingBadConsequence != nil and !pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      dieIfNoTreasures
    end

    # Si está en un estado válido el jugador
    def validState
      if @pendingBadConsequence == nil
        false
      else
        @pendingBadConsequence.isEmpty and @hiddenTreasures.size < 4
      end
    end

    # Inicializo los tesoros del jugador
    def initTreasures
      dealer = CardDealer.instance
      dice = Dice.instance
      bringToLife
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      number = dice.nextNumber
      if number > 1
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
      if number == 6
        treasure = dealer.nextTreasure
        @hiddenTreasures << treasure
      end
    end

    # Robar un tesoro del enemigo
    def stealTreasure
      canI = canISteal
      treasure = nil
      if canI
        canYou = enemy.canYouGiveMeATreasure
        if canYou
          treasure = giveMeATresure
          @hiddenTreasures << treasure
          haveStolen
        end
      end
      treasure
    end

    # Devuelve un tesoro aleatorio
    def giveMeATreasure
      @hiddenTreasures.slice!(rand(@hiddenTreasures.size))
    end

    # Si el jugador puede dar tesoros
    def canYouGiveMeATreasure
      !@visibleTreasures.empty?
    end

    # El jugador ya no puede robar
    def haveStolen
      @canISteal = false
    end

    # Descartar todos los tesoros
    def discardAllTreasures
      @visibleTreasures.each { |treasure| discardVisibleTreasure(treasure)}
      @hiddenTreasures.each { |treasure| discardHiddenTreasure(treasure)}
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