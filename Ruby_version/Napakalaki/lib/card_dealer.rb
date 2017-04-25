# encoding: utf-8
# begin card_dealer.rb

require 'singleton'
require_relative 'treasure'
require_relative 'monster'
require_relative 'cultist'

module NapakalakiGame
  # Clase CardDealer que representa la estructura que maneja los mazos de cartas
  class CardDealer
    include Singleton
    # Attr / datos miembro
    # -------------------------------------------------------
    
    # SOLO PARA DEPURACION
    #attr_reader :unusedTreasures   # Mazo de tesoros no usados
    #attr_reader :unusedMonsters    # Mazo de monstruos no usados
    #attr_reader :usedTreasures     # Mazo de tesoros usados
    #attr_reader :usedMonsters      # Mazo de monstruos usados
 
    # -------------------------------------------------------
    
    # Constructor
    # -------------------------------------------------------

    def initialize
      @usedTreasures = []
      @usedMonsters = []
      @usedCultist = []
      @unusedTreasures = []
      @unusedMonsters = []
      @unusedCultists = []
      
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Iniciamos el mazo de tesoros
    def initTreasureCardDeck
      # ¡Sí mi amo!
      @unusedTreasures << Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET)

      # Botas de investigación
      @unusedTreasures << Treasure.new("Botas de investigación", 3, TreasureKind::SHOE)

      # Capucha de Cthulhu
      @unusedTreasures << Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)

      # A prueba de babas
      @unusedTreasures << Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)

      # Botas de lluvia ácida
      @unusedTreasures << Treasure.new("Botas de lluvia ácida", 1, TreasureKind::BOTHHANDS);

      # Casco minero
      @unusedTreasures << Treasure.new("Casco minero", 2, TreasureKind::HELMET)

      # Ametralladore ACME
      @unusedTreasures << Treasure.new("Ametralladora ACME", 4, TreasureKind::BOTHHANDS)

      #Camiseta de la ETSIIT
      @unusedTreasures << Treasure.new("Camiseta de la ETSIIT", 1, TreasureKind::ARMOR)

      # Clavo de rail ferroviario
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)

      # Cuchillo de sushi arcano
      @unusedTreasures << Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)

      # Fez alópodo
      @unusedTreasures << Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)

      # Hacha prehistórica
      @unusedTreasures << Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)

      # El aparato del Pr. Tesla
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)

      # Gaita
      @unusedTreasures << Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)

      # Insecticida
      @unusedTreasures << Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)

      # Escopeta de 3 cañones
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)

      # Garabato místico 
      @unusedTreasures << Treasure.new("Garabato místico", 2, TreasureKind::ONEHAND)

      # La rebeca metálica
      @unusedTreasures << Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)

      # Lanzallamas
      @unusedTreasures << Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)

      # Necrocomicón
      @unusedTreasures << Treasure.new("Necrocomicón", 1, TreasureKind::ONEHAND)

      # Necronomicón
      @unusedTreasures << Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)

      # Linterna a 2 manos
      @unusedTreasures << Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)

      # Necrognomicón
      @unusedTreasures << Treasure.new("Necrognomicón", 2, TreasureKind::ONEHAND)

      # Necrotelecom
      @unusedTreasures << Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)

      # Mazo de los antiguos
      @unusedTreasures << Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)

      # Necroplayboycón
      @unusedTreasures << Treasure.new("Necroplayboycón", 3, TreasureKind::ONEHAND)

      # Porra preternatural
      @unusedTreasures << Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)

      # Shogulador
      @unusedTreasures << Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)

      # Varita de atizamiento
      @unusedTreasures << Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)

      # Tentáculo de pega
      @unusedTreasures << Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMET)

      # Zapato deja-amigos
      @unusedTreasures << Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOE)
      
      shuffleTreasures
    end

    # Iniciamos el mazo de monstruos
    def initMonsterCardDeck
      # 3 Byakhees de bonanza
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Pierdes tu armadura visible" \
          " y otra oculta.", 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
      @unusedMonsters << Monster.newNormalMonster("3 Byakhees de bonanza", 8, bC, prize)

      # Tenochtitlan
      prize = Prize.new(1,1)
      bC = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo " \
          "primigenio te descartas de tu casco visible.", 0, [TreasureKind::HELMET], 
          [])
      @unusedMonsters << Monster.newNormalMonster("Tenochtitlan", 2, bC, prize)

      # El sopor de Dunwich
      prize = Prize.new(1,1)
      bC = BadConsequence.newLevelSpecificTreasures("El primodial bostezo " \
          "contagioso. Pierdes el calzado visible.", 0, [TreasureKind::SHOE], [])
      @unusedMonsters << Monster.newNormalMonster("El sopor de Dunwich", 2, bC, prize)

      # Demonios de Magaluf
      prize = Prize.new(4, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte " \
          "de fiesta y te dejan caer en mitad del vuelo. Descarta 1 mano visible" \
          " y 1 mano oculta.", 0, [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      @unusedMonsters << Monster.newNormalMonster("Demonios de Magaluf", 2, bC, prize)

      # El gorrón en el umbral
      prize = Prize.new(3, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros " \
          "visibles.", 0, BadConsequence.MAXTREASURES, 0)
      @unusedMonsters << Monster.newNormalMonster("El gorrón en el umbral", 13, bC, prize)

      # H.P. Munchcraft
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible.",
          0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.newNormalMonster("H.P. Munchcraft", 6, bC, prize)

      # Necrófago
      prize = Prize.new(1, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa." \
          " Descarta la armadura visible.", 0, [TreasureKind::ARMOR], [])
      @unusedMonsters << Monster.newNormalMonster("Necrófago", 13, bC, prize)

      # El rey de rosado
      prize = Prize.new(3, 2)
      bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3" \
          " tesoros visibles.", 5, 3, 0)
      @unusedMonsters << Monster.newNormalMonster("El rey de rosado", 11, bC, prize)

      # Flecher
      prize = Prize.new(1, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y " \
          "pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.newNormalMonster("Flecher", 2, bC, prize)

      # Los hondos
      prize = Prize.new(2, 1)
      bC = BadConsequence.newDeath("Estos monstruos resultan bastante " \
          "superficiales y te aburren mortalmente. Estás muerto.")
      @unusedMonsters << Monster.newNormalMonster("Los hondos", 8, bC, prize)

      # Semillas Cthulhu
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 "\
          "tesoros ocultos.", 2, 0, 2)
      @unusedMonsters << Monster.newNormalMonster("Semillas Cthulhu", 4, bC, prize)

      # Dameargo
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear." \
          " Pierdes una mano visible.", 0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.newNormalMonster("Dameargo", 1, bC, prize)

      # Pollipólipo volante
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes" \
          " 3 niveles.", 3, 0, 0)
      @unusedMonsters << Monster.newNormalMonster("Pollipólipo volante", 3, bC, prize)

      # Yskhtihyssggoth
      prize = Prize.new(3, 1)
      bC = BadConsequence.newDeath("No le hace gracia que pronuncien mal su " \
          "nombre. Estás muerto.")
      @unusedMonsters << Monster.newNormalMonster("Yskhtihyssggoth", 14, bC, prize)

      # Familia feliz
      prize = Prize.new(3, 1)
      bC = BadConsequence.newDeath("La familia te atrapa. Estás muerto.")
      @unusedMonsters << Monster.newNormalMonster("Familia feliz", 1, bC, prize)

      # Roboggoth
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria" \
          " te obliga a perder 2 niveles y un tesoro de 2 manos visible.", 2,
          [TreasureKind::BOTHHANDS], [])
      @unusedMonsters << Monster.newNormalMonster("Roboggoth", 8, bC, prize)

      # El espía sordo
      prize = Prize.new(1, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. " \
          "Pierdes un casco visible.", 0, [TreasureKind::HELMET], [])
      @unusedMonsters << Monster.newNormalMonster("El espía sordo", 5, bC, prize)

      # Tongue
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas." \
          " Pierdes 2 niveles y 5 tesoros visibles.", 2, 5, 0)
      @unusedMonsters << Monster.newNormalMonster("Tongue", 19, bC, prize)

      # Bicéfalo
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta" \
          " cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.", 3,
          [TreasureKind::BOTHHANDS, TreasureKind::ONEHAND, 
          TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.newNormalMonster("Bicéfalo", 21, bC, prize)
      
      # El mal indecible impronunciable
      prize = Prize.new(3, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Pierdes 1 mano visible", 
        0, [TreasureKind::ONEHAND], [])
      @unusedMonsters << Monster.newCultistMonster("El mal indecible impronunciable", 10, bC, prize, -2)
      
      # Testigos Oculares
      prize = Prize.new(3, 1)
      bC = BadConsequence.newLevelNumberOfTresures("Pierdes tus tesoros visibles. Jajaja.", 0, BadConsequence.MAXTREASURES, 0)
      @unusedMonsters << Monster.newCultistMonster("Testigos Oculares", 6, bC, prize, 2)
      
      # El gran cthulhu
      prize = Prize.new(2, 5)
      bC = BadConsequence.newDeath("Hoy no es tu día de suerte. Mueres.")
      @unusedMonsters << Monster.newCultistMonster("El gran cthulhu", 20, bC, prize, 4)
      
      # Serpiente Político
      prize = Prize.new(2, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Tu gobierno te recorta 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.newCultistMonster("Serpiente Político", 8, bC, prize, -2)
      
      # Felpuggoth
      prize = Prize.new(1, 1)
      bC = BadConsequence.newLevelSpecificTreasures("Pierdes tu casco y tu armadura visible." \
        " Pierdes tus manos ocultas.", 0, [TreasureKind::HELMET, TreasureKind::ARMOR], 
        [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHAND])
      @unusedMonsters << Monster.newCultistMonster("Felpuggoth", 2, bC, prize, 5)
      
      # Shoggoth
      prize = Prize.new(4, 2)
      bC = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles.", 2, 0, 0)
      @unusedMonsters << Monster.newCultistMonster("Shoggoth", 16, bC, prize, -4)
      
      # Lolitagooth
      prize = Prize.new(1, 1)
      bC = BadConsequence.newLevelNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles.",
        2, 0, 0)
      @unusedMonsters << Monster.newCultistMonster("Lolitagooth", 2, bC, prize, 3)
      
      shuffleMonsters
    end
    
    
    
    def initCultistCardDeck
      # Sectario +1 (1)
      @unusedCultists << Cultist.new("Sectario", 1)
  
      # Sectario +2 (1)
      @unusedCultists << Cultist.new("Sectario", 2)
      
      # Sectario +1 (2)
      @unusedCultists << Cultist.new("Sectario", 1)
  
      # Sectario +2 (2)
      @unusedCultists << Cultist.new("Sectario", 2)
      
      # Sectario +1 (3)
      @unusedCultists << Cultist.new("Sectario", 1)
      
      # Sectario +1 (4)
      @unusedCultists << Cultist.new("Sectario", 1)
    
      shuffleCultists
    end
    
    def nextCultist
      @unusedTreasures.shift
    end
    
    # Baraja el mazo de cultistas
    def shuffleCultists
      @unusedCultist.shuffle!
    end

    # Baraja el mazo de tesoros
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end

    # Baraja el mazo de monstruos
    def shuffleMonsters
      @unusedMonsters.shuffle!
    end

    def nextTreasure
      if @unusedTreasures.empty?
        @unusedTreasures = @usedTreasures
        @usedTreasures = []
        shuffleTreasures
      end
      @unusedTreasures.shift
    end

    def nextMonster
      if @unusedMonsters.empty?
        @unusedMonsters = @usedMonsters
        @usedMonsters = []
        shuffleMonsters
      end
      @unusedMonsters.shift
    end

    # Coge un tesoro y lo pone en el mazo de tesoros usados
    def giveTreasureBack(t)
      @usedTreasures << t
    end

    # Coge un monstruo y lo pone en el mazo de monstruos usados
    def giveMonsterBack(m)
      @usedMonsters << m
    end
    
    # Inicializa los mazos
    def initCards
      initTreasureCardDeck
      initMonsterCardDeck
      initCultistCardDeck
    end
    
    # -------------------------------------------------------
    
    # Métodos privados
    # -------------------------------------------------------

    private :initTreasureCardDeck
    private :initMonsterCardDeck
    private :shuffleTreasures
    private :shuffleMonsters
    private :shuffleCultist
    private :initCultistCardDeck
    
    
    # -------------------------------------------------------
  end
end

# end card_dealer.rb

