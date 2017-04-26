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
    def initialize(t, l)
      @text = t
      @levels = l
    end
    
    # Bad_consequence debe de ser abstracto ? => vacio? => prohibido hacer new?

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
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------
    
    # Deberiamos quitarlo o dejarlo asi ?
    def isEmpty
      true
    end

    # Fuera esto?
    def substractVisibleTreasure(t)
      nil
    end

    def substractHiddenTreasure(t)
      nil
    end
    
    def adjustToFitTreasureLists(v, t)
      nil
    end

    # Convierte a string
    def to_s
      message = "\nDescripción: #{@text}"
      if @levels > 0
        message += "\n Niveles perdidos: #{@levels}"
      end
      message
    end
    
    # Imprime solo el mal rollo
    def malRolloString
      message = ""
      if @levels > 0
        message += "\n Niveles perdidos: #{@levels}"
      end
      message
    end
    
    # -------------------------------------------------------
  end
end

# end bad_consequence-rb