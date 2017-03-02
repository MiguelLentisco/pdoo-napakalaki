# begin pruebaNapakalaki.rb
#encoding: utf-8

# Clase PruebaNapakalaki para probar el juego
class PruebaNapakalakib
  def initialize
    # H.P. Munchcraft
    prize = Prize.new(2, 1)
    bC = badConsequence.newLevelSpecificTreasures("Pierdes la armadura visible",
      1, [TreasureKind::ARMOR], nil)
    @@monster << Monster.new("H.P. Munchcraft", 6, prize, bC)
  end
end