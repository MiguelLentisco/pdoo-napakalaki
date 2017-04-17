# encoding: utf-8
# begin bad_consequence.rb

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
      new(t, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES, [], [], true)
    end

    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def self.MAXTREASURES
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
      if @specificVisibleTreasures.empty? and @nVisibleTreasures > 0
        @nVisibleTreasures -= 1  
      else
        @specificVisibleTreasures.delete_at(@specificHiddenTreasures.index(t))
      end
    end

    def substractHiddenTreasure(t)
      if @specificHiddenTreasures.empty? and @nHiddenTreasures > 0
        @nHiddenTreasures -= 1
      else
        @specificHiddenTreasures.delete_at(@specificHiddenTreasuers.index(t))
      end
    end

    def adjustToFitTreasureLists(v, h)
      bC = nil
      if @nVisibleTreasures == 0 and @nHiddenTreasures == 0

        vTType = v.collect {|t| t.getType}
        hTType = h.collect {|t| t.getType}
=begin        
        # Primero borramos los tesoros que no están en ninguno
        vTType.delete_if {|t| !t.in?(@specificVisibleTreasures)}
        hTType.delete_if {|t| !t.in?(@specificHiddenTreasures)}
        
        # Miramos en los tipos unicos
        vTType.uniq.each do |type|
         # Adjustamos el número
          n1 = vTType.count(type)
          n2 = @specificVisibleTreasures.count(type)
          while n1 > n2 do
            vTType.delete(type)
            n1 -= 1
          end
        end
        
        # Miramos en los tipos unicos
        hTType.uniq.each do |type|
         # Adjustamos el número
         n1 = hTType.count(type)
         n2 = @specificHiddenTreasures.count(type)
         while n1 > n2 do
           hTType.delete(type)
           n1 -= 1
         end
        end
=end
        vTFinal = (vTType & @specificVisibleTreasures).flat_map { |n| [n]*[vTType.count(n), @specificVisibleTreasures.count(n)].min }
        hTFinal = (hTType & @specificHiddenTreasures).flat_map { |n| [n]*[hTType.count(n), @specificHiddenTreasures.count(n)].min }
        
        bC = BadConsequence.newLevelSpecificTreasures(@text, @levels, vTFinal, hTFinal)
      else
        nV = v.size < @nVisibleTreasures ? v.size : @nVisibleTreasures
        nH = h.size < @nHiddenTreasures ? h.size : @nHiddenTreasures
        
        bC = BadConsequence.newLevelNumberOfTreasures(@text, @levels, nV, nH)
      end
    end

    # Convierte a string
    def to_s
      message = "\nDescripción: #{@text}\n"
      if !@death
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