# encoding: utf-8
# begin cultist.rb

module NapakalakiGame
  class Cultist
    def initialize(name, gainedLevels)
      @name = name
      @gainedLevels = gainedLevels
    end
    
    def getGainedLevels
      @gainedLevels
    end
  end
end


# end cultist.rb