# encoding: utf-8
# begin monster.rb

require_relative 'bad_consequence'
require_relative 'prize'

module NapakalakiGame
  # Clase Monstruo que representa una carta de monstruo
  class Monster

    # Attr / datos miembro
    # -------------------------------------------------------

    #attr_reader :name           # Nombre del monstruo
    #attr_reader :combatLevel    # Poder de combate
    #attr_reader :badConsequence # Mal rollo
    #attr_reader :prize          # Recompensa

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
    
    # Consultores
    # -------------------------------------------------------
    
    def getName
      @name
    end

    def getCombatLevel
      @combatLevel
    end

    def getBadConsequence
      @badConsequence
    end

    def getLevelsGained
      @prize.getLevels
    end

    def getTreasuresGained
      @prize.getTreasures
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------

    # Convierte a string
    def to_s
      "\nNombre: #{@name}\nPoder de combate: #{@combatLevel}\n" \
      "--Recompensa--#{@prize}\n--Mal rollo--#{@badConsequence}"
    end
    
    # -------------------------------------------------------
  end
end

# end monster.rb