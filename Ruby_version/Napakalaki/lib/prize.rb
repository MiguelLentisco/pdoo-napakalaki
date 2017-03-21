# encoding: utf-8
# being prize.rb

# Clase Prize que representa la recompensa por vencer a un monstruo
module NapakalakiGame
  class Prize

    # Consultores / datos miembro
    # -------------------------------------------------------

    #attr_reader :treasures  # Nº de tesoros a coger
    #attr_reader :levels      # Nº de niveles aumentados

    # -------------------------------------------------------

    # Constructor
    # -------------------------------------------------------

    def initialize(t, l)
      @treasures = t
      @levels = l
    end

    # -------------------------------------------------------

    # Métodos
    # -------------------------------------------------------

    # Convierte a string
    def to_s
      "\nTesoros: #{@treasures}\nNiveles: #{@levels}"
    end

    def getTreasures
      @treasures
    end

    def getLevels
      @getLevels
    end

    # -------------------------------------------------------
  end
end

# end prize.rb
