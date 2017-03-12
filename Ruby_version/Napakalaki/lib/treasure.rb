# encoding: utf-8
# begin treasure.rb

class Treasure
  
  attr_reader :name
  attr_reader :bonus
  attr_reader :type
  
  def initialize(n, bonus, t)
    @name = n
    @bonus = bonus
    @type = t
  end  
end

# end treasure.rb