# encoding: utf-8
#begin napakalaki.rb

require 'singleton'

class Napakalaki
  include Singleton
  
  #attr_reader :currentPlayer
  #attr_reader :currentMonster
  
  def initialize
    @currentPlayer = nil
    @players = []
    @currentMonster = nil
    @dealer = CardDealer.instance
  end
  
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
  
  def getCurrentPlayer
    @currentPlayer
  end
  
  def getCurrentMonster
    @currentMonster
  end
  
  private :initPlayers
  private :nextPlayer
  private :nextTurnAllowed
  private :setEnemies
  
end

# end napakalaki.rb