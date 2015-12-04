require 'byebug'

class Tile

  attr_accessor :hidden, :flagged

  def initialize(bomb = false, position)
    @bomb = bomb
    @hidden = true
    @flagged = false
    @position = position
  end

  def neighbors
    
  end

  def reveal!
    self.hidden = false
  end

  def hidden?
    @hidden
  end

  def flagged?
    @flagged
  end

  def bomb?
    @bomb
  end



end
