# encoding: utf-8
# begin bad_consequence.rb

require_relative 'treasure_kind'
require_relative 'player'
require_relative 'treasure'

module NapakalakiGame
  # Clase BadConsequence que representa el mal rollo del monstruo
  class BadConsequence
    # Attr / datos miembro
    # -------------------------------------------------------
    @@MAXTREASURES = 10                    # Número máximo de tesoros

    #attr_reader :text                     # Descripción del mal rollo
    #attr_reader :levels                   # Nº de niveles perdidos
    #attr_reader :nVisibleTreasures        # Nº de tesoros visibles perdidos
    #attr_reader :nHiddenTreasures         # Nº de tesoros ocultos perdidos 
    #attr_reader :specificVisibleTreasures # Tesoros visibles específicos perdidos
    #attr_reader :specificHiddenTreasures  # Tesoros ocultos específicos perdidos
    #attr_reader :death                    # Si produce muerte

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
      new(t, Player.getMaxLevel, @@MAXTREASURES, @@MAXTREASURES, [], [], true)
    end

    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def self.getMaxTreasures
      @@MAXTREASURES
    end
    
    def getText
      @text
    end
    
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
    
    def getDeath
      @death
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Si el mal rollo no quita tesoros
    def isEmpty
      @nVisibleTreasures == 0 and @nHiddenTreasures == 0 and 
        @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
    end

    def substractVisibleTreasure(t)
      if @specificVisibleTreasures.empty?
        if @nVisibleTreasures > 0
          @nVisibleTreasures -= 1
        end     
      else
        @specificVisibleTreasures.delete_at(@specificHiddenTreasures.index(t))
      end
    end

    def substractHiddenTreasure(t)
      if @specificHiddenTreasures.empty?
        if @nHiddenTreasures > 0
          @nHiddenTreasures -= 1
        end
      else
        @specificHiddenTreasures.delete_at(@specificHiddenTreasuers.index(t))
      end
    end

    def adjustToFitTreasureLists(v, h)
      bd
      if (@nVisibleTreasures == 0 and @nHiddenTreasures == 0)
        vTreasureKinds = []
        hTreasureKinds = []
        v.each { |t| vTreasureKinds << t.getType}
        h.each { |t| hTreasureKinds << t.getType}
        bd = newLevelSpecificTreasures(@text, @levels, vTreasureKinds & @specificVisibleTreasures,
            hTreasureKinds & @specificHiddenTreasures)
      else
        nV = @nVisibleTreasures
        nH = @nHiddenTreasures
        if (nV > v.size)
          nV = v.size
        end
        if (nH > h.size)
          nH = h.size
        end
        bd = newLevelNumberOfTreasures(@text, @levels, nV, nH)
      end
      bd
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
  end
end

# end bad_consequence-rb