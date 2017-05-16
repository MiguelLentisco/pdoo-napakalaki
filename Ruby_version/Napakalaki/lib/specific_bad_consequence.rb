# encoding: utf-8
# begin specific_bad_consequence.rb

module NapakalakiGame
  class SpecificBadConsequence < BadConsequence
    
    def initialize(t, l, v, h)
      super(t, l)
      @specificVisibleTreasures = v
      @specificHiddenTreasures = h
    end
    
    def getSpecificVisibleTreasures
      @specificVisibleTreasures 
    end

    def getSpecificHiddenTreasures
      @specificHiddenTreasures 
    end
    
    def isEmpty
      @specificVisibleTreasures.empty? and @specificHiddenTreasures.empty?
    end
    
    def substractVisibleTreasure(t)
      if !@specificVisibleTreasures.empty? and @specificVisibleTreasures.include?(t)
        @specificVisibleTreasures.delete_at(@specificVisibleTreasures.index(t))
      end
    end
    
    def substractHiddenTreasure(t)
      if !@specificHiddenTreasures.empty? and @specificHiddenTreasures.include?(t)
        @specificHiddenTreasures.delete_at(@specificHiddenTreasures.index(t))
      end
    end
    
    def adjustToFitTreasureLists(v, h)
      vTType = v.collect {|t| t.getType}
      hTType = h.collect {|t| t.getType}
      vTFinal = (vTType & @specificVisibleTreasures).flat_map { |n| [n]*[vTType.count(n), @specificVisibleTreasures.count(n)].min }
      hTFinal = (hTType & @specificHiddenTreasures).flat_map { |n| [n]*[hTType.count(n), @specificHiddenTreasures.count(n)].min }
      bC = SpecificBadConsequence.new(@text, @levels, vTFinal, hTFinal)
    end
    
    def to_s
      super + "\n Tesoros visibles perdidos: #{@specificVisibleTreasures}\n Tesoros ocultos perdidos: #{@specificHiddenTreasures}"
    end
    
    def malRolloString
      super + "\n Tesoros visibles perdidos: #{@specificVisibleTreasures}\n Tesoros ocultos perdidos: #{@specificHiddenTreasures}"
    end
    
  end
end

=begin
  def adjustToFitTreasureLists(v, h) 
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

# end specific_bad_consequence.rb