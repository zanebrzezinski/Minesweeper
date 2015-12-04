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

  def reveal(pos)
    queue = [self[pos]]
    previously_seen = []

    until queue.empty?
    tile = queue.shift
    previously_seen << tile

    next if tile.flagged?

      if tile.neighbor_bomb_count > 0 || tile.bomb?
        tile.reveal!
        render
      else
        tile.reveal!
        queue += tile.neighbors.reject {|tile| previously_seen.include?(tile)}
        render
      end

    end

  end

  def render
    system("clear")
    puts
    grid.each do |row|
      p row
    end
  end

  def won?
    grid.all? do |row|
      row.all? { |tile| tile.bomb? ? next : tile.revealed? }
    end
  end

  def lost?
    bomb_positions.any? { |tile| tile.revealed? }
  end

end

if __FILE__ == $PROGRAM_NAME
  board = Board.new(9)
  board.render

  print "Pos:"
  board.reveal(gets.chomp.split(",").to_a.map(&:to_i))
end
