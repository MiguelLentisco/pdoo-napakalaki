# encoding: utf-8
# begin player.rb

# require_relative 'treasure'
# require_relative 'bad_consequence'

module NapakalakiGame
  class Player
    @@MAX_LEVEL = 10

    #attr_reader :name
    #attr_reader :level
    #attr_reader :visibleTreasures
    #attr_reader :hiddenTreasures
    #attr_writer :enemy

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

    def bringToLife
      @dead = false
    end

    def incrementLevels(l)
      @level += l
      if (@level > 10)
        @level = 10
      end
    end

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

    def howManyVisibleTreasures(tKind)
      var = 0
      @visibleTreasures.each { |treasure| 
        if treasure.getType == tKind
          var += 1 
        end
      }
      var
    end

    def dieIfNoTreasures
      if (@visibleTreasures.empty? and @hiddenTreasures.empty?)
        @dead = true
      end
    end

    def isDead
      @dead
    end

    def combat(m)

    end

    def makeTreasureVisible(t)

    end

    def discardVisibleTreasure(t)

    end

    def discardHiddenTreasure(t)

    end

    def validState
      @pendingBadConsequence.isEmpty and
        @hiddenTreasures.size < 4
    end

    def initTreasures

    end

    def stealTreasure

    end

    def giveMeATreasure

    end

    def canISteal
      @canISteal
    end

    def canYouGiveMeATreasure
      !@visibleTreasures.empty?
    end

    def haveStolen
      @canISteal = false
    end

    def discardAllTreasures

    end

    def setPendingBadConsequence(b)
      @pendingBadConsequence = b
    end

    def getName
      @name
    end

    def getHiddenTreasures
      @hiddenTreasures
    end

    def getVisibleTreasures
      @visibleTreasures
    end

    def getLevels
      @level
    end

    def getCombatLevel
      bonus = @level
      getVisibleTreasures.each {|treasure| bonus += treasure.getBonus }
      bonus
    end

=begin
    private :bringToLife
    private :getCombatLevel
    private :incrementLevels
    private :decrementLevels
    private :setPendingBadConsequence
    private :applyPrize
    private :applyBadConsequence
    private :canMakeTreasureVisible
    private :howManyVisibleTreasures
    private :dieIfNoTreasure
    private :giveMeATreasure
    private :canYouGiveMeATreasure
    private :haveStolen
=end

    # Para depuración
    # ---------------------------------------------------
    attr_writer :visibleTreasures



    def self.depurar
      p = Player.new("Jugador1")
      puts "\n\tInicializamos al jugador:\n" + p.to_s
      p.bringToLife
      puts "\n\tResucitamos al jugador:\n" + p.to_s
      p.incrementLevels(20)
      puts "\nIncrementamos el nivel del jugador por encima del nivel máximo: " + \
          p.getLevels.to_s
      p.decrementLevels(20)
      puts "\nDecrementamos el nivel del jugador por debajo del nivel mínimo: " + \
        p.getLevels.to_s

      p.visibleTreasures = [Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET),
                            Treasure.new("Botas de investigacion", 3, TreasureKind::SHOE),
                            Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)]
      puts "\nAñadimos tesoros. Tesoros visibles de tipo casco: " + \
        p.howManyVisibleTreasures(TreasureKind::HELMET).to_s
      puts "\nNivel de combate: " + p.getCombatLevel.to_s
      puts "\nPuedes darme un tesoro?: " + p.canYouGiveMeATreasure.to_s
      
      p.dieIfNoTreasures
      puts "\nEsta vivo: " + p.isDead.to_s
      p.visibleTreasures = []
      puts "\nVaciamos sus tesoros. Puedes darme un tesoro?: " + p.canYouGiveMeATreasure.to_s
      p.dieIfNoTreasures
      puts "\nEsta muerto: " + p.isDead.to_s
      
      p.setPendingBadConsequence(BadConsequence.newDeath("Mueres"))
      puts "\n\tAlteramos el mal rollo pendiente:\n" + p.to_s
      puts "\nEstado válido: " + p.validState.to_s
      p.setPendingBadConsequence(BadConsequence.newLevelNumberOfTreasures("Mal rollo", 2, \
            2, 0))
      puts "\nAlteramos el mal rollo. Estado válido: " + p.validState.to_s
    end

    def to_s
      message = "\n Nombre: #{@name}\n Nivel: #{@level}\n Puedo Robar: #{@canISteal}\n Muerto: "
      message += "#{@dead}\n Tesoros visibles: #{@visibleTreasures}\n Tesoros ocultos: " 
      message += "#{@hiddenTreasures}"

      message += "\n Mal rollo pendiente: "
      if @pendingBadConsequence != nil
        message += "#{@pendingBadConsequence}"
      else
        message += "null"
      end

      message += "\n Enemigo: "
      if @enemy != nil
        message += "#{@enemy.getName}\n"
      else
        message += "ninguno\n"
      end

      message
    end

    def self.printList(list)
      list.each {|element| puts element }
    end
    
    # ---------------------------------------------------
  end
end

# end player.rb