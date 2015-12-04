require_relative 'board'

class MineSweeper

  def initialize
    @board = Board.new(*get_values)
  end

  def get_values
    puts "Enter board size:"
    size = gets.to_i
    puts "Enter bomb number:"
    bombs = gets.to_i
    [size, bombs]
  end

  def play
    
  end

end
