# encoding: utf-8
# begin dice.rb

require 'singleton'

class Dice
  include Singleton
  
  def nextNumber
    1 + rand(6)
  end
end

# end dice.rb