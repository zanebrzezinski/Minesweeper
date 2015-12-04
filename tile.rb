require 'byebug'

class Tile

  DELTAS = [
    [ 0, 1],
    [ 1, 1],
    [ 1, 0],
    [ 1,-1],
    [ 0,-1],
    [-1,-1],
    [-1, 0],
    [-1, 1]
  ]


  attr_accessor :hidden, :flagged
  attr_reader :board_size, :position
  
  def initialize(bomb = false, position, board_size)
    @bomb = bomb
    @hidden = true
    @flagged = false
    @position = position
    @board_size = board_size
  end

  def neighbors

    neighbors = []


  end

  def in_bounds?(position)

    position.all? { |el| el.between?(0, board_size - 1)}

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
