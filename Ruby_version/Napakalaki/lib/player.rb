# encoding: utf-8
# begin player.rb

class Player
  @@MAX_LEVEL = 10
  
  attr_reader :name
  attr_reader :level
  attr_reader :visibleTreasures
  attr_reader :hiddenTreasures
  attr_writter :enemy
  
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
  
  def getCombatLevel
    bonus = @level
    visibleTreasures.each {|treasure| bonus += treasure.bonus }
    bonus
  end
  
  def incrementLevels(l)
    @level += l
  end
  
  def decrementLevels(l)
    @level -= l
  end
  
  def applyPrize(m)
    
  end
  
  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)
    
  end
  
  #Es muy posible que esto pete fuerte
  def howManuVisibleTreasures(tKind)
    var = 0
    @visibleTreasures.each { |treasure| 
      if treasure.type == tKind
        var += 1
      end
    }
    var
  end
  
  def dieIfNoTreasures 
    @dead = true
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
  
  private_class_method :bringToLife
  private_class_method :getCombatLevel
  private_class_method :incrementLevels
  private_class_method :decrementLevels
  private_class_method :setPendingBadConsequence
  private_class_method :applyPrize
  private_class_method :applyBadConsequence
  private_class_method :canMakeTreasureVisible
  private_class_method :howManyVisibleTreasures
  private_class_method :dieIfNoTreasure
  private_class_method :giveMeATreasure
  private_class_method :canYouGiveMeATreasure
  private_class_method :haveStolen
  
end

# end player.rb