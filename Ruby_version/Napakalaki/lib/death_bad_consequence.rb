# encoding: utf-8
# begin death_bad_consequence.rb

require_relative 'numeric_bad_consequence'

module NapakalakiGame
  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(t)
      super(t, Player.MAXLEVEL, @@MAXTREASURES, @@MAXTREASURES)
    end
    
    def to_s
      "\nDescripción: #{@text}\n Estás muerto.\n"
    end
    
    def malRolloString
      "\n Muerte: pierdes todos los tesoros."
    end
    
  end
end

# end death_bad_consequence.rb