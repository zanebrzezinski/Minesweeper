require 'byebug'

class Tile

  attr_accessor :hidden?, :flag?

  def initialize(bomb = false)
    @bomb? = bomb
    @hidden? = true
    @flagged? = false
  end

  def reveal
    

  end



end
