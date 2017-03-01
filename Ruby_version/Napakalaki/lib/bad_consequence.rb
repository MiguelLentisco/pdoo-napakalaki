  # To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  def initialize(text, levels, nVisibleTreasures, nHiddenTreasures,
      death, specificHiddenTreasures, specificVisibleTreasures)
    @text = text
    @levels = levels
    @nVisibleTreasures = nVisibleTreasures
    @nHiddenTreasures = nHiddenTreasures
    @death = death
    @specificHiddenTreasures = specificHiddenTreasures
    @specificVisibleTreasures = specificVisibleTreasures
  end
  
  attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death, :specificHiddenTreasures, :specificVisibleTreasures
end
