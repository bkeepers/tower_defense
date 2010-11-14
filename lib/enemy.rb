class Enemy
  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "media/enemy.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def update
    @x += 1
    @y += 1
    if @x > @window.width || @y > @window.height
      @window.enemies.delete(self)
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.25, 0.25)
  end
end
