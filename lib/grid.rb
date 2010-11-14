class Grid
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @impassable_squares = Set.new
  end

  def make_impassable(x, y)
    @impassable_squares.add(Square.new(x, y, self))
  end

  def passable?(square)
    !@impassable_squares.include?(square)
  end

  def square_at(x, y)
    return nil if x < 0 || y < 0 || x >= width || y >= height
    Square.new(x, y, self)
  end

  class Square < AStarNode
    attr_reader :x, :y, :grid

    def initialize(x, y, grid)
      @x = x
      @y = y
      @grid = grid
    end

    def passable?
      @grid.passable?(self)
    end

    def neighbors
      result = []
      ((x - 1)..(x + 1)).each do |new_x|
        ((y - 1)..(y + 1)).each do |new_y|
          result << @grid.square_at(new_x, new_y)
        end
      end
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
end
