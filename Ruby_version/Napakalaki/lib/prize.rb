#encoding: utf-8
# init prize.rb

class Prize
  attr_reader :treasures  # Nº de tesoros a coger
  attr_reader :level      # Nº de niveles aumentados
  
  # Constructor general
  def initialize(treasures, level)
    @treasures = treasures
    @level = level
  end
  
  # Método to_string
  def to_s
    "Tesoros ganados: #{@treasures}\n Niveles generados: #{@level}"
  end
  
end

# end prize.rb
