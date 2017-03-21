# encoding: utf-8
# begin monster.rb

module NapakalakiGame
  # Clase Monstruo que representa una carta de monstruo
  class Monster

    # Consultores / datos miembro
    # -------------------------------------------------------

    #attr_reader :name           # Nombre del monstruo
    #attr_reader :combatLevel    # Poder de combate
    #attr_reader :badConsequence # Mal rollo

    # -------------------------------------------------------

    # Constructor
    # -------------------------------------------------------

    def initialize(n, l, b, p)
      @name = n
      @combatLevel = l
      @badConsequence = b
      @prize = p
    end

    # -------------------------------------------------------

    # Métodos
    # -------------------------------------------------------

    # Convierte a string
    def to_s
      "\nNombre: #{@name}\nPoder de combate: #{@combatLevel}\n" \
      "--Recompensa--#{@prize}\n--Mal rollo--#{@badConsequence}"
    end

    def getName
      @name
    end

    def getCombatLevel
      @combatlevel
    end

    def getBadConsequence
      @badConsequence
    end

    def getLevelsGained
      @prize.levels
    end

    def getTreasuresGained
    @prize.treasures
    end

    # -------------------------------------------------------
  end
end

# end monster.rb