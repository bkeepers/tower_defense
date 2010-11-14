class Square < AStarNode
  attr_reader :x, :y, :grid

  def initialize(x, y, grid)
    @x = x
    @y = y
    @grid = grid
  end

  def real_x
    x * 20
  end

  def real_y
    y * 20
  end

  def passable?
    @grid.passable?(self)
  end

  def neighbors
    result = [
      @grid.square_at(x,     y - 1),
      @grid.square_at(x - 1, y    ),
      @grid.square_at(x + 1, y    ),
      @grid.square_at(x,     y + 1),
    ]
    result.delete_if {|square| square.nil? || !square.passable?}
    result
  end

  def guess_distance(square)
    (x - square.x).abs + (y - square.y).abs
  end

  def hash
    (x << 16) | y
  end

  def eql?(obj)
    obj.is_a?(Square) && obj.x == x && obj.y == y && obj.grid == grid
  end
  alias_method :==, :eql?

  def inspect
    "(#{x},#{y})"
  end
end
