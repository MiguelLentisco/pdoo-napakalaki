# encoding: utf-8
# begin player.rb

class Player
  @@MAX_LEVEL = 10
  
  #attr_reader :name
  #attr_reader :level
  #attr_reader :visibleTreasures
  #attr_reader :hiddenTreasures
  #attr_writter :enemy
  
  def initialize(name)
    @name = name
    @level = 1
    @dead = true
    @canISteal = true
    @enemy = nil
    @visibleTreasures = []
    @hiddenTreasures = []
    @pendingBadConsequence = nil
  end
 
  def bringToLife
    @dead = false
  end
  
  def incrementLevels(l)
    @level += l
    if (@level > 10)
      @level = 10
    end
  end
  
  def decrementLevels(l)
    @level -= l
    if (@level < 1)
      @level = 1
    end
  end
  
  def applyPrize(m)
    
  end
  
  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  #Es muy posible que esto pete fuerte
  def howManyVisibleTreasures(tKind)
    var = 0
    @visibleTreasures.each { |treasure| 
      if treasure.type == tKind
        var += 1 
      end
    }
    var
  end
  
  def dieIfNoTreasures
    if (@visibleTreasures.empty? and @hiddenTreasures.empty?)
      @dead = true
    end
  end
  
  def isDead
    @dead
  end
  
  def combat(m)
    
  end
  
  def makeTreasureVisible(t)
  
  end
  
  def discardVisibleTreasure(t)
    
  end
  
  def discardHiddenTreasure(t)
    
  end
  
  def validState
    @pendingBadConsequence.isEmpty and
      @hiddenTreasures.size < 4
  end
  
  def initTreasures
    
  end
  
  def stealTreasure
    
  end
  
  def giveMeATreasure
    
  end
  
  def canISteal
    @canISteal
  end
  
  def canYouGiveMeATreasure
    !nVisible.empty?
  end
  
  def haveStolen
    @canISteal = false
  end
  
  def discardAllTreasures
    
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence = b
  end
  
  def getName
    @name
  end
  
  def getHiddenTreasures
    @hiddenTreasures
  end
  
  def getVisibleTreasures
    @visibleTreasures
  end
  
  def getLevels
    @level
  end
  
  def getCombatLevel
    bonus = @level
    visibleTreasures.each {|treasure| bonus += treasure.bonus }
    bonus
  end
  
  
  
  private :bringToLife
  private :getCombatLevel
  private :incrementLevels
  private :decrementLevels
  private :setPendingBadConsequence
  private :applyPrize
  private :applyBadConsequence
  private :canMakeTreasureVisible
  private :howManyVisibleTreasures
  private :dieIfNoTreasure
  private :giveMeATreasure
  private :canYouGiveMeATreasure
  private :haveStolen
  
end

# end player.rb