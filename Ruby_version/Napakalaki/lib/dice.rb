# encoding: utf-8
# begin dice.rb

require 'singleton'

module NapakalakiGame
  # Clase Dice que representa el dado del juego
  class Dice
    include Singleton
    
    # Métodos
    # -------------------------------------------------------
    
    def nextNumber
      1 + rand(6)
    end
    
    # -------------------------------------------------------
    
    def self.depurar
      dice = instance
      i = 0
      while (i < 50)
        puts dice.nextNumber
        i += 1
      end
    end
  end
end
# end dice.rb