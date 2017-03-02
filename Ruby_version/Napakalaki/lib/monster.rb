#encoding: utf-8
# init monster.rb

# Clase Monstruo que representa una carta de Monstruo
class Monster
  attr_reader :name           # Nombre del monstruo
  attr_reader :combatLevel    # Poder de combate
  attr_reader :prize          # Recompensa
  attr_reader :badConsequence # Mal rollo
  
  # Constructor general
  def initialize(name, combatLevel, prize, badConsequence)
    @name = name
    @combatLevel = combatLevel
    @prize = prize
    @badConsequence = badConsequence
  end
  
  # Método to_string
  def to_s
    
  end
  
end

# end monster.rb