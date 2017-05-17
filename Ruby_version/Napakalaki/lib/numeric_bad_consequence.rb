# encoding: utf-8
# begin numeric_bad_consequence.rb

require_relative 'bad_consequence'

module NapakalakiGame
  class NumericBadConsequence < BadConsequence
    
    def initialize(t, l, nVisible, nHidden)
      super(t, l)
      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden
    end
    
    def getNVisibleTreasures
      @nVisibleTreasures  
    end

    def getNHiddenTreasures
      @nHiddenTreasures 
    end
    
    def isEmpty
      @nVisibleTreasures == 0 and @nHiddenTreasures == 0
    end
    
    def substractVisibleTreasure(t)
      if @nVisibleTreasures > 0
        @nVisibleTreasures -= 1 
      end
    end
    
    def substractHiddenTreasure(t)
      if @nHiddenTreasures > 0
        @nHiddenTreasures -= 1
      end
    end
    
    def adjustToFitTreasureLists(v, h)
      nV = v.size < @nVisibleTreasures ? v.size : @nVisibleTreasures
      nH = h.size < @nHiddenTreasures ? h.size : @nHiddenTreasures
      bC = NumericBadConsequence.new(@text, @levels, nV, nH)
    end
    
    def to_s
      super + "\n Tesoros visibles perdidos: #{@nVisibleTreasures}\n Tesoros ocultos perdidos: #{@nHiddenTreasures}"
    end
    
    def malRolloString
      super + "\n Tesoros visibles: #{@nVisibleTreasures}\n Tesoros ocultos: #{@nHiddenTreasures}"
    end
  end
end

# end numeric_bad_consequence.rb