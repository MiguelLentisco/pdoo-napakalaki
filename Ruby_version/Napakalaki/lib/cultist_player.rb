# encoding: utf-8
# begin cultist_player.rb

require_relative 'player'
require_relative 'cultist'

module NapakalakiGame
  class CultistPlayer < Player
    
    # Nº de jugadores sectarios en la partida
    @@totalCultistPlayers = 0
    
    def initialize(p, c)
      # Llamar constructor de arriba ??? => super pero ....
    
      @@totalCultistPlayers += 1
      @myCultistCard = c
    end
    
    def self.getTotalCultistPlayers
      @@totalCultistPlayers
    end
    
    def self.totalCultistPlayers
      @@totalCultistPlayers
    end
    
    def getCombatLevel
      (super * 1.7 + @myCultistCard.getGainedLevels * @@totalCultistPlayers).round
    end
    
    def getOponentLevel(m)
      m.getCombatLevelAgainstCultistPlayer
    end
    
    def shouldConvert
      false
    end
    
    def giveMeATreasure
      @visibleTreasures.delete(@visibleTreasures.sample)
    end
    
    def canYouGiveMeATreasure
      !getHiddenTreasures.empty?
    end
    
    protected :getCombatLevel
    protected :getOponentLevel
    protected :shouldConvert
    private :giveMeATreasure
    private :canYouGiveMeATreasure
    
  end
end

# end cultist_player.rb