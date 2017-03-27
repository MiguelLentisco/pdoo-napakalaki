# encoding: utf-8
# begin treasure.rb

require_relative 'treasure_kind'

module NapakalakiGame
  # Clase Tesoro que representa una carta de tesoro
  class Treasure
    # Attr / datos miembro
    # -------------------------------------------------------
    
    #attr_reader :name        # Descripción del tesoro
    #attr_reader :bonus       # Nº de bonus
    #attr_reader :type        # Tipo de tesoro
    
    # -------------------------------------------------------
    
    # Constructor
    # -------------------------------------------------------

    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end 
    
    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------

    def getName
      @name
    end

    def getBonus
      @bonus
    end

    def getType
      @type
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Convierte a string - PARA DEPURACION: NO INCLUIDO EN EL UML
    def to_s
      message = "\nDescripción: #{@name}\t Bonus: #{@bonus}\t Tipo: #{@type}"
    end
    
    # -------------------------------------------------------
  end
end

# end treasure.rb