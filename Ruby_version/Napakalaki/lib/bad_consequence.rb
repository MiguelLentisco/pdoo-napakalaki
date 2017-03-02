# begin bad_consequence.rb
#encoding: utf-8

# Clase BadConsequence que representa el mal rollo del monstruo
class BadConsequence
  
  # Consultores / datos miembro
  # -------------------------------------------------------
  
  attr_reader :text                     # Descripción del mal rollo
  attr_reader :levels                   # Nº de niveles perdidos
  attr_reader :nVisibleTreasures        # Nº de tesoros visibles perdidos
  attr_reader :nHiddenTreasures         # Nº de tesoros ocultos perdidos 
  attr_reader :specificHiddenTreasures  # Tesoros ocultos específicos perdidos
  attr_reader :specificVisibleTreasures # Tesoros visibles específicos perdidos
  attr_reader :death                    # Si produce muerte
  
  # -------------------------------------------------------
  
  # Constructores
  # -------------------------------------------------------
  
  # Constructor general
  private def initialize(aText, someLevels, someVisibleTreasures, 
      someHiddenTreasures, someSpecificVisibleTreasures, 
      someSpecificHiddenTreasures, death)
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
  def self.newLevelSpecificTreasures(aText, someLevels, 
      someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    self.new(aText, someLevels, 0, 0, someSpecificVisibleTreasures, 
      someSpecificHiddenTreasures, false)
  end
  
  # Constructor tipo 3: muerte
  def self.newDeath(aText)
    self.new(aText, 0, 0, nil, nil, true)
  end
  
  # -------------------------------------------------------
  
  # Métodos
  # -------------------------------------------------------
  
  # Convierte a string
  def to_s
    message = "Descripción: #{@text}\n"
    if !death
      message += "Niveles a perder: #{@levels}\n"
      message += "Tesoros visibles perdidos: "
      if @specificVisibleTreasures.empty?
        message += " #{@nVisibleTreasures}\n"
      else
        message += " #{@specificVisibleTreasures}\n"
      end
      message += "Tesoros ocultos perdidos: "
      if @specificHiddenTreasures.empty?
        message += " #{@nHiddenTreasures}\n"
      else
        message += " #{@specificHiddenTreasures}\n"
      end
    end
    message += "Muerte: #{@death}"
  end
  
  # -------------------------------------------------------
end

# end bad_consequence-rb