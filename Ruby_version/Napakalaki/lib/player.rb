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
    
    # -------------------------------------------------------

    # Para depuración
    # ---------------------------------------------------

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