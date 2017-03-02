# begin pruebaNapakalaki.rb
#encoding: utf-8

require_relative 'treasure_kind'
require_relative "prize"
require_relative 'bad_consequence'
require_relative 'monster'

# Clase PruebaNapakalaki para probar el juego
class PruebaNapakalakib
  def initialize
    
    # Cambiar nil por [] ??
    
    # 3 Byakhees de bonanza
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible
      y otra oculta.", 1, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    @@monster << Monster.new("3 Byakhees de bonanza", 8, prize, bC)
    
    # Tenochtitlan
    prize = Prize.new(1,1)
    bC = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo 
      primigenio te descartas de tu casco visible.", 1, [TreasureKind::ARMOR], nil)
    @@monster << Monster.new("Tenochtitlan", 2, prize, bC)
    
    # El sopor de Dunwich
    prize = Prize.new(1,1)
    bC = BadConsequence.newLevelSpecificTreasures("El primodial bostezo
      contagioso. Pierdes el calzado visible.", 1, [TreasureKind::SHOES], nil)
    @@monster << Monster.new("El sopor de Dunwich", 2, prize, bC)
    
    # Demonios de Magaluf
    prize = Prize.new(4, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte
      de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible y
      1 mano oculta.", 1, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
    @@monster << Monster.new("Demonios de Magaluf", 2, prize, bC)
    
    # El gorrón en el umbral
    prize = Prize.new(3, 1)
    # Usar 6 sin específico ?
    bC = BadConsequence.newLevelSpecificTreasures("Pierdes todos tus tesoros
      visibles.", 1, [TreasureKind::HELMET, TreasureKind::ONEHAND,
      TreasureKind::BOTHHAND, TreasureKind::ARMOR, TreasureKind::SHOES, 
      TreasureKind::HELMET, TreasureKind::ONEHAND], nil)
    @@monster << Monster.new("El gorrón en el umbral", 13, prize, bC)
    
    # H.P. Munchcraft
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",
      1, [TreasureKind::ARMOR], nil)
    @@monster << Monster.new("H.P. Munchcraft", 6, prize, bC)
    
    # Necrófago
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa.
      Descarta la armadura visible.", 1, [TreasureKind::ARMOR], nil)
    @@monster << Monster.new("Necrófago", 13, prize, bC)
    
    # El rey de rosado
    prize = Prize.new(3, 2)
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros
      visibles.", 5, 3, 0)
    @@monster << Monster.new("El rey de rosado", 11, prize, bC)
    
    # Flecher
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes
      2 niveles.", 2, 0, 0)
    @@monster << Monster.new("Flecher", 2, prize, bC)
    
    # Los hondos
    prize = Prize.new(2, 1)
    bC = BadConsequence.newDeath("Estos monstruos resultan bastante superficales
      y te aburren mortalmente. Estas muerto.")
    @@monster << Monster.new("Los hondos", 8, prize, bC)
    
    # Semillas Cthulhu
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros
      ocultos.", 2, 0, 2)
    @@monster << Monster.new("Semillas Cthulhu", 4, prize, bC)
    
    # Dameargo
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear.
      Pierdes una mano visible.", 1, [TreasureKind::ONEHAND], nil)
    @@monster << Monster.new("Dameargo", 1, prize, bC)
    
    # Pollipólipo volante
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Da mucho asquito. Pierdes
      3 niveles.", 3, 0, 0)
    @@monster << Monster.new("Pollipólipo volante", 3, prize, bC)
    
    # Yskhtihyssggoth
    prize = Prize.new(3, 1)
    bC = BadConsequence.newDeath("No le hace gracia que pronuncien mal su
      nombre. Estas muerto.")
    @@monster << Monster.new("Yskhtihyssggoth", 14, prize, bC)
    
    # Familia feliz
    prize = Prize.new(3, 1)
    bC = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
    @@monster << Monster.new("Familia feliz", 1, prize, bC)
    
    # Roboggoth
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria
      te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2,
      [TreasureKind::BOTHHANDS], nil)
    @@monster << Monster.new("Roboggoth", 8, prize, bC)
    
    # El espía sordo
    prize = Prize.new(1, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes
      un casco visible", [TreasureKind::HELMET], nil)
    @@monster << Monster.new("El espía sordo", 5, prize, bC)
    
    # Tongue
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas.
      Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
    @@monster << Monster.new("Tongue", 19, prize, bC)
    
    # Bicéfalo
    prize = Prize.new(2, 1)
    bC = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta
      cabeza. Pierdes 3 nivels y tus tesoros visibles de las manos.", 3,
      [TrreasureKind::BOTHHANDS], [TreasureKind::ONEHAND], 
      [TreasureKind::ONEHAND], nil)
    @@monster << Monster.new("Bicéfalo", 21, prize, bC)
    
  end
end

# end pruebaNapakalaki.rb