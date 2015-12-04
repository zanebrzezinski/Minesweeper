require_relative 'tiles'
class Board

  attr_reader :size, :bomb_num

  def initialize(size, bomb_num = nil)
    @size = size
    @grid = make_grid
    @bomb_num ||= size
  end

  def make_grid
    @grid = Array.new(size) {Array.new(size)}
    populate(grid)
  end

  def populate(grid)
    grid.each do |row|
      row.each do |el|
        
  end

  def bomb_locations
    bomb_positions = []
    until bomb_positions.size == bomb_num
      new_position = [rand(size), rand(size)]
      unless bomb_positions.include?(new_position)
        bomb_positions << new_position
      end
    end
  end

end
