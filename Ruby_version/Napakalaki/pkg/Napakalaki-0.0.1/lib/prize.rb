# encoding: utf-8
# being prize.rb

module NapakalakiGame
  # Clase Prize que representa la recompensa por vencer a un monstruo
  class Prize
    # Attr / datos miembro
    # -------------------------------------------------------

    #attr_reader :treasures  # Nº de tesoros a coger
    #attr_reader :levels     # Nº de niveles aumentados

    # -------------------------------------------------------

    # Constructor
    # -------------------------------------------------------

    def initialize(t, l)
      @treasures = t
      @levels = l
    end

    # -------------------------------------------------------
   
    # Consultores
    # -------------------------------------------------------
    
    def getTreasures
      @treasures
    end

    def getLevels
      @levels
    end
    
    # -------------------------------------------------------

    # Métodos
    # -------------------------------------------------------

    # Convierte a string
    def to_s
      "\nTesoros: #{@treasures}\nNiveles: #{@levels}"
    end

    # -------------------------------------------------------
  end
end

# end prize.rb
