require_relative 'board'

class MineSweeper

  attr_reader :board
  
  def initialize
    @board = Board.new(*get_values)
    play
  end

  def get_values
    puts "Enter board size:"
    size = gets.to_i
    puts "Enter bomb number:"
    bombs = gets.to_i
    [size, bombs]
  end

  def play

    until board.lost? || board.won?
      get_input
    end

  end

  def get_input(flagged = nil)
    input = gets.chomp.downcase
    if input == "f"
      board.flag
    else
      board.reveal(input.split(",").to_a.map(&:to_i))
    end
  end


end

MineSweeper.new
