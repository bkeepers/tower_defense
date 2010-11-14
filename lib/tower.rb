class Tower
  # damage

  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "media/tower.png", false)
    @x = rand(@window.width - 20) + 10
    @y = @window.height - 60
  end

  def draw
    @image.draw_rot(@x, @y, 1, 0)
  end
end
