# encoding: utf-8
# begin dice.rb

require 'singleton'

module NapakalakiGame
  class Dice
    include Singleton

    def nextNumber
      1 + rand(6)
    end
  end
end
# end dice.rb