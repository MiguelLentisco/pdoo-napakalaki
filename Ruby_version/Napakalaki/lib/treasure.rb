# encoding: utf-8
# begin treasure.rb

require_relative 'treasure_kind'

module NapakalakiGame
  class Treasure

    #attr_reader :name
    #attr_reader :bonus
    #attr_reader :type

    def initialize(n, bonus, t)
      @name = n
      @bonus = bonus
      @type = t
    end 

    def getName
      @name
    end

    def getBonus
      @bonus
    end

    def getType
      @type
    end

    # Convierte a string - PARA DEPURACION: NO INCLUIDO EN EL UML
    def to_s
      message = "\nDescripción: #{@name}\t Bonus: #{@bonus}\t Tipo: #{@type}"
    end

  end
end

# end treasure.rb