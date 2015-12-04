require_relative 'tile'

class Board

  attr_reader :size, :bomb_num, :grid, :bomb_positions

  def initialize(size, bomb_num = nil)
    @size = size
    @bomb_num ||= size
    @bomb_positions = []
    make_grid
  end

  def make_grid
    @grid = Array.new(size) {Array.new(size)}
    populate(grid)
  end

  def populate(grid)
    bombs = bomb_locations

    grid.each_with_index do |row, y|
      row.each_with_index do |el, x|
        if bombs.include?([x, y])
          self[[x, y]] = Tile.new([x, y], self, true)
        else
          self[[x, y]] = Tile.new([x, y], self)
        end
      end
    end
  end

  def bomb_locations
    until bomb_positions.size == bomb_num
      new_position = [rand(size), rand(size)]
      unless bomb_positions.include?(new_position)
        bomb_positions << new_position
      end
    end
    bomb_positions
  end

  def [](pos)
    x, y = pos
    grid[y][x]
  end

  def []=(pos, value)
    x, y = pos
    grid[y][x] = value
  end

  def render
    system("clear")
    puts
    grid.each do |row|
      p row
    end
  end

  def won?

  end

  def lost?

  end
  
end
