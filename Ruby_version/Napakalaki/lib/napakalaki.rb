# encoding: utf-8
#begin napakalaki.rb

require 'singleton'
require_relative 'card_dealer' # Incluye monster y treasure
require_relative 'player'      # Incluye combat_result y dice

module NapakalakiGame
  # Clase Napakalaki que representa el control principal del juego
  class Napakalaki
    include Singleton
    
    # Attr / datos miembro
    # -------------------------------------------------------
    
    #attr_reader :currentPlayer       # Jugador con el turno actual
    #attr_reader :currentMonster      # Monstruo en el turno actual
    #attr_reader :players             # Todos los jugadores
    #attr_reader :dealer              # El repartidor de cartas
    
    # -------------------------------------------------------
    
    # Constructor
    # -------------------------------------------------------

    def initialize
      @currentPlayer = nil
      @players = []
      @currentMonster = nil
      @dealer = CardDealer.instance
    end
    
    # -------------------------------------------------------
    
    # Consultores
    # -------------------------------------------------------
    
    def getCurrentPlayer
      @currentPlayer
    end

    def getCurrentMonster
      @currentMonster
    end
    
    # -------------------------------------------------------
    
    # Métodos
    # -------------------------------------------------------

    def initPlayers(names)

    end

    def nextPlayer

    end

    def nextTurnAllowed

    end

    def setEnemies

    end

    def developCombat

    end

    def discardVisibleTreasures(treasures)

    end

    def discardHiddenTreasures(treasures)

    end

    def makeTreasuresVisible(treasures)

    end

    def initGame(players)

    end

    def nextTurn

    end

    def endOfGame(result)

    end

    # -------------------------------------------------------
    
    # Métodos privados
    # -------------------------------------------------------

    private :initPlayers
    private :nextPlayer
    private :nextTurnAllowed
    private :setEnemies
    
    # -------------------------------------------------------
  end
end

# end napakalaki.rb