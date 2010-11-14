class Enemy
  def initialize(window)
    @window = window
    @image  = Gosu::Image.new(window, "media/enemy.png", false)
    @square = window.grid.square_at(0, 0)
    @cost, @path = @square.path_to(@window.fortress.square)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @previous = Time.now - 1
  end

  def update
    if @path.empty?
      @window.enemies.delete(self)
    elsif (now  = Time.now) > @previous + 0.5
      @previous = now
      @square   = @path.shift
      @x, @y    = @window.position_for(@square)
    end
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle, 0.5, 0.5, 0.25, 0.25)
  end
end
