class Grid
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
    @impassable_squares = Set.new
  end

  def make_impassable(square)
    @impassable_squares.add(square)
  end

  def passable?(square)
    !@impassable_squares.include?(square)
  end

  def square_at(x, y)
    return nil if x < 0 || y < 0 || x >= width || y >= height
    Square.new(x, y, self)
  end
end
