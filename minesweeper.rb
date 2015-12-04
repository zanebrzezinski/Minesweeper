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
    board.render
    until board.lost? || board.won?
      get_input
    end

    board.lost? ? puts("LOSER!!!!!") : puts("YOU ARE SEXY!")

  end

  def get_input
    puts "Enter Position (start with \"F\" to flag)"
    input = gets.chomp.downcase
    if input[0] == "f"
      board.flag(input[2..-1].split(",").to_a.map(&:to_i))
    else
      board.reveal(input.split(",").to_a.map(&:to_i))
    end
  end


end

MineSweeper.new
