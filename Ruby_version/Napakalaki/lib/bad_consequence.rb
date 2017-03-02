#encoding: utf-8
# init bad_consequence.rb

# Clase BadConsequence que representa el mal rollo que se aplica al jugador
class BadConsequence
  attr_reader :text                     # Descripción del mal rollo
  attr_reader :levels                   # Nº de niveles perdidos
  attr_reader :nVisibleTreasures        # Nº de tesoros visibles perdidos
  attr_reader :nHiddenTreasures         # Nº de tesoros ocultos perdidos 
  attr_reader :specificHiddenTreasures  # Tesoros ocultos específicos perdidos
  attr_reader :specificVisibleTreasures # Tesoros visibles específicos perdidos
  attr_reader :death                    # Si produce muerte
  
  # Constructor general
  private def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
      someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text = aText
    @levels = someLevels
    @nVisibleTreasures = someVisibleTreasures
    @nHiddenTreasures = someHiddenTreasures
    @specificVisibleTreasures = someSpecificVisibleTreasures
    @specificHiddenTreasures = someSpecificHiddenTreasures
    @death = death
  end
  
  # Constructor tipo 1: tesoros genéricos
  def self.newLevelNumberOfTreasures(aText, someLevels, someVisibleTreasures,
      someHiddenTreasures)
    self.new(aText, someLevels, someVisibleTreasures, someHiddenTreasures, 
      nil, nil, false)
  end
  
  # Constructor tipo 2: tesoros específicos
  def self.newLevelSpecificTreasures(aText, someLevels, someSpecificVisibleTreasures, 
      someSpecificHiddenTreasures)
    self.new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, 
      someSpecificHiddenTreasures, false)
  end
  
  # Constructor tipo 3: muerte
  def self.newDeath(aText)
    self.new(aText, 0, 0, nil, nil, true)
  end
  
  # Método to_string
  def to_s
    
  end
  
end

# end bad_consequence-rb