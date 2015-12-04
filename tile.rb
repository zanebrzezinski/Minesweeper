require 'byebug'

class Tile

  DELTAS = [
    [ 0,  1],
    [ 1,  1],
    [ 1,  0],
    [ 1, -1],
    [ 0, -1],
    [-1, -1],
    [-1,  0],
    [-1,  1]
  ]


  attr_accessor :hidden, :flagged
  attr_reader :board, :position, :bomb

  def initialize(position, board, bomb = false)
    @bomb = bomb
    @hidden = true
    @flagged = false
    @position = position
    @board = board
  end

  def neighbors
    neighbors = DELTAS.map do |delta|
      new_position = [
        self.position[0] + delta[0],
        self.position[1] + delta[1]
      ]
    end.select { |el| in_bounds?(el) }

    neighbors.map! {|pos| board[pos]}
  end

  def neighbor_bomb_count
    neighbors.count { |tile| tile.bomb == true }
  end

  def in_bounds?(position)

    position.all? { |el| el.between?(0, board.size - 1)}

  end

  def reveal!
    self.hidden = false
  end

  def hidden?
    @hidden
  end

  def revealed?

    !hidden?

  end

  def flagged?
    @flagged
  end

  def bomb?
    @bomb
  end

  def inspect
    if hidden?
      if flagged?
        "F".g
      elsif bomb?
        "B".red
      else
        "#{neighbor_bomb_count}".gray
      end
    else
      if bomb?
        "B".red
      else
        "#{neighbor_bomb_count}".green
      end
    end
  end



end

class String
def black;          "\e[30m#{self}\e[0m" end
def red;            "\e[31m#{self}\e[0m" end
def green;          "\e[32m#{self}\e[0m" end
def brown;          "\e[33m#{self}\e[0m" end
def blue;           "\e[34m#{self}\e[0m" end
def magenta;        "\e[35m#{self}\e[0m" end
def cyan;           "\e[36m#{self}\e[0m" end
def gray;           "\e[37m#{self}\e[0m" end

def bg_black;       "\e[40m#{self}\e[0m" end
def bg_red;         "\e[41m#{self}\e[0m" end
def bg_green;       "\e[42m#{self}\e[0m" end
def bg_brown;       "\e[43m#{self}\e[0m" end
def bg_blue;        "\e[44m#{self}\e[0m" end
def bg_magenta;     "\e[45m#{self}\e[0m" end
def bg_cyan;        "\e[46m#{self}\e[0m" end
def bg_gray;        "\e[47m#{self}\e[0m" end

def bold;           "\e[1m#{self}\e[22m" end
def italic;         "\e[3m#{self}\e[23m" end
def underline;      "\e[4m#{self}\e[24m" end
def blink;          "\e[5m#{self}\e[25m" end
def reverse_color;  "\e[7m#{self}\e[27m" end
end
