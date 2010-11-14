class Tower
  def initialize(window, square)
    @window = window
    @square = square
    @image  = Gosu::Image.new(window, "media/wall.png", false)
    window.grid.make_impassable(@square)
  end

  def draw
    @image.draw_rot(@square.real_x, @square.real_y, 1, 0)
  end
end