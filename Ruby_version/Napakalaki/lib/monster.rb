# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  def initialize(name, combatLevel, prize, badConsequence)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badConsequence = badConsequence
  end
  
  attr_reader :name, :combatLevel, :prize, :badConsequence
end
