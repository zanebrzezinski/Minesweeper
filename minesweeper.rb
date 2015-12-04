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
      board.flag(parse_input(input[2..-1]))
    else
      board.reveal(parse_input(input))
    end
  end

  def parse_input(pos)
    new_position = pos.split(",").to_a.map(&:to_i)
    new_position.map { |el| el - 1 }
  end

end

MineSweeper.new
