class Tower
  attr_reader :square
  # damage

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "media/tower.png", false)
    @square = window.grid.square_at(rand(window.grid.width), window.grid.height - 3)
    @x, @y = window.position_for(@square)
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
