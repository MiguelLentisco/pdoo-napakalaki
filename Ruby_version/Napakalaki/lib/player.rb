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
    #attr_accesor :visibleTreasures      # Tesoros visibles del jugador
    #attr_reader :hiddenTreasures       # Tesoros ocultos del jugador
    #attr_accesor :enemy                 # Archienemigo del jugador
    
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
=begin    
    def initialize(name, l, d, cIS, e, vT, hT, pBC)
      @name = name
      @level = l
      @dead = d
      @canISteal = cIS
      @enemy = e
      @visibleTreasures = vT
      @hiddenTreasures = hT
      @pendingBadConsequence = pBC
    end
    
    def self.newJugador(name)
      new(name, 1, true, true, nil, [], [], nil)
    end
    
    # Si va a ser reemplazado no hace falta hacer copia profunda
    def self.copyJugador(player)
      new(player.getName, player.getLevels, player.canISteal, player.enemy,
        Marshal.load(Marshal.dump(player.getVisibleTreasures)),
        Marshal.load(Marshal.dump(player.getHiddenTreasures)))
    end
=end
    
    def copyPlayer(player)
      @name = player.getName
      @level = player.getLevels
      @dead = player.isDead
      @canISteal = player.canISteal
      @enemy = player.getEnemy
      @visibleTreasures = player.getVisibleTreasures
      @hiddenTreasures = player.getHiddenTreasures
      @pendingBadConsequence = player.getPendingBadConsequence
    end
    
    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def self.MAXLEVEL
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
    
    def getEnemy
      @enemy
    end
    
    def getPendingBadConsequence
      @pendingBadConsequence
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
    
    # El nivel del oponente
    def getOponentLevel(m)
      m.getCombatLevel
    end
    
    # Si se convierte en sectario
    def shouldConvert
      Dice.instance.nextNumber == 6
    end

    # Incrementa 'l' niveles
    def incrementLevels(l)
      @level += l
      if (@level > @@MAXLEVEL)
        @level = @@MAXLEVEL
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
      incrementLevels(m.getLevelsGained)
      nTreasures = m.getTreasuresGained
      if nTreasures > 0
        for i in (1..nTreasures)
          treasure = CardDealer.instance.nextTreasure
          @hiddenTreasures << treasure
        end
      end
    end

    # Aplica el mal rollo
    def applyBadConsequence(m)
      badConsequence = m.getBadConsequence
      nLevels = badConsequence.getLevels
      decrementLevels(nLevels)
      pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBad)
    end

    # Si se puede pasar el tesoro t de oculto a visible
    def canMakeTreasureVisible(t)
      tType = t.getType
      case tType
      when TreasureKind::ONEHAND then
        howManyVisibleTreasures(TreasureKind::BOTHHANDS) == 0 and howManyVisibleTreasures(tType) < 2
      when TreasureKind::BOTHHANDS then
        howManyVisibleTreasures(TreasureKind::ONEHAND) == 0 and howManyVisibleTreasures(tType) < 1
      else
        howManyVisibleTreasures(tType) < 1
      end
    end

    # Devuelve el numero de tipos de tesoro pasado que tiene el jugador
    def howManyVisibleTreasures(tKind)  
      @visibleTreasures.count { |treasure| treasure.getType == tKind }
    end

    # Si no tiene tesoros mata al jugador
    def dieIfNoTreasures
      if @visibleTreasures.empty? and @hiddenTreasures.empty?
        @dead = true
      end
    end

    # Combate contra el monstruo
    def combat(m)
      myLevel = getCombatLevel
      monsterLevel = getOponentLevel(m)
      
      if !canISteal and Dice.instance.nextNumber < 3
        monsterLevel += @enemy.getCombatLevel
      end
      
      if myLevel > monsterLevel
        applyPrize(m)
        if @level >= @@MAXLEVEL
          combatResult = CombatResult::WINGAME
        else
          combatResult = CombatResult::WIN
        end
      else
        applyBadConsequence(m)
        if shouldConvert
          combatResult = CombatResult::LOSEANDCONVERT
        else
          combatResult = CombatResult::LOSE
        end
      end
    end

    # Convierto un tesoro a visible
    def makeTreasureVisible(t)
      if canMakeTreasureVisible(t)
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
      end
    end

    # Descarta el tesoro visible
    def discardVisibleTreasure(t)
      @visibleTreasures.delete(t)
      if @pendingBadConsequence != nil and !@pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractVisibleTreasure(t)
      end
      dieIfNoTreasures
    end
    
    # Descarta el tesoro oculto
    def discardHiddenTreasure(t)
      @hiddenTreasures.delete(t)
      if @pendingBadConsequence != nil and !@pendingBadConsequence.isEmpty
        @pendingBadConsequence.substractHiddenTreasure(t)
      end
      dieIfNoTreasures
    end

    # Si está en un estado válido el jugador
    def validState
      @pendingBadConsequence == nil or (@pendingBadConsequence.isEmpty and 
        @hiddenTreasures.size <= 4)
    end

    # Inicializo los tesoros del jugador
    def initTreasures
      dealer = CardDealer.instance
      bringToLife
      treasure = dealer.nextTreasure
      @hiddenTreasures << treasure
      number = Dice.instance.nextNumber
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
      treasure = nil
      if canISteal and @enemy.canYouGiveMeATreasure
        treasure = @enemy.giveMeATreasure
        @hiddenTreasures << treasure
        haveStolen
      end
      treasure
    end

    # Devuelve un tesoro aleatorio
    def giveMeATreasure
      @hiddenTreasures.delete(@hiddenTreasures.sample)
    end

    # Si el jugador puede dar tesoros
    def canYouGiveMeATreasure
      !@hiddenTreasures.empty?
    end

    # El jugador ya no puede robar
    def haveStolen
      @canISteal = false
    end

    # Descartar todos los tesoros
    def discardAllTreasures
      @visibleTreasures.reverse_each { |treasure| discardVisibleTreasure(treasure)}
      @hiddenTreasures.reverse_each { |treasure| discardHiddenTreasure(treasure)}
    end
    
    def to_s
      mensaje = "\n Nombre: #{@name}\n Nivel: #{@level}\n Poder de combate: #{getCombatLevel}\n ¿Puedo robar?: #{@canISteal}"
      if @enemy != nil
        mensaje += "\n Enemigo: #{@enemy.getName}"
      else
        mensaje += "\n Sin enemigo."
      end
      if @pendingBadConsequence != nil and !@pendingBadConsequence.isEmpty
        mensaje += "\n Mal rollo pendiente: " + @pendingBadConsequence.malRolloString
      else
        mensaje += "\n Sin mal rollo pendiente."
      end
      mensaje
    end
    
    def completo
      mensaje = "\n Nombre: #{@name}\n Nivel: #{@level}\n Poder de combate: #{getCombatLevel}\n ¿Puedo robar?: #{@canISteal}"
      if @enemy != nil
        mensaje += "\n Enemigo: #{@enemy.getName}"
      else
        mensaje += "\n Sin enemigo."
      end
      if @pendingBadConsequence != nil and !@pendingBadConsequence.isEmpty
        mensaje += "\n Mal rollo pendiente: " + @pendingBadConsequence.malRolloString
      else
        mensaje += "\n Sin mal rollo pendiente."
      end
      mensaje += "\n Tesoros visibles equipados: "
      @visibleTreasures.each { |t| mensaje += t.to_s }
      mensaje += "\n Tesoros ocultos equipados: "
      @hiddenTreasures.each { |t| mensaje += t.to_s }
      mensaje
    end
    
    # -------------------------------------------------------
    
    # Métodos privados
    # -------------------------------------------------------
    
    private :bringToLife
    protected :getCombatLevel
    private :incrementLevels
    private :decrementLevels
    private :setPendingBadConsequence
    private :applyPrize
    private :applyBadConsequence
    private :canMakeTreasureVisible
    private :howManyVisibleTreasures
    private :dieIfNoTreasures
    protected :giveMeATreasure
    protected :canYouGiveMeATreasure
    private :haveStolen
    protected :shouldConvert
    protected :getOponentLevel
    protected :getPendingBadConsequence
    
    # ---------------------------------------------------
  end
end

# end player.rb