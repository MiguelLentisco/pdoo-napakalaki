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

    # Crea todos los jugadores con los nombres pasados en el array
    def initPlayers(names)
      names.each { |name| @players << Player.new(name) }
    end

    # Devuelve y actualiza el jugador al que le toca jugar
    def nextPlayer
      indice = -1
      if @currentPlayer == nil
        indice = rand(@players.size)
      else
        indice = @players.index(@currentPlayer)
        if indice < @players.size - 1
          indice += 1
        else
          indice = 0
        end
      end
      @currentPlayer = @players[indice]
    end

    # Si se puede pasar al siguiente turno
    def nextTurnAllowed
      if @currentPlayer == nil
        true
      else
        @currentPlayer.validState
      end
    end

    # Establece aleatoriamente los archienemigos de los jugadores
    def setEnemies
      @players.each { |player| 
        indice = @players.index(player)
        var = rand(@players.size)
        while indice == var
          var = rand(@players.size)
        end
        player.setEnemy(@players[var])
      }
    end

    # Desarrolla el combate
    def developCombat
      combatResult = @currentPlayer.combat(@currentMonster)
      @dealer.giveMonsterBack(@currentMonster)
      combatResult
    end

    # Descarta los tesoros visibles del jugador
    def discardVisibleTreasures(treasures)
      treasures.each {
        |treasure|
        @currentPlayer.discardVisibleTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      }
    end

    # Descarta los tesoros ocultos del jugador
    def discardHiddenTreasures(treasures)
      treasures.each {
        |treasure|
        @currentPlayer.discardHiddenTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      }
    end

    # Hace visible todos los tesoros que se pasan
    def makeTreasuresVisible(treasures)
      treasures.each { |t| @currentPlayer.makeTreasureVisible(t) }
    end

    # Inicia el juego
    def initGame(players)
      initPlayers(players)
      setEnemies
      @dealer.initCards
      nextTurn
    end

    # Pasa al siguiente turno
    def nextTurn
      stateOK = nextTurnAllowed
      if stateOK
        @currentMonster = @dealer.nextMonster
        @currentPlayer = nextPlayer
        dead = @currentPlayer.isDead
        if dead
          @currentPlayer.initTreasures
        end
      end
      stateOK
    end

    # Si ha acabado la partida
    def endOfGame(result)
      result == CombatResult::WINGAME
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