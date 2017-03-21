# encoding: utf-8
# begin bad_consequence.rb

module NapakalakiGame
  # Clase BadConsequence que representa el mal rollo del monstruo
  class BadConsequence

    # Consultores / datos miembro
    # -------------------------------------------------------
    @@MAXTREASURES = 10

    attr_reader :text                     # Descripción del mal rollo
    #attr_reader :levels                   # Nº de niveles perdidos
    #attr_reader :nVisibleTreasures        # Nº de tesoros visibles perdidos
    #attr_reader :nHiddenTreasures         # Nº de tesoros ocultos perdidos 
    #attr_reader :specificVisibleTreasures # Tesoros visibles específicos perdidos
    #attr_reader :specificHiddenTreasures  # Tesoros ocultos específicos perdidos
    attr_reader :death                    # Si produce muerte

    # -------------------------------------------------------

    # Constructores
    # -------------------------------------------------------

    # Intialize
    def initialize(aText, someLevels, someVisibleTreasures,
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

    # new es private
    private_class_method :new

    # Constructor tipo 1: tesoros genéricos
    def self.newLevelNumberOfTreasures(t, l, nVisible, nHidden)
      new(t, l, nVisible, nHidden, [], [], false)
    end

    # Constructor tipo 2: tesoros específicos
    def self.newLevelSpecificTreasures(t, l, v, h)
      new(t, l, 0, 0, v, h, false)
    end

    # Constructor tipo 3: muerte
    def self.newDeath(t)
      new(t, 0, 0, 0, [], [], true)
    end

    # -------------------------------------------------------

    # Métodos
    # -------------------------------------------------------

    def getLevels
      @levels
    end

    def getNVisibleTreasures
      @nVisibleTreasures  
    end

    def getNHiddenTreasures
      @nHiddenTreasures 
    end

    def getSpecificVisibleTreasures
      @specificVisibleTreasures 
    end

    def getSpecificHiddenTreasures
      @specificHiddenTreasures 
    end

    def isEmpty
      @nVisibleTreasures == 0 and @nHiddenTreasures == 0 and 
        @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
    end

    def substractVisibleTreasure(t)

    end

    def substractHiddenTreasure(t)

    end

    def adjustToFitTreasureList(v, h)

    end

    # Convierte a string
    def to_s
      message = "\nDescripción: #{@text}\n"
      if !death
        message += "Niveles: #{@levels}\n"
        if @nVisibleTreasures > 0
          message += "Tesoros visibles: #{@nVisibleTreasures}\n"
        elsif !@specificVisibleTreasures.empty?
          message += "Tesoros visibles: #{@specificVisibleTreasures}\n"
        end
        if @nHiddenTreasures > 0
          message += "Tesoros ocultos: #{@nHiddenTreasures}\n"
        elsif !@specificHiddenTreasures.empty?
          message += "Tesoros ocultos: #{@specificHiddenTreasures}\n"
        end
      else
        message += "Muerte: sí"
      end
      message
    end

    # -------------------------------------------------------
    
    def self.depurar
      bc1 = BadConsequence.newDeath("bc1")
      bc2 = BadConsequence.newLevelNumberOfTreasures("bc2", 0, 2, 3)
      bc3 = BadConsequence.newLevelNumberOfTreasures("bc3", 1, 0, 0)
      bc4 = BadConsequence.newLevelSpecificTreasures("bc4", 4, [TreasureKind::ONEHAND], \
          [TreasureKind::BOTHHANDS])
      bc5 = BadConsequence.newLevelSpecificTreasures("bc5", 4, [], [])

      puts bc1.to_s + "\n\n" + bc2.to_s + "\n\n" + bc3.to_s + "\n\n" + bc4.to_s + "\n\n"
      puts bc5.to_s + "\n\n"

      if (bc1.isEmpty) 
        puts "bc1 vacia \n"
      else
        puts "bc1 no vacia \n"
      end

      if (bc2.isEmpty) 
        puts "bc2 vacia \n"
      else
        puts "bc2 no vacia \n"
      end

      if (bc3.isEmpty) 
        puts "bc3 vacia \n"
      else
        puts "bc3 no vacia \n"
      end

      if (bc4.isEmpty) 
        puts "bc4 vacia \n"
      else
        puts "bc4 no vacia \n"
      end

      if (bc5.isEmpty) 
        puts "bc5 vacia \n"
      else
        puts "bc5 no vacia \n"
      end
    end
  end
end

# end bad_consequence-rb