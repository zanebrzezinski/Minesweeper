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

  def initialize(position, board_size, bomb = false)
    @bomb = bomb
    @hidden = true
    @flagged = false
    @position = position
    @board_size = board_size
  end

  def neighbors


    neighbors = DELTAS.map do |delta|
                        new_position = [
                          self.position[0] + delta[0],
                          self.position[1] + delta[1]
                        ]
    end.select { |el| in_bounds?(el) }

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
