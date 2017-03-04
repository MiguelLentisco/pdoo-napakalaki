#encoding: utf-8
# being prize.rb

# Clase Prize que representa la recompensa por vencer a un monstruo
class Prize
  
  # Consultores / datos miembro
  # -------------------------------------------------------
  
  attr_reader :treasures  # Nº de tesoros a coger
  attr_reader :level      # Nº de niveles aumentados
  
  # -------------------------------------------------------
  
  # Constructor
  # -------------------------------------------------------
  
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  # -------------------------------------------------------
  
  # Métodos
  # -------------------------------------------------------
  
  # Convierte a string
  def to_s
    "\nTesoros: #{@treasures}\nNiveles: #{@level}"
  end
  
  # -------------------------------------------------------
end

# end prize.rb
