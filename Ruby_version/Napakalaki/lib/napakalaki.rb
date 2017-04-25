# encoding: utf-8
#begin napakalaki.rb

require 'singleton'
require_relative 'card_dealer'         # Incluye monster y treasure
require_relative 'cultist_player'      # Incluye combat_result, dice, cultist y player

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
      names.each { |name| @players << Player.newPlayer(name) }
    end

    # Devuelve y actualiza el jugador al que le toca jugar
    def nextPlayer
      if @currentPlayer == nil
        @currentPlayer = @players.sample
      elsif @currentPlayer == @players.last
        @currentPlayer = @players.first
      else
        @currentPlayer = @players[@players.index(@currentPlayer) + 1]
      end
    end

    # Si se puede pasar al siguiente turno
    def nextTurnAllowed
      @currentPlayer == nil or @currentPlayer.validState
    end

    # Establece aleatoriamente los archienemigos de los jugadores
    def setEnemies
      @players.each do |player|
        enemy = @players.sample
        while player == enemy do
          enemy = @players.sample
        end
        player.setEnemy(enemy)
      end
    end

    # Desarrolla el combate
    def developCombat
      combatResult = @currentPlayer.combat(@currentMonster)
      if combatResult == CombatResult::LOSEANDCONVERT
        cultistCard = @dealer.nextCultist
        newCultist = CultistPlayer.new(@currentPlayer, cultistCard)
        @players.each do |player|
          if player.getName == @currentPlayer.name
            player.setEnemy(newCultist)
          end
        end
        index = @players.index(@currentPlayer)
        @currentPlayer = newCultist
        @players[index] = newCultist
      end
      @dealer.giveMonsterBack(@currentMonster)
      combatResult
    end

    # Descarta los tesoros visibles del jugador
    def discardVisibleTreasures(treasures)
      treasures.each do |treasure|
        @currentPlayer.discardVisibleTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      end
    end

    # Descarta los tesoros ocultos del jugador
    def discardHiddenTreasures(treasures)
      treasures.each do |treasure|
        @currentPlayer.discardHiddenTreasure(treasure)
        @dealer.giveTreasureBack(treasure)
      end
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
        if @currentPlayer.isDead
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