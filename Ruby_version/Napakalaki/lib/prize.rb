# encoding: utf-8
# being prize.rb

# Clase Prize que representa la recompensa por vencer a un monstruo
class Prize
  
  # Consultores / datos miembro
  # -------------------------------------------------------
  
  attr_reader :treasures  # Nº de tesoros a coger
  attr_reader :levels      # Nº de niveles aumentados
  
  # -------------------------------------------------------
  
  # Constructor
  # -------------------------------------------------------
  
  def initialize(t, l)
    @treasures = t
    @levels = l
  end
  
  # -------------------------------------------------------
  
  # Métodos
  # -------------------------------------------------------
  
  # Convierte a string
  def to_s
    "\nTesoros: #{@treasures}\nNiveles: #{@levels}"
  end
  
  # -------------------------------------------------------
end

# end prize.rb
